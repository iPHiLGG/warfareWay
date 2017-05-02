note
	description: "Objet pour g�rer le son du jeu."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170220"

deferred class
	AUDIBLE

inherit
	AUDIO_LIBRARY_SHARED
	MPG_LIBRARY_SHARED

feature {NONE} -- Initialisation
	make(a_namefile: STRING)
			-- Initialise `Current'
		do
			audio_library.enable_sound
			audio_library.sources_add
			source := audio_library.last_source_added
			source.gain := 0.1
			create sound.make(a_namefile)
			sound.open
		end

feature -- Acc�s

	source:AUDIO_SOURCE
			-- Source o� les sons seront par la suite jou�s.
	sound:AUDIO_SOUND_WAV_FILE
			-- Son � faire jouer

	play_music
			-- Permet de faire jouer la musique du jeu
	do
		source.queue_sound_infinite_loop (sound)
		source.play
	end

	play_sound
			-- Permet de faire jouer un son
	do
		source.queue_sound (sound)
		source.play
	end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
