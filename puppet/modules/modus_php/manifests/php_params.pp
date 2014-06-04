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

  # module designed to set up the parameters needed for php package

  # class definition - start
  class modus_php::php_params (

    $php_package_version   =   '5',
  ){

    $php                      =   "php${php_package_version}"
    $php_cli_package          =   "php${php_package_version}-cli"
    $php_mysql_package        =   "php${php_package_version}-mysql"
    $php_mcrypt_package       =   "php${php_package_version}-mcrypt"
    $php_apache_lib_package   =   "libapache2-mod-php${php_package_version}"
  }
  # class definition - end