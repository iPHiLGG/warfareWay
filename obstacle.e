note
	description: "Objet pour les éléments de base d'un obstacle d'un niveau."
	author: "Philippe Guilmette"
	author: "Étienne Boutet"
	date: "20170220"

deferred class
	OBSTACLE

feature {NONE} -- Implémentation

	make(a_width, a_height, a_position_x, a_position_y:INTEGER)
			-- Initialise `Current'
		require
			a_width > 0
			a_height > 0
			a_position_x >= 0
			a_position_y >= 0
		do
			position_x := a_position_x
			position_y := a_position_y
		ensure
			position_x = a_position_x
			position_y = a_position_y
		end

	position_x:INTEGER
			-- Position sur l'axe horizontale de `Current'

	position_y:INTEGER
			-- Position sur l'axe verticale de `Current'

invariant
	Is_position_x_positive: position_x >= 0
	Is_position_y_positive: position_y >= 0

note
	copyright: "Tous droits réservés (c) 2017, Étienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			Cégep de Drummondville
		]"

end
