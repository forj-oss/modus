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

# module designed to install and set up the latest mercurial package

# class definition - start
class mercurial::package (

  $mercurial                 = $mercurial::params::mercurial,
  $mercurial_package_version = $mercurial::params::latest,
  $meld                      = $mercurial::params::meld,
  $meld_package_version      = $mercurial::params::latest,
) inherits mercurial::params {

  # mercurial package installation
  if ! defined(Package[$mercurial]) {
    package { $mercurial:
      ensure => $mercurial_package_version,
    }
  }

  # meld package installation
  if ! defined(Package[$meld]) {
    package { $meld:
      ensure => $meld_package_version,
    }
  }
}
# class definition - end