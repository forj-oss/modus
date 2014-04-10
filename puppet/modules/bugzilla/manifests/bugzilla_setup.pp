	# this module is designed to install and set bugzilla up

	# class definition - start
	class bugzilla_setup (

		# template variables - start
		$admin_email			= '',
		$admin_password			= 'letmein',
		$admin_realname			= '',
		$create_htaccess 		= false,
		$webservergroup 		= 'apache',
		$use_suexec				= false,
	  	$db_driver 				= 'mysql',
	  	$db_host 				= 'localhost',
	 	$db_name 				= 'bugzilla_db',
	  	$db_user 				= 'bugzilla_user',
	  	$db_pass 				= '',
	  	$db_port 				= 0,
	  	$db_sock 				= '',
	  	$db_check 				= true,
	  	$index_html 			= false,
	  	$cvsbin 				= '/usr/bin/cvs',
	  	$interdiffbin 			= '/usr/bin/interdiff',
	  	$diffpath 				= '/usr/bin',
	  	$site_wide_secret 		= '',
		$smtp_server 			= 'localhost',
		# template variables - end

		# class variables - start
		$httpd_change			= "echo $'PerlSwitches -I/var/www/html/bugzilla -I/var/www/html/bugzilla/lib -w -T\nPerlConfigRequire /var/www/html/bugzilla/mod_perl.pl'",
		$path 					= '/usr/bin:/usr/sbin:/bin',
		$bugzilla_target_dir	= '/var/www/html',
		$bugzilla_version      	= '4.4.2',
		$bugzilla_clone			= "git clone --branch bugzilla-$bugzilla_version http://git.mozilla.org/bugzilla/bugzilla $bugzilla_target_dir/bugzilla",
		$answer_config_file 	= "$bugzilla_target_dir/bugzilla/localconfig"
		# class variables - end
	){

		# bugzilla installation
		exec { $bugzilla_clone:
  			path 		=> $path,
  			user 		=> root,
 			onlyif  	=> "test `ls $bugzilla_target_dir | grep bugzilla | wc -l` -eq 0"
		}
		->

		exec { $httpd_change:
  			path 		=> $path,
  			user 		=> root  				
		}
		->

		# perform configuration and run checksetup.pl which will build the database if required
		file { $answer_config_file:
			owner 		=> root,
			group 		=> root,
			mode 		=> '0644',
			content 	=> template('bugzilla/answer.erb')
		}
		->

		# perform Bugzilla's set up
		exec { "$bugzilla_dir/checksetup.pl $answer_config_file":
			logoutput 	=> true,
			refreshonly => true		
		}		
	}
	# class definition - end