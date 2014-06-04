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

  # module designed to configure postfix

  # class definition - start
  class modus_postfix::postfix_config
  inherits modus_postfix::postfix_params {

    # class required for this module to work
    require modus_postfix::postfix_package

    # configure main.cf file
    file { "${config_file}":
      ensure    =>   present,
      owner     =>   root,
      group     =>   root,
      mode      =>   '0644',
      content   =>   template("modus_postfix/${config_template}.erb"),
    }
  }
