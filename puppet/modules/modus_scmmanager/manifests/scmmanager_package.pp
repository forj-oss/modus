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

  # module designed to install and set up the latest scm-manager package

  # class definition - start
  class modus_scmmanager::scmmanager_package
  inherits modus_scmmanager::scmmanager_params {

    # class required for this module to work
    require ::modus_maven
    require ::modus_mercurial
    require ::modus_openjdk

    # sonatype nexus package installation
    exec { "${scmmanager}":
      path        =>   $path,
      cwd         =>   $scmmanager_target_dir,
      user        =>   root,
      group       =>   root,
      logoutput   =>   true,
    }
  }
  # class definition - end