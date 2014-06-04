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

  # module designed to set up the parameters needed for phpldapadmin package

  # class definition - start
  class modus_phpldapadmin::phpldapadmin_params (

    $phpldapadmin_package_version   =   'latest',
    $phpldapadmin_apache_dir        =   '/etc/phpldapadmin',
    $phpldapadmin_link_dir          =   '/etc/apache2/conf.d',
  ){

    $phpldapadmin                      =   'phpldapadmin'
    $phpldapadmin_apache_config_file   =   "${phpldapadmin_apache_dir}/apache.conf"
    $phpldapadmin_link_config_file     =   "${phpldapadmin_link_dir}/phpldapadmin.conf"
  }
  # class definition - end