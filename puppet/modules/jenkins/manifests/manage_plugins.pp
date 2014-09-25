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

# resource definition - start
define jenkins::manage_plugins (

  $plugin_name = $name,
  $data        = undef,
){

  # class required to refresh tomcat service
  include ::tomcat::service

  if ! defined(Jenkins::Plugin[$plugin_name]) {
    jenkins::plugin { $plugin_name:
      version => $data[$plugin_name],
      notify  => Service['tomcat7'],
    }
  }
}
# resource definition - end