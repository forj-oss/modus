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

    $phpmyadmin_config_dir   =   hiera('phpmyadmin::params::phpmyadmin_config_dir', '/etc/dbconfig-common'),
    $phpmyadmin_apache_dir   =   hiera('phpmyadmin::params::phpmyadmin_apache_dir', '/etc/phpmyadmin'),
    $phpmyadmin_link_dir     =   hiera('phpmyadmin::params::phpmyadmin_link_dir', '/etc/apache2/conf.d'),
    $dbc_dbname              =   hiera('phpmyadmin::params::dbc_dbname', 'phpmyadmin'),
    $dbc_dbuser              =   hiera('phpmyadmin::params::dbc_dbuser', 'phpmyadmin'),
    $dbc_dbpass              =   hiera('phpmyadmin::params::dbc_dbpass', 'phpmyadmin'),
  ){

    $path                            =   hiera('phpmyadmin::params::path', '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin')
    $dbc_install                     =   hiera('phpmyadmin::params::dbc_install', 'true')
    $dbc_upgrade                     =   hiera('phpmyadmin::params::dbc_upgrade', 'true')
    $dbc_remove                      =   hiera('phpmyadmin::params::dbc_remove', '')
    $dbc_dbtype                      =   hiera('phpmyadmin::params::dbc_dbtype', 'mysql')
    $dbc_dbserver                    =   hiera('phpmyadmin::params::dbc_dbserver', '')
    $dbc_dbport                      =   hiera('phpmyadmin::params::dbc_dbport', '')
    $dbc_dbadmin                     =   hiera('phpmyadmin::params::dbc_dbadmin', 'root')
    $dbc_basepath                    =   hiera('phpmyadmin::params::dbc_basepath', '')
    $phpmyadmin                      =   hiera('phpmyadmin::params::phpmyadmin', 'phpmyadmin')
    $phpmyadmin_package_version      =   hiera('phpmyadmin::params::phpmyadmin_package_version', 'latest')
    $phpmyadmin_config_template      =   hiera('phpmyadmin::params::phpmyadmin_config_template', 'phpmyadmin_conf')
    $phpmyadmin_config_file          =   "${phpmyadmin_config_dir}/phpmyadmin.conf"
    $phpmyadmin_apache_config_file   =   "${phpmyadmin_apache_dir}/apache.conf"
    $phpmyadmin_link_config_file     =   "${phpmyadmin_link_dir}/phpmyadmin.conf"
    $phpmyadmin_db_config_file       =   "${phpmyadmin_apache_dir}/config-db.php"
    $phpmyadmin_db_config_template   =   hiera('phpmyadmin::params::phpmyadmin_db_config_template', 'config_db_php')
  }
  # class definition - end