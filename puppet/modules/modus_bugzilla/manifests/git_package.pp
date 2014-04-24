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

  # module designed to install and set up the latest git package, this is done through ppa repositories

  # class definition - start
  class modus_bugzilla::git_package (

    $git                   =   'git',
    $git_package_version   =   'latest',
  ){

    # class variable
    $git_ppa   =   'ppa:git-core/ppa'

    # instantiates puppetlabs-apt module for managing apt command
    class { '::apt': }

    # creates ppa repository for latest git package to be installed
    ::apt::ppa { "${git_ppa}": }

    # git package installation
    if ! defined(Package["${git}"]) {
      package { "${git}":
        ensure    =>   $git_package_version,
        require   =>   Apt::Ppa["${git_ppa}"],
      }
    }
  }
  # class definition - end
