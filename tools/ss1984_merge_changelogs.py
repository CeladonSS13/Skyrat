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
    """
    Extracts pairs of conflicting blocks from file content with git conflict markers.
    Returns a list of tuples (local_version, remote_version).
    """
    blocks = []
    lines = content.splitlines()
    i = 0
    while i < len(lines):
        if lines[i].startswith(CONFLICT_START):
            local_lines = []
            remote_lines = []
            i += 1
            while i < len(lines) and not lines[i].startswith(CONFLICT_MID):
                local_lines.append(lines[i])
                i += 1
            i += 1  # Skip =======
            while i < len(lines) and not lines[i].startswith(CONFLICT_END):
                remote_lines.append(lines[i])
                i += 1
            i += 1  # Skip >>>>>>>

            blocks.append(("\n".join(local_lines), "\n".join(remote_lines)))
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

def merge_yaml_dicts(local_dict, remote_dict):
    merged = dict(local_dict)  # copy top level

    for date, remote_contribs in (remote_dict or {}).items():
        if date not in merged:
            # Normalize all remote entries when adding new date
            merged[date] = {
                contrib: [normalize_entry(e) for e in entries]
                for contrib, entries in remote_contribs.items()
            }
        else:
            local_contribs = merged[date]
            for contrib, remote_entries in remote_contribs.items():
                if contrib not in local_contribs:
                    # Normalize all remote entries assigned here too
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

    # We will replace conflict blocks with merged content
    new_content = content
    for local_yaml, remote_yaml in conflict_blocks:
        try:
            local_data = yaml.safe_load(local_yaml) or {}
            remote_data = yaml.safe_load(remote_yaml) or {}
        except yaml.YAMLError as e:
            print(f"YAML parse error in {filepath}: {e}")
            continue

        merged_data = merge_yaml_dicts(local_data, remote_data)
        merged_yaml_str = yaml.dump(merged_data, sort_keys=True, allow_unicode=True)

        # Rebuild conflict marker block text to replace
        conflict_text = (CONFLICT_START + "\n" +
                         local_yaml + "\n" +
                         CONFLICT_MID + "\n" +
                         remote_yaml + "\n" +
                         CONFLICT_END)

        new_content = new_content.replace(conflict_text, merged_yaml_str.strip())

    # Write back merged file
    with open(filepath, "w", encoding="utf-8") as f:
        f.write(new_content)

    print(f"Merged conflicts in {filepath}")

def main():
    if len(sys.argv) > 1:
        upstream_branch = sys.argv[1]
        if (upstream_branch): # ye almost no validation
            UPSTREAM_BRANCH_CMD = upstream_branch
            print(f"Using upstream branch: {UPSTREAM_BRANCH_CMD}")
    MERGED_ANY = False
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

        with open(local_path, "r", encoding="utf-8") as f:
            local_content = f.read()

        upstream_content = load_upstream_yaml(file_rel_path)
        if upstream_content is None:
            print(f"Upstream version of {file_rel_path} not found, skipping.")
            continue

        local_data = yaml.safe_load(local_content) or {}
        upstream_data = yaml.safe_load(upstream_content) or {}

        merged_data = merge_yaml_dicts(local_data, upstream_data)

        # If merged data differs from local_data, write merged back
        if merged_data != local_data:
            with open(local_path, "w", encoding="utf-8") as f:
                yaml.dump(merged_data, f, sort_keys=True, allow_unicode=True)
            print(f"Merged changes into {filename}")
            MERGED_ANY = True
    if (not MERGED_ANY):
        print("Not merged anything")

if __name__ == "__main__":
    main()
