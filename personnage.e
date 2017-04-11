note
	description: "Objet pour un personnage du jeu."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

deferred class
	PERSONNAGE

inherit
	AFFICHABLE

feature -- Acc�s

	update(a_timestamp:NATURAL_32)
			-- Met � jour la surface de `a_timestamp'
		do
			if going_left or going_right or going_up or going_down then
				if going_left then
					x := x - speed
				end
				if going_right then
					x := x + speed
				end
				if going_up then
					y := y - speed
				end
				if going_down then
					y := y + speed
				end
			end
		end

	go_left(a_timestamp:NATURAL_32)
			-- `Current' bouge � gauche
		require
			Is_not_going_left: going_left = False
		do
			going_right := False
			going_left := True
		end

	go_right(a_timestamp:NATURAL_32)
			-- `Current' bouge � droite
		require
			Is_not_going_right: going_right = False
		do
			going_left := False
			going_right := True
		end

	go_up(a_timestamp:NATURAL_32)
			-- `Current' bouge vers le haut
		require
			Is_not_going_up: going_up = False
		do
			going_up := True
			going_down := False
		end

	go_down(a_timestamp:NATURAL_32)
			-- `Current' bouge vers le bas
		require
			Is_not_going_down: going_down = False
		do
			going_down := True
			going_up := False
		end

	stop_left
			-- `Current' arr�te de bouger vers la gauche
		require
			Is_going_left: going_left = True
		do
			going_left := False
		end

	stop_right
			-- `Current' arr�te de bouger vers la droite
		require
			Is_going_right: going_right = True
		do
			going_right := False
		end

	stop_up
			-- `Current' arr�te de bouger vers le haut
		require
			Is_going_up: going_up = True
		do
			going_up := False
		end

	stop_down
			-- `Current' arr�te de bouger vers le bas
		require
			Is_going_down: going_down = True
		do
			going_down := False
		end



	going_left:BOOLEAN
			-- Si `Current' va vers la gauche

	going_right:BOOLEAN
			-- Si `Current' va vers la droite

	going_up:BOOLEAN
			-- Si `Current' va vers le haut

	going_down:BOOLEAN
			-- Si `Current' va vers le bas

	speed:INTEGER = 3
			-- La vitesse du personnage

invariant
	Is_positive: speed > 0
	Is_not_opposite_y: not (going_up AND going_down)
	Is_not_opposite_x: not (going_left AND going_right)

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
