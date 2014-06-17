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

  # module designed to install and set up the latest phpmyadmin package

  # class definition - start
  class phpmyadmin::package (

    $phpmyadmin                   =   $phpmyadmin::params::phpmyadmin,
    $phpmyadmin_package_version   =   $phpmyadmin::params::phpmyadmin_package_version,
  ) inherits phpmyadmin::params {

    # phpmyadmin package installation
    if ! defined(Package["${phpmyadmin}"]) {
      package { "${phpmyadmin}":
        ensure   =>   $phpmyadmin_package_version,
      }
    }
  }
  # class definition - end