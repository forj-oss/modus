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

  # module designed to install and set up the latest tomcat package

  # class definition - start
  class modus_tomcat::tomcat_package
  inherits modus_tomcat::tomcat_params {

    # tomcat package installation
    if ! defined(Package["${package}"]) {
      package { "${package}":
        ensure   =>   installed,
      }
    }

    # tomcat-admin package installation
    if ! defined(Package["${tomcat_admin_package}"]) {
      package { "${tomcat_admin_package}":
        ensure    =>   installed,
        require   =>   Package["${package}"],
      }
    }

    # tomcat-common package installation
    if ! defined(Package["${tomcat_common_package}"]) {
      package { "${tomcat_common_package}":
        ensure    =>   installed,
        require   =>   Package["${package}"],
      }
    }

    # tomcat-docs package installation
    if ! defined(Package["${tomcat_docs_package}"]) {
      package { "${tomcat_docs_package}":
        ensure    =>   installed,
        require   =>   Package["${package}"],
      }
    }

    # tomcat-examples package installation
    if ! defined(Package["${tomcat_examples_package}"]) {
      package { "${tomcat_examples_package}":
        ensure    =>   installed,
        require   =>   Package["${package}"],
      }
    }

    # tomcat-examples package installation
    if ! defined(Package["${tomcat_user_package}"]) {
      package { "${tomcat_user_package}":
        ensure    =>   installed,
        require   =>   Package["${package}"],
      }
    }
  }
  # class definition - end