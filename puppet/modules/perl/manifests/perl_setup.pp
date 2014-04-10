	# this class is designed to install perl, pmtools, cpanminus and some perl modules. All of this in their last versions

	# class definition - start
	class perl_setup (

		# class variables - start
		$path 		= '/usr/bin:/usr/sbin:/bin',		
		$version 	= false,
		$ensure 	= installed,
		$perl 		= 'perl',
		$pmtools 	= 'pmtools',
		$cpanminus 	= 'cpanminus'
		# class variables - end
	){

		# apply all packages before applying any exec resource
		Package <| |> -> Exec <| |>

		# perl installation
		package { $perl:
			ensure 		=> $ensure
		}
		->

		# pmtools installation
		package { $pmtools:
			ensure 		=> $ensure
		}
		->

		# cpanminus installation
		package { $cpanminus:
			ensure 		=> $ensure
		}

		# perl modules installation
		exec { "cpanm CGI":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}

		exec { "cpanm Date::Format":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}

		exec { "cpanm DateTime":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}

		exec { "cpanm DateTime::TimeZone":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3	
		}

		exec { "cpanm DBI":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3	
		}

		exec { "cpanm DBD::mysql":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}

		exec { "cpanm Digest::SHA":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}

		exec { "cpanm Email::Send":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}

		exec { "cpanm Email::MIME":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}

		exec { "cpanm Template":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3	
		}

		exec { "cpanm URI":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}

		exec { "cpanm List::MoreUtils":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}

		exec { "cpanm Math::Random::ISAAC":
  			path 		=> $path,
  			user 		=> root,
  			tries		=> 3
		}
	}
	# class definition - end