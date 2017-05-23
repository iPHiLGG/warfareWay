note
	description: "Summary description for {COLLISABLE}."
	author: "�tienne Boutet"
	author: "Philippe Guilmette"
	date: "20170523"

deferred class
	COLLISABLE

feature -- Acc�s

	x : INTEGER_32
		-- Position en x de l'objet
		deferred end

	y : INTEGER_32
		-- Position en y de l'objet
		deferred end

	width : INTEGER_32
			-- Largeur de l'objet
		deferred end

	height : INTEGER_32
			-- Hauteur de l'objet
		deferred end


	valide_collision(a_objet_collision : COLLISABLE) : BOOLEAN
			-- Permet de valider si il y a une collision entre 2 objets
			-- Retourne vrai ou faux
		local
			l_collision : BOOLEAN
		do
			Result :=
				(
					x >= a_objet_collision.x and
				  	x <= a_objet_collision.x + a_objet_collision.width and
				  	y >= a_objet_collision.y and
				  	y <= a_objet_collision.y + a_objet_collision.height
				) or (
			  		x + width >= a_objet_collision.x and
				  	x + width <= a_objet_collision.x + a_objet_collision.width and
				  	y >= a_objet_collision.y and
				  	y <= a_objet_collision.y + a_objet_collision.height
				) or (
			  		x >= a_objet_collision.x and
				  	x <= a_objet_collision.x + a_objet_collision.width and
				  	y + height >= a_objet_collision.y and
				  	y + height <= a_objet_collision.y + a_objet_collision.height
				) or (
				  	x + width >= a_objet_collision.x and
				  	x + width <= a_objet_collision.x + a_objet_collision.width and
				  	y + height >= a_objet_collision.y and
				  	y + height <= a_objet_collision.y + a_objet_collision.height
				)
		end

invariant

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
