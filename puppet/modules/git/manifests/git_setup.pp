	# this module is designed to install git through PPA

	# class definition - start
	class git (

		# class variables - start
		$ensure			= installed,
		$git 			= 'git',
		$git_ppa		= 'ppa:git-core/ppa'
		# class variables - end
	){

		# module for managing apt through puppetlabs-apt module
		include apt

		# creation of PPA repository for git
		apt::ppa { $git_ppa: }
		->

		# installation of git
		package { $git:
			ensure     => $ensure
		}
	}
	# class definition - end