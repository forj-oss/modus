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
  class modus_mercurial::mercurial_package (

    $mercurial                   =   $modus_mercurial::mercurial_params::mercurial,
    $mercurial_package_version   =   $modus_mercurial::mercurial_params::mercurial_package_version,
    $meld                        =   $modus_mercurial::mercurial_params::meld,
    $meld_package_version        =   $modus_mercurial::mercurial_params::meld_package_version,
  ) inherits modus_mercurial::mercurial_params {

    # mercurial package installation
    if ! defined(Package["${mercurial}"]) {
      package { "${mercurial}":
        ensure   =>   $mercurial_package_version,
      }
    }

    # meld package installation
    if ! defined(Package["${meld}"]) {
      package { "${meld}":
        ensure   =>   $meld_package_version,
      }
    }
  }
  # class definition - end