#define MAX_MIND_MEMORY_SIZE_TO_ALLOW_NOTES 3000

/mob/verb/add_note_verb(msg_txt as message)
	set name = "Add Note"
	set category = "IC"

	if (!mind)
		to_chat(src, "The game appears to have misplaced your mind datum, so we can't show you your notes.")
		return

	if (!mind.memories_custom)
		to_chat(src, "Your custom memories are not yet initialized! This normally shouldn't happen")
		return

	msg_txt = copytext(msg_txt, 1, MAX_MESSAGE_LEN)
	msg_txt = sanitize_simple(html_encode(msg_txt), list("<br>" = "\n")) // so we actually WANT \n and not HTML in JS part

	var/combined = length(msg_txt)
	for (var/datum/memory/general_custom_memory/existing_memory in mind.memories_custom)
		combined += length(existing_memory.custom_desc)

	if(combined < MAX_MIND_MEMORY_SIZE_TO_ALLOW_NOTES)
		var/list/memory_creation_args = list(mind, custom_desc = msg_txt)
		var/datum/memory/general_custom_memory/created_memory = new /datum/memory/general_custom_memory(arglist(memory_creation_args))

		mind.memories_custom += created_memory
		return

	to_chat(src, "Your brain can't hold that much information!")

/proc/sanitize_simple(t, list/repl_chars = list("\n"="#","\t"="#")) // there's a sanitaze proc, but with this one we could specify replace characters
	for(var/char in repl_chars)
		t = replacetext(t, char, repl_chars[char])
	return t
