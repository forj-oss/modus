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

# module designed to configure tomcat

# class definition - start
class tomcat::config (

  $users_config_template   = $tomcat::params::users_config_template,
  $tomcat_default_template = $tomcat::params::tomcat_default_template,
  $role_manager_gui        = $tomcat::params::role_manager_gui,
  $role_manager_status     = $tomcat::params::role_manager_status,
  $user_admin              = $tomcat::params::user_admin,
  $pass_admin              = $tomcat::params::pass_admin,
) inherits tomcat::params {

  # class required for this module to work
  require tomcat::package
  require ::openjdk

  # class required to refresh tomcat service
  include tomcat::service

  file { $tomcat::params::tomcat_autodeploy_dir:
    ensure => directory,
  }

  file { $tomcat::params::tomcat_staging_dir:
    ensure => directory,
  }

  # changes owner and group from 'root' to 'tomcat7' for '/usr/share/tomcat7' directory
  file { $tomcat::params::tomcat_share_dir:
    ensure  => directory,
    replace => false,
    owner   => tomcat7,
    group   => tomcat7,
    notify  => Service[$tomcat::params::tomcat_service],
  }

  # ensures that the tomcat-users file for tomcat manager to be configured is present and fills it with the corresponding template
  file { $tomcat::params::users_config_file:
    ensure  => present,
    owner   => root,
    group   => tomcat7,
    content => template("tomcat/${users_config_template}.erb"),
    notify  => Service[$tomcat::params::tomcat_service],
  }

  # ensures that the setenv configuration file for tomcat manager to be configured is present and fills it with the corresponding template
  file { $tomcat::params::tomcat_default_conf:
    ensure    => present,
    owner     => root,
    group     => root,
    content   => template("tomcat/${tomcat_default_template}.erb"),
    subscribe => File[$tomcat::params::users_config_file],
  }
}
# class definition - end