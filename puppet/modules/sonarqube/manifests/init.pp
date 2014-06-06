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

  # this module triggers all the scripts needed to install sonarqube

  # class definition - start
  class sonarqube
  inherits sonarqube::params {

    # ensures that the directory for sonarqube to be installed is present
    /*if ! defined(File["${sonarqube_target_dir}"]) {
      file { "${sonarqube_target_dir}":
        ensure   =>   directory,
        owner    =>   root,
        group    =>   root,
      }
    }*/

    # classes to be instantiated
    include ::openjdk
    include ::maven
    include ::mysql_starter
    include ::tomcat

    class { 'sonarqube::package':
      #require   =>   File["${nexus_target_dir}"],
    }
    class { 'sonarqube::mysql':
      require   =>   Class['sonarqube::package'],
    }
    class { 'sonarqube::config':
      require   =>   Class['sonarqube::mysql'],
    }
  }
  # class definition - end