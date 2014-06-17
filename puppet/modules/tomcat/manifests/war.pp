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

  # module designed to deploy applications through war files in tomcat

  # class definition - start
  define tomcat::war (

    $app_name                 =   undef,
    $target_war_file          =   undef,
    $tomcat_package_version   =   '7',
  ){

    # class required to refresh tomcat service
    include tomcat::service
    #include tomcat::params

    $tomcat                  =   "tomcat${tomcat_package_version}"
    $tomcat_service          =   "${tomcat}"
    $tomcat_autodeploy_dir   =   "/var/lib/${tomcat}/webapps"
    $tomcat_deploy_war       =   "${tomcat_autodeploy_dir}/${app_name}.war"

    # creates a symlink to the original war file and deploy scm-manager in tomcat
    file { "${tomcat_deploy_war}":
      ensure   =>   link,
      target   =>   $target_war_file,
      notify   =>   Service["${tomcat_service}"],
    }
  }
  # class definition - end