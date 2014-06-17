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

  # module designed to set up the parameters needed for openldap package

  # class definition - start
  class openldap::params {

    $openldap_package_version   =   hiera('openldap::params::openldap_package_version', 'latest')
    $utils_package_version      =   hiera('openldap::params::utils_package_version', 'latest')
    $server_package             =   hiera('openldap::params::server_package', 'slapd')
    $utils_package              =   hiera('openldap::params::utils_package', 'ldap-utils')
  }
  # class definition - end