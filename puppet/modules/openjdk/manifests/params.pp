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

    $openjdk_default_package_version   =   '6',
    $openjdk_package_version           =   '7',
  ){

    $path                          =   '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin'
    $openjdk_default_jre_package   =   "openjdk-${openjdk_default_package_version}-jre"
    $openjdk_default_jdk_package   =   "openjdk-${openjdk_default_package_version}-jdk"
    $openjdk_jre_package           =   "openjdk-${openjdk_package_version}-jre"
    $openjdk_jdk_package           =   "openjdk-${openjdk_package_version}-jdk"
    $java_target_dir               =   "/usr/lib/jvm/java-${openjdk_default_package_version}-openjdk-amd64"
    $java_environment              =   "echo JAVA_HOME=${java_target_dir} >> /etc/environment"

    # set java 7 as default for the entire system
    #$java_set              =   "update-java-alternatives --set java-1.${openjdk_package_version}.0-openjdk-amd64"
  }
  # class definition - end