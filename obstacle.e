note
	description: "Objet pour les �l�ments de base d'un obstacle d'un niveau."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

deferred class
	OBSTACLE

feature {NONE} -- Impl�mentation

	make(a_width, a_height, a_position_x, a_position_y:INTEGER)
			-- Initialise `Current'
		require
			a_width > 0
			a_height > 0
			a_position_x >= 0
			a_position_y >= 0
		do
			width := a_width
			height := a_height
			position_x := a_position_x
			position_y := a_position_y
		ensure
			width = a_width
			height = a_height
			position_x = a_position_x
			position_y = a_position_y
		end

	width:INTEGER
			-- La largeur de `Current'

	height:INTEGER
			-- La hauteur de `Current'

	position_x:INTEGER
			-- Position sur l'axe horizontale de `Current'

	position_y:INTEGER
			-- Position sur l'axe verticale de `Current'

invariant
	position_x >= 0
	position_y >= 0
	height > 0
	width > 0

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
