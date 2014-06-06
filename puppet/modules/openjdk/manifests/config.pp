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

  # module designed to interact with tomcat through camptocamp-tomcat module in order to integrate the service with apache for bugzilla to work

  # class definition - start
  class openjdk::config
  inherits openjdk::params {

    # class required for this module to work
    require openjdk::package

    # set JAVA_HOME environment variable
    exec { "${java_environment}":
      path        =>   $path,
      logoutput   =>   true,
      user        =>   root,
      group       =>   root,
    }

    # set the desired java version as default
    /*exec { "${java_set}":
      path        =>   $path,
      logoutput   =>   true,
      user        =>   root,
      group       =>   root,
    }*/
  }
  # class definition - end