note
	description: "Objet pour un niveau du jeu."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

class
	MAP

inherit
	IMAGE
		redefine
			make
		end

create
	make

feature {NONE} -- Initialisation

	make(a_renderer:GAME_RENDERER)
			-- <Precursor>
		do
			Precursor (a_renderer, "complete_map.jpg")
		end

feature -- Acc�s

	background:IMAGE
			-- Le fond de la {MAP}

	height:INTEGER = 4800
			-- La hauteur de la {MAP} compl�te

	width:INTEGER = 6400
			-- La largeur de la {MAP} compl�te

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

invariant
	velocity > 0

end
