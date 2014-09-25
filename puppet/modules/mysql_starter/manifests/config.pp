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

# module designed to interact with mysql through puppetlabs-mysql module in order to create a the admin user

# class definition - start
class mysql_starter::config (

  $db_name = $mysql_starter::params::db_name,
  $db_user = $mysql_starter::params::db_user,
  $db_pass = $mysql_starter::params::db_pass,
) inherits mysql_starter::params {

  # class required for this module to work
  require mysql_starter::start

  # creates "mysql" db and "admin" user assigning all privileges to it
  ::mysql::db { $db_name:
    user     => $db_user,
    password => $db_pass,
    host     => 'localhost',
    grant    => ['ALL'],
  }

  # assign all privileges over all the system to the "admin" user
  mysql_grant { "${db_user}@localhost/*.*":
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => "${db_user}@localhost",
  }
}
# class definition - end