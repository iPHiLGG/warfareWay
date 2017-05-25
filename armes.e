note
	description: "Objet qui d�termine les �l�ments de base des armes."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170220"

deferred class
	ARMES

inherit
	SON

feature -- Acc�s

	damage:INTEGER
			-- Le nombre de d�g�ts inflig�s par coup.

	weapon_filename:STRING
			-- Le nom du fichier de `Current'.

invariant
	Is_damage_positive: damage > 0

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
