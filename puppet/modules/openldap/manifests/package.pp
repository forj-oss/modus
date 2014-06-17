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

  # module designed to install and set up the latest openldap package

  # class definition - start
  class openldap::package (

    $server_package             =   $openldap::params::server_package,
    $utils_package              =   $openldap::params::utils_package,
    $openldap_package_version   =   $openldap::params::openldap_package_version,
    $utils_package_version      =   $openldap::params::utils_package_version,
  ) inherits openldap::params {

    # openldap server package installation
    if ! defined(Package["${server_package}"]) {
      package { "${server_package}":
        ensure   =>   $openldap_package_version,
      }
    }

    # openldap utils package installation
    if ! defined(Package["${utils_package}"]) {
      package { "${utils_package}":
        ensure    =>   $utils_package_version,
        require   =>   Package["${server_package}"],
      }
    }
  }
  # class definition - end