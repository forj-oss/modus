#
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

# module designed to install and set up the latest versions of the perl
# modules required for bugzilla, this is done through the install-module.pl
# script provided by bugzilla

# class definition - start

class perl::modules_package (
  $install_option          = $perl::params::install_option,
  $perl_modules_target_dir = $perl::params::perl_modules_target_dir,
) inherits perl::params {

  # class required for this module to work
  require perl::package

  # decides if all the modules will be installed or only the required
  if $install_option == 'required'
  {

    # perl modules installation -REQUIRED-
    exec { $perl::params::perl_required_modules:
      path      => $perl::params::path,
      cwd       => $perl_modules_target_dir,
      logoutput => true,
      user      => www-data,
      group     => www-data,
      timeout   => 0,
    }
  }
  elsif $install_option == 'all'
  {

    # perl modules installation -ALL-
    exec { $perl::params::perl_all_modules:
      path        => $perl::params::path,
      cwd         => $perl_modules_target_dir,
      logoutput   => true,
      user        => www-data,
      group       => www-data,
      refreshonly => true,
      timeout     => 0,
    }
  }
}
# class definition - end
