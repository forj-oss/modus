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

  # module designed to set up the parameters needed for mysql package

  # class definition - start
  class mysql_starter::params {

    $mysql_dev                   =   hiera('mysql_starter::params::mysql_dev', 'libmysqld-dev')
    $mysql_dev_package_version   =   hiera('mysql_starter::params::mysql_dev_package_version', 'latest')
    $db_name                     =   hiera('mysql_starter::params::db_name', 'mysql')
    $db_user                     =   hiera('mysql_starter::params::db_user', 'admin')
    $db_pass                     =   hiera('mysql_starter::params::db_pass', 'admin')
  }
  # class definition - end