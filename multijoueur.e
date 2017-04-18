note
	description: "Summary description for {MULTIJOUEUR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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
			l_user_input: STRING_8
		do
			Io.put_string ("Voulez-vous �tre le serveur ou client? (S/C) ")
			Io.read_line
			if Io.last_string = "S" then
				create l_server_socket.make_server_by_port (port)
				Io.put_string ("Ouverture du serveur sur le port " + port.out + "%N")
				l_server_socket.listen (1)
				Io.put_string ("Ecoute maintenant sur le port " + port.out)
				l_server_socket.accept
				if attached l_server_socket.accepted as la_socket then
					la_socket.read_line
				else
					Io.put_string ("Erreur: Impossible de se connecter.%N")
				end
				l_server_socket.close
			elseif Io.last_string = "C" then
				Io.put_string ("Connexion en tant que client.%N")
			else
				Io.put_string ("Erreur: Impossible de se connecter.%N")
			end
		end

end
