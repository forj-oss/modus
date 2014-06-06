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

  # module designed to set up phpmyadmin

  # class definition - start
  class phpmyadmin::config (

    $dbc_install                     =   $phpmyadmin::params::dbc_install,
    $dbc_upgrade                     =   $phpmyadmin::params::dbc_upgrade,
    $dbc_remove                      =   $phpmyadmin::params::dbc_remove,
    $dbc_dbtype                      =   $phpmyadmin::params::dbc_dbtype,
    $dbc_dbserver                    =   $phpmyadmin::params::dbc_dbserver,
    $dbc_dbport                      =   $phpmyadmin::params::dbc_dbport,
    $dbc_dbadmin                     =   $phpmyadmin::params::dbc_dbadmin,
    $dbc_basepath                    =   $phpmyadmin::params::dbc_basepath,
    $phpmyadmin_config_template      =   $phpmyadmin::params::phpmyadmin_config_template,
    $phpmyadmin_db_config_template   =   $phpmyadmin::params::phpmyadmin_db_config_template,
  ) inherits phpmyadmin::params {

    # class required for this module to work
    require ::apache_starter

    # ensures that the config file for phpmyadmin to be configured is present
    file { "${phpmyadmin_config_file}":
      ensure    =>   present,
      owner     =>   root,
      group     =>   root,
      content   =>   template("phpmyadmin/${phpmyadmin_config_template}.erb"),
    }

    # ensures that the config file for phpmyadmin db to be configured is present
    file { "${phpmyadmin_db_config_file}":
      ensure    =>   present,
      owner     =>   root,
      group     =>   www-data,
      content   =>   template("phpmyadmin/${phpmyadmin_db_config_template}.erb"),
    }

    # creates a symlink from 'apache.conf' file to 'phpmyadmin.conf' for phpmyadmin to work with apache
    file { "${phpmyadmin_link_config_file}":
      ensure   =>   link,
      target   =>   $phpmyadmin_apache_config_file,
      notify   =>   Class['::apache::service'],
    }
  }
  # class definition - end