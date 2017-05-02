note
	description: "Factory pour l'objet {ENNEMI}."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170502"

class
	ENNEMI_FACTORY

create
	make

feature {NONE} -- Initialisation

	make (a_renderer:GAME_RENDERER)
			-- Initialisation de `Current'.
		do
			image_filename := "includes/images/ennemi_rifle.png"
			create ennemy_image.make (a_renderer, image_filename)
		end

feature -- Acc�s

	image_filename:STRING
			-- Le chemin vers l'image de l'{ENNEMI}.

	ennemy_image:IMAGE
			-- L'image de l'{ENNEMI}.

	generate_ennemy (a_x, a_y:INTEGER; a_renderer:GAME_RENDERER) : ENNEMI
			-- Permet de cr�er un {ENNEMI}.
		local
			l_ennemy:ENNEMI
		do
			create l_ennemy.make_with_image_file (a_x, a_y, a_renderer, ennemy_image)
			Result := l_ennemy
		end

invariant

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
