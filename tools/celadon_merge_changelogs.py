import os
import sys
import yaml
import subprocess

# Paths relative to this script location
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
ROOT_DIR = os.path.abspath(os.path.join(SCRIPT_DIR, ".."))
ARCHIVE_DIR = os.path.join(ROOT_DIR, "html", "changelogs", "archive")

CONFLICT_START = "<<<<<<<"
CONFLICT_MID = "======="
CONFLICT_END = ">>>>>>>"

UPSTREAM_BRANCH_CMD = "novasector/master"

SKIP_BELOW_YEAR = 2025

def extract_conflict_blocks(content):
    blocks = []
    lines = content.splitlines()
    i = 0
    while i < len(lines):
        if lines[i].startswith("<<<<<<<"):
            conflict_start_line = lines[i]
            local_lines = []
            remote_lines = []
            i += 1
            while i < len(lines) and not lines[i].startswith("======="):
                local_lines.append(lines[i])
                i += 1
            conflict_mid_line = lines[i] if i < len(lines) else "======="
            i += 1
            while i < len(lines) and not lines[i].startswith(">>>>>>>"):
                remote_lines.append(lines[i])
                i += 1
            conflict_end_line = lines[i] if i < len(lines) else ">>>>>>>"
            i += 1
            blocks.append((conflict_start_line, "\n".join(local_lines), conflict_mid_line, "\n".join(remote_lines), conflict_end_line))
        else:
            i += 1
    return blocks

def load_upstream_yaml(file_rel_path):
    """
    Returns the content of the file from upstream/master branch as a string,
    or None if the file doesn't exist in upstream/master.
    """
    cmd = ['git', 'show', f'{UPSTREAM_BRANCH_CMD}:{file_rel_path}']
    try:
        result = subprocess.run(cmd, capture_output=True, text=True, check=True)
        return result.stdout
    except subprocess.CalledProcessError:
        # File not found in upstream/master or other error
        return None

def normalize_entry(entry):
    """
    Return a new entry dict with ':cl:' suffix removed from string values.
    Assumes entry is a dict with string values or values to preserve as-is.
    """
    if not isinstance(entry, dict):
        return entry  # if entry isn't a dict, return as is

    normalized = {}
    for k, v in entry.items():
        if not isinstance(v, str):
            normalized[k] = v
            continue
        if v.endswith('\n:cl:'):
            normalized[k] = v[:-len('\n:cl:')]
        elif v.endswith('\n/:cl'):
            normalized[k] = v[:-len('\n/:cl')]
        else:
            normalized[k] = v
    return normalized

def remove_duplicates_keep_latest(data):
    if not isinstance(data, dict):
        return data
    seen = set()
    result = dict()
    sorted_data = sorted(list(data.items()), key=lambda x:x[0], reverse=True)
    for date in sorted_data:
        filtered_per_date = dict()
        actual_date = date[0]
        contribs = date[1] # tuple
        for contrib, entries in contribs.items():
            contrib_entries_filtered = list()
            for entry in entries:
                for key in entry:
                    val = entry[key]
                    entry_key = contrib+key+val
                    if entry_key in seen:
                        print(f"Found duplicate entry - [{contrib} {key}: {val}]. Skip")
                        continue
                    seen.add(entry_key)
                    contrib_entries_filtered.append(entry)
            if len(contrib_entries_filtered) > 0:
                filtered_per_date[contrib] = contrib_entries_filtered
        if len(filtered_per_date) > 0:
            result[actual_date] = filtered_per_date

    return sorted(list(result.items()), key=lambda x:x[0], reverse=False) # no one really cares about O(N) in such files

def merge_yaml_dicts(local_dict, remote_dict):
    merged = dict(local_dict)  # copy top level

    # Merge remote into merged normally
    for date, remote_contribs in (remote_dict or {}).items():
        if date not in merged:
            merged[date] = {
                contrib: [normalize_entry(e) for e in entries]
                for contrib, entries in remote_contribs.items()
            }
        else:
            local_contribs = merged[date]
            for contrib, remote_entries in remote_contribs.items():
                if contrib not in local_contribs:
                    local_contribs[contrib] = [normalize_entry(e) for e in remote_entries]
                else:
                    existing = local_contribs[contrib]
                    normalized_existing = [normalize_entry(e) for e in existing]
                    for entry in remote_entries:
                        normalized_entry = normalize_entry(entry)
                        if normalized_entry not in normalized_existing:
                            existing.append(normalized_entry)
                            normalized_existing.append(normalized_entry)

    return merged

def merge_conflicted_file(filepath):
    with open(filepath, "r", encoding="utf-8") as f:
        content = f.read()

    conflict_blocks = extract_conflict_blocks(content)

    if not conflict_blocks:
        print(f"No conflict markers found in {filepath}, skipping.")
        return

    new_content = content
    for conflict_start, local_yaml, conflict_mid, remote_yaml, conflict_end in conflict_blocks:
        try:
            local_data = yaml.safe_load(local_yaml) or {}
            # DON'T CALL remove_duplicates_keep_latest OVER THERE!
            remote_data = yaml.safe_load(remote_yaml) or {}
        except yaml.YAMLError as e:
            print(f"YAML parse error in {filepath}: {e}")
            continue

        merged_data = merge_yaml_dicts(local_data, remote_data)
        merged_yaml_str = yaml.dump(merged_data, sort_keys=True, allow_unicode=True)

        conflict_text = (conflict_start + "\n" + local_yaml + "\n" + conflict_mid + "\n" + remote_yaml + "\n" + conflict_end)

        new_content = new_content.replace(conflict_text, merged_yaml_str.strip())

    with open(filepath, "w", encoding="utf-8") as f:
        f.write(new_content)

    print(f"Merged conflicts in {filepath}")

def main():
    if len(sys.argv) > 1:
        upstream_branch = sys.argv[1]
        if (upstream_branch): # ye almost no validation
            UPSTREAM_BRANCH_CMD = upstream_branch
            print(f"Using upstream branch: {UPSTREAM_BRANCH_CMD}")
    merged_any = False
    for filename in os.listdir(ARCHIVE_DIR):
        if not filename.endswith(".yml"):
            continue

        # Extract year from filename prefix: e.g., '2025-08.yml' -> 2025
        year_str = filename[:4]
        try:
            year = int(year_str)
        except ValueError:
            print(f"Skipping file with unexpected name format: {filename}")
            continue

        # Skip files before 2025
        if year < SKIP_BELOW_YEAR:
            continue

        local_path = os.path.join(ARCHIVE_DIR, filename)
        file_rel_path = os.path.relpath(local_path, ROOT_DIR).replace("\\", "/")

        merge_conflicted_file(local_path)
        with open(local_path, "r", encoding="utf-8") as f:
            local_content = f.read()

        upstream_content = load_upstream_yaml(file_rel_path)
        if upstream_content is None:
            print(f"Upstream version of {file_rel_path} not found, skipping.")
            continue

        local_data = yaml.safe_load(local_content) or {}
        local_data = remove_duplicates_keep_latest(local_data)
        upstream_data = yaml.safe_load(upstream_content) or {}

        merged_data = merge_yaml_dicts(local_data, upstream_data)

        # If merged data differs from local_data, write merged back
        if merged_data != local_data:
            with open(local_path, "w", encoding="utf-8") as f:
                yaml.dump(merged_data, f, sort_keys=True, allow_unicode=True)
            print(f"Merged changes into {filename}")
            merged_any = True
    if merged_any:
        return
    print("Not merged anything")

if __name__ == "__main__":
    main()
