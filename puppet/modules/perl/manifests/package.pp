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

  # module designed to install the latest perl package

  # class definition - start
  class perl::package (

    $perl                   =   $perl::params::perl,
    $perl_package_version   =   $perl::params::perl_package_version,
  ) inherits perl::params {

    # perl package installation
    if ! defined(Package["${perl}"]) {
      package { "${perl}":
        ensure   =>   $perl_package_version,
      }
    }
  }
  # class definition - end