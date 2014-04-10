	# this module is designed to interact with Apache through puppetlabs-apache module

    # class definition - start
    class apache_add_vhost {

        # installation of Apache with the default parameters
        #class { 'apache': }
        include apache

    	# sets up a virtual host with SSL and specific SSL certificates
        apache::vhost { 'localhost':
        	port     	=> '443',
        	docroot  	=> '/var/www/bugzilla',
        	#ssl      	=> true,
        	#ssl_cert 	=> '/etc/ssl/bugzilla_houston_hp_com.crt',
        	#ssl_key  	=> '/etc/ssl/bugzilla_houston_hp_com.key'
        }
    }
    # class definition - end