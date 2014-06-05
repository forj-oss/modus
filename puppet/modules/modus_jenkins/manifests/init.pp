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

  # this module triggers all the scripts needed to install jenkins

  # class definition - start
  class modus_jenkins (

    $jenkins_target_dir   =   $modus_jenkins::jenkins_params::jenkins_target_dir,
  ) inherits modus_jenkins::jenkins_params {

    # ensures that the directory for jenkins to be installed is present
    if ! defined(File["${jenkins_target_dir}"]) {
      file { "${jenkins_target_dir}":
        ensure   =>   directory,
        owner    =>   root,
        group    =>   root,
      }
    }

    # classes to be instantiated
    include ::modus_maven
    include ::modus_openjdk
    include ::modus_tomcat

    class { 'modus_jenkins::jenkins_package':
      require   =>   File["${jenkins_target_dir}"],
    }
    class { 'modus_jenkins::jenkins_config':
      require   =>   Class['modus_jenkins::jenkins_package'],
    }
  }
  # class definition - end