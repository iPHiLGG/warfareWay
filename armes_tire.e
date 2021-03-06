note
	description: "Objet pour d�terminer les �l�ments des armes de tir."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170220"

deferred class
	ARMES_TIRE

inherit
	THREAD
		rename
			make as make_thread
		end
	ARMES
	PROJECTILE
		rename
			make as make_projectile
		end

feature -- Acc�s

	initial_total_ammunition:INTEGER
			-- Le nombre de balles de `Current' au total lorsqu'il est plein.

	initial_clip_ammunition:INTEGER
			-- Le nombre de balles de `Current' d'un chargeur lorsqu'il est plein.

	total_ammunition:INTEGER
			-- Le nombre de balles du fusil au total.

	set_total_ammunition (a_total_bullets_left:INTEGER)
			-- Changer le nombre de balles restantes total de `Current' pour `a_total_bullets_left'.
		require
			Positive_total_bullets: a_total_bullets_left >= 0
		do
			total_ammunition := a_total_bullets_left
		ensure
			Is_total_ammunition_assign: total_ammunition = a_total_bullets_left
		end

	clip_ammunition:INTEGER
			-- Le nombre de balles du fusil par chargeur.

	set_clip_ammunition (a_bullets_left:INTEGER)
			-- Changer le nombre de balles restantes du chargeur de `Current' pour `a_bullets_left'.
		require
			Positive_amount_bullets: a_bullets_left >= 0
		do
			clip_ammunition := a_bullets_left
		ensure
			Is_clip_ammunition_assign: clip_ammunition = a_bullets_left
		end

	rate_of_fire:REAL
			-- La cadance de tir du fusil (temps entre chaque balle en secondes).

	reloading:BOOLEAN
			-- `True' si `Current' est en rechargement.

	reload_time:INTEGER_64 = 3
			-- Le temps � recharger `Current' en secondes.

	shoot_weapon
			-- Tire les balles de `Current'.
		require
			total_ammunition > 0
			clip_ammunition > 0
			reloading = false
		do
			clip_ammunition := clip_ammunition - 1
			total_ammunition := total_ammunition - 1
		end

	reload
			-- Recharge les balles de `Current'.
		require
			Total_bullets_higher_than_clip: total_ammunition >= clip_ammunition
		local
			Second_in_nanoseconds:INTEGER_64
		do
			if clip_ammunition < initial_clip_ammunition and
			total_ammunition >= initial_clip_ammunition then
				Second_in_nanoseconds := 1000000000
				reloading := true
				--sleep (reload_time * Second_in_nanoseconds)
				reloading := false
			end
		end


feature {NONE} -- Impl�mentation

	execute
			-- L'ex�cution du {THREAD}.
		do
			reload
		end

invariant
	Is_initial_total_ammunition_positive: initial_total_ammunition >= 0
	Is_initial_clip_ammunition_positive: initial_clip_ammunition >= 0
	Is_total_ammunition_positive: total_ammunition >= 0
	Is_clip_ammunition_positive: clip_ammunition >= 0
	Is_rate_of_fire_positive: rate_of_fire > 0
	Is_bullet_speed_positive: bullet_speed > 0

note
	copyright: "Tous droits r�serv�s (c) 2017, �tienne Boutet et Philippe Guilmette"
	license:   "GNU General Public License v3.0"
	source: "[
			C�gep de Drummondville
		]"

end
