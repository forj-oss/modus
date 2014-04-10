	# this module triggers all the scripts needed for Bugzilla's set up

	# class definition - start
	class bugzilla {
		#include conditions
		include mysql_add_user
		include apache_add_vhost
		include bugzilla_setup
	}
	# class definition - end