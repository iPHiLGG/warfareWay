note
	description: "Summary description for {JEU}."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	ENGIN

inherit
	GAME_LIBRARY_SHARED
	AUDIO_LIBRARY_SHARED
	MPG_LIBRARY_SHARED
	TEXT_LIBRARY_SHARED

create
    make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'
		local
			l_icon_image:GAME_IMAGE_BMP_FILE
			l_icon:GAME_SURFACE
			l_window_builder:GAME_WINDOW_RENDERED_BUILDER
		do
			create l_icon_image.make ("includes/images/icon.bmp")
			if l_icon_image.is_openable then
				l_icon_image.open
				if l_icon_image.is_open then
					create l_icon.share_from_image (l_icon_image)
					l_icon.set_transparent_color (create {GAME_COLOR}.make_rgb (255, 0, 255))
					window.set_icon (l_icon)
				else
					print("Cannot set the window icon.")
				end
			end
			create l_window_builder
			l_window_builder.set_dimension (800, 600)
			l_window_builder.set_title ("Warfare Way")
			l_window_builder.enable_must_renderer_synchronize_update
			window := l_window_builder.generate_window
			text_library.enable_text
			create font.make ("includes/fonts/Lobster-Regular.ttf", 20)
			if font.is_openable then
				font.open
			end

			create test_image.make (window.renderer, "includes/images/background.jpg")
			create test_minimap.make (window.renderer, "includes/images/minimap.jpg")
		end

feature -- Access

	start_game
			-- Partir le jeu
		local
		do
			game_library.quit_signal_actions.extend (agent on_quit)
			window.renderer.draw_texture (test_image, 0, 0)
			window.key_pressed_actions.extend (agent on_key_pressed)
			window.key_released_actions.extend (agent on_key_released)
			game_library.iteration_actions.extend (agent on_iteration)
			if window.renderer.driver.is_present_synchronized_supported then
				game_library.launch_no_delay
			else
				game_library.launch
			end
		end

	window:GAME_WINDOW_RENDERED
			-- La fen�tre principale du jeu

	font:TEXT_FONT
			-- Utilis� pour cr�er du texte

	test_image:IMAGE
			-- Le fond de la fen�tre pour tester

	menu:MENU_PRINCIPAL
			-- Le menu principal du jeu

	test_minimap:IMAGE
			-- Une minimap pour tester les touches

feature {NONE} -- Implementation

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- �v�nement lorsqu'une touche est appuy�e
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_tab then
					window.renderer.draw_texture (test_minimap, 100, 75)
				end
			end
		end

	on_key_released(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- �v�nement lorsqu'une touche n'est plus appuy�e
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_tab then
					window.renderer.draw_texture (test_image, 0, 0)
				end
			end
		end

	on_iteration(a_timestamp:NATURAL_32)
			-- �v�nement qui s'ex�cute � chaque iteration
		do
			window.renderer.present
		end

	on_quit(a_timestamp: NATURAL_32)
			-- Appel� lorsque le 'X' est appuy� dans le coin
		do
			game_library.stop
		end

end
