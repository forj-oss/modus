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
  class modus_php::php_package
  inherits modus_php::php_params {

    # php package installation
    if ! defined(Package["${package}"]) {
      package { "${package}":
        ensure   =>   installed,
      }
    }

    # php apache lib package installation
    if ! defined(Package["${apache_lib_package}"]) {
      package { "${apache_lib_package}":
        ensure    =>   installed,
        require   => Package["${package}"],
      }
    }

    # php client package installation
    if ! defined(Package["${cli_package}"]) {
      package { "${cli_package}":
        ensure    =>   installed,
        require   => Package["${package}"],
      }
    }
  }
  # class definition - end