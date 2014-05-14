  # (c) Copyright 2014 Hewlett-Packard Development Company, L.P.
  #
  #   Licensed under the Apache License, Version 2.0 (the "License");
  #   you may not use this file except in compliance with the License.
  #   You may obtain a copy of the License at
  #
  #       http://www.apache.org/licenses/LICENSE-2.0
  #
  #   Unless required by applicable law or agreed to in writing, software
  #   distributed under the License is distributed on an "AS IS" BASIS,
  #   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  #   See the License for the specific language governing permissions and
  #   limitations under the License.

  # module designed to install and set up the latest versions of the perl modules required for bugzilla, this is done through the install-module.pl script provided by bugzilla

  # class definition - start
  class modus_perl::perl_modules_package
  inherits modus_perl::perl_params {

    # class required for this module to work
    require modus_perl::perl_package

    # decides if all the modules will be installed or only the required
    if $install_option == 'required'
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
    elsif $install_option == 'all'
    {

      # perl modules installation -ALL-
      exec { "${perl_modules}":
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
  # class definition - end