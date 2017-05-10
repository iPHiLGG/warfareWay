note
	description: "Objet pour les projectiles (balles)."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170510"

class
	PROJECTILE

create
	make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'.
		do
			bullet_speed := 1
		end

feature -- Acc�s

	bullet_speed:INTEGER
			-- La vitesse de la balle de {ARMES_TIRE}.

	angle_personnage:REAL_64
			-- L'angle du {PERSONNAGE}.

feature {NONE} -- Impl�mentation

	bullet_movement (a_angle:REAL_64)
			-- Le d�placement de `Current' lorsque le {PERSONNAGE} tire.
		do
			
		end

invariant

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end

