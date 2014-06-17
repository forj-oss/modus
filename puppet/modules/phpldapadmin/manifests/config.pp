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

  # module designed to set up phpldapadmin

  # class definition - start
  class phpldapadmin::config (

    $phpldapadmin_config_template   =   $phpldapadmin::params::phpldapadmin_config_template,
    $suffix                         =   $phpldapadmin::params::suffix,
  ) inherits phpldapadmin::params {

    # class required for this module to work
    require phpldapadmin::package
    require ::apache_starter

    # creates a symlink from 'apache.conf' file to 'phpldapadmin.conf' for phpldapadmin to work with apache
    file { "${phpldapadmin_link_config_file}":
      ensure   =>   link,
      target   =>   $phpldapadmin_apache_config_file,
      notify   =>   Class['::apache::service'],
    }

    # ensures that the config file for phpldapadmin to be configured is present
    file { "${phpldapadmin_config_file}":
      ensure    =>   present,
      owner     =>   root,
      group     =>   www-data,
      content   =>   template("phpldapadmin/${phpldapadmin_config_template}.erb"),
    }
  }
  # class definition - end