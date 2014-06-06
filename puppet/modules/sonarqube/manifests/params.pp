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

  # module designed to set up the parameters needed for sonarqube package

  # class definition - start
  class sonarqube::params (

    $sonarqube_package_version   =   '3.7.4',
    $sonarqube_target_dir        =   '/usr/local',
    $sonarqube_tmp_dir           =   '/tmp',
    $app_name                    =   'sonar',
  ){

    $path                        =   '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin'
    $sonarqube                   =   "wget -O ${app_name}.zip http://dist.sonar.codehaus.org/sonar-${sonarqube_package_version}.zip"
    $target_war_file             =   "${sonarqube_target_dir}/sonar-${sonarqube_package_version}/war/${app_name}.war"
    $sonarqube_config_file       =   "${sonarqube_target_dir}/sonar-${sonarqube_package_version}/conf/sonar.properties"
    $sonarqube_config_template   =   'sonar_properties'
    $db_name                     =   'sonar'
    $db_user                     =   'sonar'
    $db_pass                     =   'sonar'
  }
  # class definition - end