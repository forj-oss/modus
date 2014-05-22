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

  # module designed to set up phpmyadmin

  # class definition - start
  class modus_phpmyadmin::phpmyadmin_config
  inherits modus_phpmyadmin::phpmyadmin_params {

    # ensures that the config file for phpmyadmin to be is present
    file { "${phpmyadmin_config_file}":
      ensure    =>   present,
      owner     =>   root,
      group     =>   root,
      content   =>   template("modus_phpmyadmin/${phpmyadmin_config_template}.erb"),
    }

    # ensures that the config file for phpmyadmin to be is present
    file { "${phpmyadmin_db_config_file}":
      ensure    =>   present,
      owner     =>   root,
      group     =>   www-data,
      content   =>   template("modus_phpmyadmin/${phpmyadmin_db_config_template}.erb"),
    }

    # creates a symlink from 'apache.conf' file to 'phpmyadmin.conf' for phpmyadmin to work with apache
    file { "${phpmyadmin_link_config_file}":
      ensure   =>   link,
      target   =>   $phpmyadmin_apache_config_file,
      notify   =>   Class['::apache::service'],
    }
  }
  # class definition - end