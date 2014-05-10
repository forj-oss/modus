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
  class modus_scmmanager::scmmanager_params (

    $scmmanager_package_revision   =   '1.38',
    $scmmanager_target_dir         =   '/tmp/scmmanager',
  ){

    $path                        =   '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin'
    $scmmanager_package_source   =   'https://bitbucket.org/sdorra/scm-manager'
    $app_name                    =   'scm-manager'
    $target_war_file             =   "${scmmanager_target_dir}/scm-webapp/target/scm-webapp.war"
  }
  # class definition - end