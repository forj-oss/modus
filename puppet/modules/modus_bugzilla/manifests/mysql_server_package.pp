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
  class modus_bugzilla::mysql_server_package (

    $mysql_dev_package           =   'libmysqld-dev',
    $mysql_dev_package_version   =   'latest',
  ){

    # mysql server installation and set up with default parameters
    class  { '::mysql::server':
      require   =>   Package["${mysql_dev_package}"],
    }

    # mysql dev package installation
    if ! defined(Package["${mysql_dev_package}"]) {
      package { "${mysql_dev_package}":
        ensure    =>   $mysql_dev_package_version,
        #require   =>   Class['::mysql::server'],
      }
    }
  }
  # class definition - end
