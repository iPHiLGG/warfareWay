note
	description: "Objet pour le pistolet."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170220"

class
	PISTOLET

inherit
	ARMES_TIRE

create
	make

feature {NONE} -- Initialisation

	make
			-- Initialisation de `Current'.
		do
			make_thread
			make_pistol_sound
			make_projectile
			bullet_speed := 10
			initial_total_ammunition := 24
			total_ammunition := 24
			initial_clip_ammunition := 8
			clip_ammunition := 8
			damage := 10
			rate_of_fire := 0.5
			reloading := false
			weapon_filename := "includes/images/personnage_pistol.png"
		ensure
			Is_assign_bullet_speed: bullet_speed = 10
			Is_assign_total_ammunition: total_ammunition = 24
			Is_assign_clip_ammunition: clip_ammunition = 8
			Is_assign_damage: damage = 10
			Is_assign_rate_of_fire: rate_of_fire = 0.5
			Is_assign_weapon_filename: weapon_filename.starts_with ("includes/images/")
			Is_assign_reloading: reloading = false
		end

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
