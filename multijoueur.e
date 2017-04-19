note
	description: "Objet pour pouvoir jouer en ligne."
	author: "Philippe Guilmette"
	author: "�tienne Boutet"
	date: "20170419"

class
	MULTIJOUEUR

inherit
	THREAD
		rename
			make as make_thread
		end

create
	make

feature {NONE} -- Initialisation

	make
		do
			make_thread
		end

feature -- Acc�s

	port:INTEGER_32 = 4321
			-- Le port de connexion

feature {NONE} -- Impl�mentation

	execute
			-- L'ex�cution du {THREAD}
		local
			l_server_socket: NETWORK_STREAM_SOCKET
			l_client_socket: NETWORK_STREAM_SOCKET
			l_addr_factory: INET_ADDRESS_FACTORY
			l_address: INET_ADDRESS
			l_is_valid:BOOLEAN
		do
			l_is_valid := false
			from

			until
				l_is_valid = true
			loop
				Io.put_string ("Voulez-vous �tre le serveur ou client? (S/C): ")
				Io.read_line
				if Io.last_string.is_equal ("S") then
					create l_server_socket.make_server_by_port (port)
					Io.put_string ("Ouverture du serveur sur le port " + port.out + ".%N")
					l_server_socket.listen (1)
					Io.put_string ("Ecoute maintenant sur le port " + port.out + ".%N")
					l_server_socket.accept
					if attached l_server_socket.accepted as la_socket then
						la_socket.read_line
						io.put_string ("Message du client: ")
						io.put_string (la_socket.last_string)
						io.put_new_line
						l_server_socket.close
					else
						Io.put_string ("Erreur: Connexion au socket refus�e.%N")
					end
					l_is_valid := true
				elseif Io.last_string.is_equal ("C") then
					Io.put_string ("Connexion en tant que client.%N")
					Io.put_string ("Entrer une adresse IP pour se connecter: ")
					Io.read_line
					create l_addr_factory
					l_address := l_addr_factory.create_from_name (Io.last_string)
					if attached l_address as la_address then
						create l_client_socket.make_client_by_address_and_port (la_address, port)
						l_client_socket.connect
						-- Pour tester l'�coute du serveur
						Io.put_string ("Entrer un message � afficher au serveur: ")
						Io.read_line
						l_client_socket.put_string (Io.last_string)
						l_client_socket.close
					else
						Io.put_string ("Erreur: L'adresse de connexion n'a pu �tre cr��e.%N")
					end
					l_is_valid := true
				else
					Io.put_string ("Erreur: Impossible de se connecter.%N")
				end
			end
		end

end
