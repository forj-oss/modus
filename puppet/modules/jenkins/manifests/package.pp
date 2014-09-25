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

# module designed to install and set up the latest jenkins package

# class definition - start
class jenkins::package
inherits jenkins::params {

  # class required for this module to work
  require ::openjdk
  require ::maven

  # jenkins package installation
  exec { $jenkins::params::jenkins:
    path      => $jenkins::params::path,
    cwd       => $jenkins::params::jenkins_target_dir,
    user      => root,
    group     => root,
    timeout   => 0,
    logoutput => true,
    onlyif    => "test ! -e ${jenkins::params::jenkins_target_dir}/${jenkins::params::app_name}.war",
  }
}
# class definition - end