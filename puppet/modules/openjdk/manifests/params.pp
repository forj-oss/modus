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

# module designed to set up the parameters needed for openjdk package

# class definition - start
class openjdk::params (

  $openjdk_package_version = hiera('openjdk::params::openjdk_package_version', '7'),
){

  $path                = hiera('openjdk::params::path', '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin')
  $openjdk_jre_package = "openjdk-${openjdk_package_version}-jre"
  $openjdk_jdk_package = "openjdk-${openjdk_package_version}-jdk"
  $java_target_dir     = "/usr/lib/jvm/java-${openjdk_package_version}-openjdk-${::architecture}"
  $java_environment    = "echo JAVA_HOME=${java_target_dir} >> /etc/environment"
}
# class definition - end