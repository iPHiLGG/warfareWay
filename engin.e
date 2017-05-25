note
	description: "Objet principal pour d�marrer le jeu."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170220"

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
			l_font:TEXT_FONT
		do
			create game_music.make
			game_music.play_music
			create l_icon_image.make ("includes/images/icon.bmp")
			create l_window_builder
			l_window_builder.set_dimension (800, 600)
			l_window_builder.set_title ("Warfare Way")
			l_window_builder.enable_must_renderer_synchronize_update
			window := l_window_builder.generate_window
			create l_font.make ("includes/fonts/Lobster-regular.ttf", 20)
			create cursor
			create online.make
			create {LINKED_LIST[AFFICHABLE]} viewable.make
			create player.make (window.renderer)
			player.set_x (30)
			player.set_y (30)
			create player_2.make (window.renderer)
			player_2.set_x (400)
			player_2.set_y (200)
			create ennemy.make (0,0, window.renderer)
			ennemy.set_x (270)
			ennemy.set_y (100)
			create map.make (window.renderer, "includes/images/complete_map.jpg")
			online.launch
			viewable.extend (map)
			viewable.append (map.walls_array)
			viewable.append (map.ennemy_array)
			viewable.extend (player)
			viewable.extend (player_2)
			viewable.extend (ennemy)
			if l_icon_image.is_openable then
				l_icon_image.open
				if l_icon_image.is_open then
					create l_icon.share_from_image (l_icon_image)
					l_icon.set_transparent_color (create {GAME_COLOR}.make_rgb (255, 0, 255))
					window.set_icon (l_icon)
				else
					print("Impossible de mettre une ic�ne de fen�tre.")
				end
			end
		end

feature -- Acc�s
	start_game
			-- Partir le jeu
		local
		do
			-- �v�nements du jeu
			game_library.quit_signal_actions.extend (agent on_quit)
			window.key_pressed_actions.extend (agent on_key_pressed)
			window.key_released_actions.extend (agent on_key_released)
			game_library.iteration_actions.extend (agent on_iteration)
			window.mouse_motion_actions.extend (agent cursor.on_mouse_move)
			if window.renderer.driver.is_present_synchronized_supported then
				game_library.launch_no_delay
			else
				game_library.launch
			end
		end

	window: GAME_WINDOW_RENDERED
			-- La fen�tre principale du jeu

	game_music:MUSIQUE
			-- Musique du jeu

	player:JOUEUR
			-- Personnage que l'utilisateur joue

	player_2:JOUEUR
			-- Le joueur adverse

	map:MAP
			-- La carte du jeu

	ennemy:ENNEMI
			-- Un ennemi de la carte

	cursor:CURSEUR
			-- Curseur du joueur

	online:MULTIJOUEUR
			-- Le module pour jouer en ligne

	viewable:CHAIN[AFFICHABLE]
			-- Objets � afficher dans le `window'

feature {NONE} -- Impl�mentation

	on_key_pressed(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- �v�nement lorsqu'une touche est appuy�e
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_a AND a_key_state.is_d then
					player.stop_left
					player.stop_right
				elseif a_key_state.is_a then
					player.go_left (a_timestamp)
				elseif a_key_state.is_d then
					player.go_right (a_timestamp)
				end
				if a_key_state.is_w AND a_key_state.is_s then
					player.stop_up
					player.stop_down
				elseif a_key_state.is_w then
					player.go_up (a_timestamp)
				elseif a_key_state.is_s then
					player.go_down (a_timestamp)
				end
				if a_key_state.is_r then
--					player.rifle.launch
					player.rifle.play_sound
				end
			end
		end

	on_key_released(a_timestamp: NATURAL_32; a_key_state: GAME_KEY_STATE)
			-- �v�nement lorsqu'une touche n'est plus appuy�e
		do
			if not a_key_state.is_repeat then
				if a_key_state.is_a AND player.going_left then
					player.stop_left
				elseif a_key_state.is_d AND player.going_right then
					player.stop_right
				elseif a_key_state.is_w AND player.going_up then
					player.stop_up
				elseif a_key_state.is_s AND player.going_down then
					player.stop_down
				end
			end
		end

	on_iteration(a_timestamp: NATURAL_32)
			-- �v�nement qui s'ex�cute � chaque iteration
		local
			l_position_x : INTEGER_32
			l_position_y : INTEGER_32
		do
			l_position_x := player.x
			l_position_y := player.y
			window.renderer.clear
			player.update (a_timestamp)
			player.calculate_angle (cursor)
			ennemy.calculate_angle (player)
			across map.walls_array as la_walls loop
				if player.valide_collision (la_walls.item)then
					if player.going_down then
						player.stop_down
					end
					if player.going_left then
						player.stop_left
					end
					if player.going_right then
						player.stop_right
					end
					if player.going_up then
						player.stop_up
					end
					player.x := l_position_x
					player.y := l_position_y
				end
			end
			move_walls
			show_viewable
			window.renderer.present
			audio_library.update
		end

	on_quit(a_timestamp: NATURAL_32)
			-- Appel� lorsque le 'X' est appuy� dans le coin
		do
			game_library.stop
		end

	can_go_up:BOOLEAN
			-- Le `player' peut aller en haut.
		do
			Result := map.y - map.velocity >= 0
		end

	can_go_down:BOOLEAN
			-- Le `player' peut aller en bas.
		do
			Result := map.y + window.renderer.output_size.height + map.velocity < map.height
		end

	can_go_left:BOOLEAN
			-- Le `player' peut aller � gauche.
		do
			Result := map.x - map.velocity >= 0
		end

	can_go_right:BOOLEAN
			-- Le `player' peut aller � droite.
		do
			Result := map.x + window.renderer.output_size.width + map.velocity < map.width
		end

feature {NONE} -- Initialisation

	move_walls
			-- Permet de bouger les murs de la map selon le mouvement du personnage
		do
			across map.walls_array as la_wall loop
				if player.going_right AND player.x <= 1200 AND player.y > 0 then
					la_wall.item.set_x (la_wall.item.x - player.speed)
				end
				if player.going_left AND player.x > 0 AND player.y > 0 then
					la_wall.item.set_x (la_wall.item.x + player.speed)
				end
				if player.going_up AND player.x > 0 AND player.y > 0  then
					la_wall.item.set_y (la_wall.item.y + player.speed)
				end
				if player.going_down AND player.x < 1600 AND player.y < 1200  then
					la_wall.item.set_y (la_wall.item.y - player.speed)
				end
			end
		end

	show_viewable
			-- Permet d'afficher les �l�ments de type affichable � l'�cran
		do
			across viewable as la_viewable loop
				window.renderer.draw_sub_texture_with_rotation (la_viewable.item.image, la_viewable.item.start_x, la_viewable.item.start_y,
					la_viewable.item.width, la_viewable.item.height, la_viewable.item.x, la_viewable.item.y, la_viewable.item.rotation_center_x,
					la_viewable.item.rotation_center_y, la_viewable.item.rotation)
			end
		end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
