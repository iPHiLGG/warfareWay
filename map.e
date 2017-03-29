note
	description: "Objet pour une carte du jeu."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	MAP

create
	make

feature {NONE} -- Initialisation

	make(a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'
		do
			set_velocity (1)
			create background.make (a_renderer, "includes/images/complete_map.jpg")
			create walls_array.make (Walls_amount)
			walls_creation
		end

feature -- Acc�s

	Walls_amount:INTEGER = 13
			-- Le nombre de {MUR} dans la {MAP}.

	background:IMAGE
			-- Le fond de la {MAP}

	walls_array:ARRAYED_LIST[MUR]
			-- La liste de tous les murs de la carte.

	total_height:INTEGER = 1200
			-- La hauteur de la {MAP} compl�te.

	total_width:INTEGER = 1600
			-- La largeur de la {MAP} compl�te.

	velocity:INTEGER
			-- La vitesse que le fond de {MAP} se d�place.

	set_velocity (a_velocity:INTEGER)
			-- Changer la vitesse du fond de {MAP} pour `a_velocity'.
		require
			Positive_velocity: a_velocity > 0
		do
			velocity := a_velocity
		ensure
			Is_assign: velocity = a_velocity
		end

feature {NONE} -- Impl�mentation

	walls_creation
			-- Cr�e tous les {MUR} de la {MAP}.
		require
			walls_array.capacity = Walls_amount
		local
			l_mur_1:MUR
		do
			walls_array.extend(create {MUR}.make (25,287,622,0))
			walls_array.extend(create {MUR}.make (25,312,935,0))
			walls_array.extend(create {MUR}.make (271,25,960,287))
			walls_array.extend(create {MUR}.make (230,25,1370,287))
			walls_array.extend(create {MUR}.make (282,25,0,641))
			walls_array.extend(create {MUR}.make (204,25,443,641))
			walls_array.extend(create {MUR}.make (25,237,622,404))
			walls_array.extend(create {MUR}.make (25,643,935,557))
			walls_array.extend(create {MUR}.make (271,25,960,557))
			walls_array.extend(create {MUR}.make (230,25,1370,557))
			walls_array.extend(create {MUR}.make (282,25,0,960))
			walls_array.extend(create {MUR}.make (108,25,443,960))
			walls_array.extend(create {MUR}.make (25,216,526,985))
		ensure
			walls_array.count = Walls_amount
		end

invariant
	velocity > 0

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
