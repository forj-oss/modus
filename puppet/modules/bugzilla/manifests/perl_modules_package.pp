  # module designed to install and set up the latest versions of the perl modules required for bugzilla, this is done through the install-module.pl script provided by bugzilla

  # class definition - start
  class bugzilla::perl_modules_package (

    $perl_modules_target_dir   =   '/usr/local/bugzilla/',
    $option                    =   undef,
  ){

    # class required for this module to work
    require bugzilla::perl_package

    # class variabless
    $path           =   '/usr/bin:/usr/sbin:/bin'
    $perl_modules   =   "perl install-module.pl --all"

    # decides if all the modules will be installed or only the required
    if $option == 'required'
    {

      # perl modules installation -REQUIRED-
      exec { "perl install-module.pl CGI":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl Digest::SHA":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl Date::Format":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl DateTime":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl DateTime::TimeZone":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl DBI":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl Template":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl Email::Send":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl Email::MIME":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl URI":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl List::MoreUtils":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl Math::Random::ISAAC":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
      exec { "perl install-module.pl DBD::mysql":
        path        =>   $path,
        cwd         =>   $perl_modules_target_dir,
        logoutput   =>   true,
        user        =>   root,
        group       =>   www-data,
        timeout     =>   0,
      }
    }
    elsif $option == 'all'
    {

      # perl modules installation -ALL-
      exec { $perl_modules:
        path          =>   $path,
        cwd           =>   $perl_modules_target_dir,
        logoutput     =>   true,
        user          =>   root,
        group         =>   www-data,
        refreshonly   =>   true,
        timeout       =>   0,
      }
    }
  }
  # class definition - end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            