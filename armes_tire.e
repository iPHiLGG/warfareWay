note
	description: "Objet pour d�terminer les �l�ments des armes de tir."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20160220"

deferred class
	ARMES_TIRE

inherit
	ARMES

feature -- Acc�s

	bullet_speed:INTEGER
			-- La vitesse de la balle du fusil

	total_ammunition:INTEGER
			-- Le nombre de balles du fusil au total.

	clip_ammunition:INTEGER
			-- Le nombre de balles du fusil par chargeur.

invariant

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
