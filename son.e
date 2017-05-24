note
	description: "Objet pour l'ensemble des effets sonores du jeu."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170419"

class
	SON

inherit
	AUDIBLE
		rename
			make as make_audible
		end

create
	make_rifle_sound,
	make_knife_sound,
	make_pistol_sound,
	make_reload_sound

feature {NONE} -- Initialisation

	make_rifle_sound
			-- Initialise `Current'.
		do
			make_audible ("includes/audio/RIFLE_SHOT.wav")
		end

	make_knife_sound
			-- Initialise `Current'.
		do
			make_audible ("includes/audio/KNIFE_SLASH.wav")
		end

	make_pistol_sound
			-- Initialise `Current'.
		do
			make_audible ("includes/audio/PISTOL_SHOT.wav")
		end

	make_reload_sound
			-- Initialise `Current'.
		do
			make_audible ("includes/audio/RELOAD.wav")
		end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
