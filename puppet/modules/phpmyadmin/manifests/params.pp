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

  # module designed to set up the parameters needed for phpmyadmin package

  # class definition - start
  class phpmyadmin::params (

    $phpmyadmin_config_dir   =   '/etc/dbconfig-common',
    $phpmyadmin_apache_dir   =   '/etc/phpmyadmin',
    $phpmyadmin_link_dir     =   '/etc/apache2/conf.d',
  ){

    $path                            =   '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin'
    $dbc_install                     =   'true'
    $dbc_upgrade                     =   'true'
    $dbc_remove                      =   ''
    $dbc_dbtype                      =   'mysql'
    $dbc_dbuser                      =   'phpmyadmin'
    $dbc_dbpass                      =   'phpmyadmin'
    $dbc_dbserver                    =   ''
    $dbc_dbport                      =   ''
    $dbc_dbname                      =   'phpmyadmin'
    $dbc_dbadmin                     =   'root'
    $dbc_basepath                    =   ''
    $phpmyadmin                      =   'phpmyadmin'
    $phpmyadmin_package_version      =   'latest'
    $phpmyadmin_config_template      =   'phpmyadmin_conf'
    $phpmyadmin_config_file          =   "${phpmyadmin_config_dir}/phpmyadmin.conf"
    $phpmyadmin_apache_config_file   =   "${phpmyadmin_apache_dir}/apache.conf"
    $phpmyadmin_link_config_file     =   "${phpmyadmin_link_dir}/phpmyadmin.conf"
    $phpmyadmin_db_config_file       =   "${phpmyadmin_apache_dir}/config-db.php"
    $phpmyadmin_db_config_template   =   'config_db_php'
    $db_name                         =   'phpmyadmin'
    $db_user                         =   'phpmyadmin'
    $db_pass                         =   'phpmyadmin'
  }
  # class definition - end