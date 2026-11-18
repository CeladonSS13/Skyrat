/proc/genderize_ru(gender, male_word, female_word, neuter_word, multiple_word)
	return gender == MALE ? male_word : (gender == FEMALE ? female_word : (gender == NEUTER ? neuter_word : multiple_word))

/proc/pluralize_ru(gender, single_word, plural_word)
	return gender == PLURAL ? plural_word : single_word

/**
 * Replaces the `%(SINGLE,PLURAL)%` or `%(MALE,FEMALE,NEUTER,PLURAL)%` message piece accordingly to user gender.
 * Use `*` to deliberatly skip one genderize word.
 *
 * Arguments:
 * * user - Person which pronouns will be used.
 * * msg - The string to modify.
 *
 * Returns the modified msg string.
 */
/proc/genderize_decode(mob/living/carbon/target_user, msg)
	if(!ismob(target_user) || !istext(msg))
		stack_trace("Invalid arguments in genderize_decode proc.")
	while(TRUE)
		var/prefix = findtext_char(msg, "%(")
		if(!prefix)
			break
		var/postfix = findtext_char(msg, ")%")
		if(!postfix)
			stack_trace("Genderize string is missing proper ending, expected )%.")
		var/list/pieces = splittext(copytext_char(msg, prefix + 2, postfix), ",")
		switch(length(pieces))
			if(2)	// pluralize if only two parts present
				msg = replacetext(splicetext_char(msg, prefix, postfix + 2, pluralize_ru(target_user.gender, pieces[1], pieces[2])), "*", "")
			if(4)	// use full genderize if all four parts exist
				msg = replacetext(splicetext_char(msg, prefix, postfix + 2, genderize_ru(target_user.gender, pieces[1], pieces[2], pieces[3], pieces[4])), "*", "")
			else
				stack_trace("Invalid data sent to genderize_decode proc.")
	return msg
