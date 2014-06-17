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

  # module designed to set up the parameters needed for scm-manager package

  # class definition - start
  class scmmanager::params (

    $scmmanager_package_revision   =   hiera('scmmanager::params::scmmanager_package_revision', '1.38'),
    $scmmanager_target_dir         =   hiera('scmmanager::params::scmmanager_package_revision', '/usr/local/scmmanager'),
    $app_name                      =   hiera('scmmanager::params::scmmanager_package_revision', 'scm-manager'),
  ){

    $path              =   hiera('scmmanager::params::path', '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin')
    $scmmanager        =   "wget -O ${app_name}.war http://maven.scm-manager.org/nexus/content/repositories/releases/sonia/scm/scm-webapp/${scmmanager_package_revision}/scm-webapp-${scmmanager_package_revision}.war"
    $target_war_file   =   "${scmmanager_target_dir}/${app_name}.war"
  }
  # class definition - end