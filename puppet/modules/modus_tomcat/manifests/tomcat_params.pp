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
  class modus_tomcat::tomcat_params (

    $tomcat_package_version   =   '7',
  ){

    $package                   =   "tomcat${tomcat_package_version}"
    $tomcat_admin_package      =   "tomcat${tomcat_package_version}-admin"
    $tomcat_common_package     =   "tomcat${tomcat_package_version}-common"
    $tomcat_docs_package       =   "tomcat${tomcat_package_version}-docs"
    $tomcat_examples_package   =   "tomcat${tomcat_package_version}-examples"
    $tomcat_user_package       =   "tomcat${tomcat_package_version}-user"
    $tomcat_autodeploy_dir     =   "/var/lib/tomcat${tomcat_package_version}/webapps"
    $tomcat_group              =   "tomcat${tomcat_package_version}"
    $tomcat_service            =   "tomcat${tomcat_package_version}"
    $tomcat_staging_dir        =   "/var/lib/tomcat${tomcat_package_version}/staging"
    $tomcat_user               =   "tomcat${tomcat_package_version}"
    $tomcat_user_homedir       =   "/usr/share/tomcat${tomcat_package_version}"
    $tomcat_target_dir         =   "/etc/tomcat${tomcat_package_version}"
    $tomcat_share_dir          =   "/usr/share/tomcat${tomcat_package_version}"
    $config_template           =   'tomcat_users'
    $config_file               =   "${tomcat_target_dir}/tomcat-users.xml"

    #$tomcat_roles              =   [ 'manager-gui', 'manager-script', 'manager-jmx', 'manager-status' ]
    $role_manager_gui          =   'manager-gui'
    $role_manager_script       =   'manager-script'
    $role_manager_jmx          =   'manager-jmx'
    $role_manager_status       =   'manager-status'

    #$tomcat_users              =   [ 'admin', 'tomcat', 'script','jmx' ]
    $user_admin                =   'admin'
    $user_tomcat               =   'tomcat'
    $user_script               =   'script'
    $user_jmx                  =   'jmx'

    #$tomcat_pass               =   [ 'admin', 'tomcat', 'script','jmx' ]
    $pass_admin                =   'admin'
    $pass_tomcat               =   'tomcat'
    $pass_script               =   'script'
    $pass_jmx                  =   'jmx'
  }
  # class definition - end
