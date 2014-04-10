	# this module is designed to interact with MySQL through puppetlabs-mysql module

    # class definition - start
    class mysql_add_user {

		# installation of MySQL server with the default parameters
		include '::mysql::server'

		# creates bugzilla user on localhost and manages it within MySQL.
		mysql_user { 'bugzilla_user@localhost':
			ensure                   	=> 'present',
			max_connections_per_hour 	=> '0',
			max_queries_per_hour     	=> '0',
			max_updates_per_hour     	=> '0',
			max_user_connections     	=> '0',
		}
	}
	# class definition - end