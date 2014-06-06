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

  # module designed to install the latest mysql package, this is done through puppetlabs-mysql module

  # class definition - start
  class mysql_starter::start (

    $mysql_dev                   =   $mysql_starter::params::mysql_dev,
    $mysql_dev_package_version   =   $mysql_starter::params::mysql_dev_package_version,
  ) inherits mysql_starter::params {

    # mysql server installation and set up with default parameters
    class  { '::mysql::server': }

    # mysql dev package installation
    if ! defined(Package["${mysql_dev}"]) {
      package { "${mysql_dev}":
        ensure    =>   $mysql_dev_package_version,
        require   =>   Class['::mysql::server'],
      }
    }
  }
  # class definition - end