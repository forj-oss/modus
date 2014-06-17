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
    if ! defined(Package["${php}"]) {
      package { "${php}":
        ensure   =>   installed,
      }
    }

    # php apache lib package installation
    if ! defined(Package["${php_apache_lib_package}"]) {
      package { "${php_apache_lib_package}":
        ensure    =>   installed,
        require   =>   Package["${php}"],
      }
    }

    # php client package installation
    if ! defined(Package["${php_cli_package}"]) {
      package { "${php_cli_package}":
        ensure    =>   installed,
        require   =>   Package["${php}"],
      }
    }

    # php mysql package installation
    if ! defined(Package["${php_mysql_package}"]) {
      package { "${php_mysql_package}":
        ensure    =>   installed,
        require   =>   Package["${php}"],
      }
    }

    # php mcrypt package installation
    if ! defined(Package["${php_mcrypt_package}"]) {
      package { "${php_mcrypt_package}":
        ensure    =>   installed,
        require   =>   Package["${php}"],
      }
    }
  }
  # class definition - end