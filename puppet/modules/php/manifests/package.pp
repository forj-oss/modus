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

# module designed to install and set up the latest php package

# class definition - start
class php::package
inherits php::params {

  # php package installation
  if ! defined(Package[$php::params::php]) {
    package { $php::params::php:
      ensure => installed,
    }
  }

  # php apache lib package installation
  if ! defined(Package[$php::params::php_apache_lib_package]) {
    package { $php::params::php_apache_lib_package:
      ensure  => installed,
      require => Package[$php::params::php],
    }
  }

  # php client package installation
  if ! defined(Package[$php::params::php_cli_package]) {
    package { $php::params::php_cli_package:
      ensure  => installed,
      require => Package[$php::params::php],
    }
  }

  # php mysql package installation
  if ! defined(Package[$php::params::php_mysql_package]) {
    package { $php::params::php_mysql_package:
      ensure  => installed,
      require => Package[$php::params::php],
    }
  }

  # php mcrypt package installation
  if ! defined(Package[$php::params::php_mcrypt_package]) {
    package { $php::params::php_mcrypt_package:
      ensure  => installed,
      require => Package[$php::params::php],
    }
  }
}
# class definition - end