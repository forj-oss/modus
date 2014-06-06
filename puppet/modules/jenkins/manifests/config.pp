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

  # module designed to install and set up jenkins

  # class definition - start
  class jenkins::config
  inherits jenkins::params {

    # classes required for this module to work
    require ::tomcat

    ::tomcat::war { "${app_name}":
      app_name          =>   $app_name,
      target_war_file   =>   $target_war_file,
    }
  }
  # class definition - end