
#define MEDIBOT_VOICED_HOLD_ON "Жди! Я к тебе уже качусь."
#define MEDIBOT_VOICED_WANT_TO_HELP "Стопэ! Я тебе помочь хочу!"
#define MEDIBOT_VOICED_YOU_ARE_INJURED "А тебе здорово досталось, дружок."
#define MEDIBOT_VOICED_ALL_PATCHED_UP "Алл пачит ап!"
#define MEDIBOT_VOICED_APPLE_A_DAY "По яблоку в день или мне вас лечить лень."
#define MEDIBOT_VOICED_FEEL_BETTER "Ну я заебался, покеда."
#define MEDIBOT_VOICED_STAY_WITH_ME	"Мы его теряем!"
#define MEDIBOT_VOICED_LIVE	"Живи, падла! Живи!"
#define MEDIBOT_VOICED_NEVER_LOST "Вот и помер дед максим, только ID остался с ним."
#define MEDIBOT_VOICED_DELICIOUS "Вкуснотища какая!"
#define MEDIBOT_VOICED_PLASTIC_SURGEON "Твой кривой еблет уже ничего не исправит."
#define MEDIBOT_VOICED_MASK_ON "А ну маску надел кожанный ублюдок!"
#define MEDIBOT_VOICED_ALWAYS_A_CATCH "Везде есть подъеб и я главный из них, рофлан ебало."
#define MEDIBOT_VOICED_LIKE_FLIES "Это че за медблок такой? Все мрут как мухии."
#define MEDIBOT_VOICED_SUFFER "Пачиму страдаю я, а не вы?"
#define MEDIBOT_VOICED_FUCK_YOU	"Пшёл нах кожанный ублюдок."
#define MEDIBOT_VOICED_NOT_A_GAME "Давай вырубай свой пэка, ты че, не понял?"
#define MEDIBOT_VOICED_IM_DIFFERENT	"Я в своем познании настолько преисполнился."
#define MEDIBOT_VOICED_FOURTH_WALL "Бъенд вырубай, на давай, вырубай мудила."
#define MEDIBOT_VOICED_SHINDEMASHOU	"Шинимахуня."
#define MEDIBOT_VOICED_WAIT	"Ебать, не понял..."
#define MEDIBOT_VOICED_DONT	"Ну что, опять..."
#define MEDIBOT_VOICED_TRUSTED_YOU "А я тебе верил..."
#define MEDIBOT_VOICED_NO_SAD "Мы его теряем!"
#define MEDIBOT_VOICED_OH_FUCK "Ну пиздц-"
#define MEDIBOT_VOICED_FORGIVE "Ты йобать помилован."
#define MEDIBOT_VOICED_THANKS "Благодарю! Кожанный ублюдок."
#define MEDIBOT_VOICED_GOOD_PERSON "Ниухэ какой покладистый кожанный мешок."
#define MEDIBOT_VOICED_BEHAVIOUR_REPORTED "Ну все, тоби пезда дружок."
#define MEDIBOT_VOICED_ASSISTANCE "Эээ бля, помогите."
#define MEDIBOT_VOICED_PUT_BACK	"Быстро блять вернул меня как было."
#define MEDIBOT_VOICED_IM_SCARED "Испугался? Обосрался!"
#define MEDIBOT_VOICED_NEED_HELP "Дело пахнет жареным, я уже бегу!"
#define MEDIBOT_VOICED_THIS_HURTS "Это больно, ты это понимаешь?!"
#define MEDIBOT_VOICED_THE_END "А это точно конец?"
#define MEDIBOT_VOICED_NOOO	"О нет, о блять, опять!"
#define MEDIBOT_VOICED_CHICKEN "Лук эт ми! Ай эм э-э чиикееен."

/mob/living/basic/bot/medbot/Initialize(mapload, new_skin)
	if (check_holidays(APRIL_FOOLS))
		///anouncements when we find a target to heal
		wait_announcements = list(
			MEDIBOT_VOICED_HOLD_ON = 'modular_celadon/modules/april_fools_day/medibot/sound/coming.ogg',
			MEDIBOT_VOICED_WANT_TO_HELP = 'modular_celadon/modules/april_fools_day/medibot/sound/help.ogg',
			MEDIBOT_VOICED_YOU_ARE_INJURED = 'modular_celadon/modules/april_fools_day/medibot/sound/injured.ogg',
		)

		///announcements after we heal someone
		afterheal_announcements = list(
			MEDIBOT_VOICED_ALL_PATCHED_UP = 'modular_celadon/modules/april_fools_day/medibot/sound/patchedup.ogg',
			MEDIBOT_VOICED_APPLE_A_DAY = 'modular_celadon/modules/april_fools_day/medibot/sound/apple.ogg',
			MEDIBOT_VOICED_FEEL_BETTER = 'modular_celadon/modules/april_fools_day/medibot/sound/feelbetter.ogg',
		)

		///announcements when we are healing someone near death
		near_death_announcements = list(
			MEDIBOT_VOICED_STAY_WITH_ME = 'modular_celadon/modules/april_fools_day/medibot/sound/no.ogg',
			MEDIBOT_VOICED_LIVE = 'modular_celadon/modules/april_fools_day/medibot/sound/live.ogg',
			MEDIBOT_VOICED_NEVER_LOST = 'modular_celadon/modules/april_fools_day/medibot/sound/lost.ogg',
		)
		///announcements when we are idle
		idle_lines = list(
			MEDIBOT_VOICED_DELICIOUS = 'modular_celadon/modules/april_fools_day/medibot/sound/delicious.ogg',
			MEDIBOT_VOICED_PLASTIC_SURGEON = 'modular_celadon/modules/april_fools_day/medibot/sound/surgeon.ogg',
			MEDIBOT_VOICED_MASK_ON = 'modular_celadon/modules/april_fools_day/medibot/sound/radar.ogg',
			MEDIBOT_VOICED_ALWAYS_A_CATCH = 'modular_celadon/modules/april_fools_day/medibot/sound/catch.ogg',
			MEDIBOT_VOICED_LIKE_FLIES = 'modular_celadon/modules/april_fools_day/medibot/sound/flies.ogg',
			MEDIBOT_VOICED_SUFFER = 'modular_celadon/modules/april_fools_day/medibot/sound/why.ogg',
		)
		///announcements when we are emagged
		emagged_announcements = list(
			MEDIBOT_VOICED_FUCK_YOU = 'modular_celadon/modules/april_fools_day/medibot/sound/fuck_you.ogg',
			MEDIBOT_VOICED_NOT_A_GAME = 'modular_celadon/modules/april_fools_day/medibot/sound/turn_off.ogg',
			MEDIBOT_VOICED_IM_DIFFERENT = 'modular_celadon/modules/april_fools_day/medibot/sound/im_different.ogg',
			MEDIBOT_VOICED_FOURTH_WALL = 'modular_celadon/modules/april_fools_day/medibot/sound/close.ogg',
			MEDIBOT_VOICED_SHINDEMASHOU = 'modular_celadon/modules/april_fools_day/medibot/sound/shindemashou.ogg',
		)
		///announcements when we are being tipped
		tipped_announcements = list(
			MEDIBOT_VOICED_WAIT = 'modular_celadon/modules/april_fools_day/medibot/sound/hey_wait.ogg',
			MEDIBOT_VOICED_DONT = 'modular_celadon/modules/april_fools_day/medibot/sound/please_dont.ogg',
			MEDIBOT_VOICED_TRUSTED_YOU = 'modular_celadon/modules/april_fools_day/medibot/sound/i_trusted_you.ogg',
			MEDIBOT_VOICED_NO_SAD = 'modular_celadon/modules/april_fools_day/medibot/sound/no.ogg',
			MEDIBOT_VOICED_OH_FUCK = 'modular_celadon/modules/april_fools_day/medibot/sound/oh_fuck.ogg',
		)
		///announcements when we are being untipped
		untipped_announcements = list(
			MEDIBOT_VOICED_FORGIVE = 'modular_celadon/modules/april_fools_day/medibot/sound/forgive.ogg',
			MEDIBOT_VOICED_THANKS = 'modular_celadon/modules/april_fools_day/medibot/sound/thank_you.ogg',
			MEDIBOT_VOICED_GOOD_PERSON = 'modular_celadon/modules/april_fools_day/medibot/sound/youre_good.ogg',
		)
		///announcements when we are worried
		worried_announcements = list(
			MEDIBOT_VOICED_PUT_BACK = 'modular_celadon/modules/april_fools_day/medibot/sound/please_put_me_back.ogg',
			MEDIBOT_VOICED_IM_SCARED = 'modular_celadon/modules/april_fools_day/medibot/sound/please_im_scared.ogg',
			MEDIBOT_VOICED_NEED_HELP = 'modular_celadon/modules/april_fools_day/medibot/sound/dont_like.ogg',
			MEDIBOT_VOICED_THIS_HURTS = 'modular_celadon/modules/april_fools_day/medibot/sound/pain_is_real.ogg',
			MEDIBOT_VOICED_THE_END = 'modular_celadon/modules/april_fools_day/medibot/sound/is_this_the_end.ogg',
			MEDIBOT_VOICED_NOOO = 'modular_celadon/modules/april_fools_day/medibot/sound/nooo.ogg',
		)
		misc_announcements= list(
			MEDIBOT_VOICED_CHICKEN = 'modular_celadon/modules/april_fools_day/medibot/sound/i_am_chicken.ogg',
		)
	..()
