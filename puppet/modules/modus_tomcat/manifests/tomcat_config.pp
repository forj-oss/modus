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

  # module designed to configure tomcat

  # class definition - start
  class modus_tomcat::tomcat_config
  inherits modus_tomcat::tomcat_params {

    # class required for this module to work
    require modus_tomcat::tomcat_package

    # class required to refresh tomcat service
    include modus_tomcat::tomcat_service

    file { "${tomcat_autodeploy_dir}":
      ensure   =>   directory,
    }

    file { "${tomcat_staging_dir}":
      ensure   =>   directory,
    }

    # ensures that the tomcat-users file for tomcat manager to be configured is present and fills it with the corresponding template
    file { "${config_file}":
      ensure    =>   present,
      owner     =>   root,
      group     =>   tomcat7,
      content   =>   template("modus_tomcat/${config_template}.erb"),
      notify    =>   Service["${tomcat_service}"],
    }
  }
  # class definition - end