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

  # module designed to set up the parameters needed for tomcat package

  # class definition - start
  class tomcat::params (

    $tomcat_package_version    =   hiera('tomcat::params::tomcat_package_version', '7'),
    $openjdk_package_version   =   hiera('tomcat::params::openjdk_package_version', '7'),
  ){

    $tomcat                    =   "tomcat${tomcat_package_version}"
    $tomcat_admin_package      =   "${tomcat}-admin"
    $tomcat_common_package     =   "${tomcat}-common"
    $tomcat_docs_package       =   "${tomcat}-docs"
    $tomcat_examples_package   =   "${tomcat}-examples"
    $tomcat_user_package       =   "${tomcat}-user"
    $tomcat_autodeploy_dir     =   "/var/lib/${tomcat}/webapps"
    $tomcat_service            =   "${tomcat}"
    $tomcat_staging_dir        =   "/var/lib/${tomcat}/staging"
    $tomcat_user               =   "${tomcat}"
    $tomcat_group              =   "${tomcat}"    
    $tomcat_user_homedir       =   "/usr/share/${tomcat}"
    $tomcat_target_dir         =   "/etc/${tomcat}"
    $tomcat_share_dir          =   "/usr/share/${tomcat}"
    $users_config_template     =   hiera('tomcat::params::users_config_template', 'tomcat_users')
    $users_config_file         =   "${tomcat_target_dir}/tomcat-users.xml"
    $java_target_dir           =   "/usr/lib/jvm/java-${openjdk_package_version}-openjdk-amd64"
    $tomcat_default_conf       =   "/etc/default/${tomcat}"
    $tomcat_default_template   =   hiera('tomcat::params::tomcat_default_template', 'tomcat')
    $role_manager_gui          =   hiera('tomcat::params::role_manager_gui', 'manager-gui')
    $role_manager_status       =   hiera('tomcat::params::role_manager_status', 'admin-gui')
    $user_admin                =   hiera('tomcat::params::user_admin', 'admin')
    $pass_admin                =   hiera('tomcat::params::pass_admin', 'admin')
  }
  # class definition - end