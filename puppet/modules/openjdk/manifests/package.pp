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

# module designed to install and set up the latest openjdk package

# class definition - start
class openjdk::package
inherits openjdk::params {

  # openjdk jre package installation
  if ! defined(Package[$openjdk::params::openjdk_jre_package]) {
    package { $openjdk::params::openjdk_jre_package:
      ensure => installed,
    }
  }

  # openjdk jdk package installation
  if ! defined(Package[$openjdk::params::openjdk_jdk_package]) {
    package { $openjdk::params::openjdk_jdk_package:
      ensure => installed,
    }
  }

  # remove openjdk jre 6 package if present
  if defined(Package['openjdk-6-jre']) {
    package { 'openjdk-6-jre':
      ensure  => purged,
    }
  }

  # remove openjdk jdk 6 package if present
  if defined(Package['openjdk-6-jdk']) {
    package { 'openjdk-6-jdk':
      ensure  => purged,
    }
  }
}
# class definition - end