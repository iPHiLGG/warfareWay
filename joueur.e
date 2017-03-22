note
	description: "Objet pour un personnage qui peut �tre controll�."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	JOUEUR

inherit
	PERSONNAGE
		rename
			make as make_personnage
		end

create
	make

feature {NONE} -- Initialisation
	make(a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'
		do
			make_personnage(a_renderer, "includes/images/personnage.png")
		end

feature -- Acc�s
	calculate_angle(cursor:CURSEUR; player_x:INTEGER; player_y:INTEGER): REAL_64
			-- Permet de calculer l'angle entre le joueur et le curseur
		local
			l_x_distance, l_y_distance, l_angle: REAL_64
		do
			l_x_distance := cursor.last_x - player_x
			l_y_distance := cursor.last_y - player_y
			l_angle := atan2 (l_x_distance, l_y_distance)
			Result := l_angle
		end

feature {NONE} -- Impl�mentation

	atan2 (distance_x, distance_y: REAL_64): REAL_64
			-- Pour calculer l'angle du personnage
	    external
	        "C signature (double, double): double use <math.h>"
	    alias
	        "atan2"
	    end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
