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

  # module designed to install and set up bugzilla

  # class definition - start
  class modus_bugzilla::bugzilla_config (

    $admin_email      =   $modus_bugzilla::bugzilla_params::admin_email,
    $admin_password   =   $modus_bugzilla::bugzilla_params::admin_password,
    $admin_realname   =   $modus_bugzilla::bugzilla_params::admin_realname,
  ) inherits modus_bugzilla::bugzilla_params {

    # classes required for this module to work
    require ::modus_apache
    require ::modus_mysql
    require ::modus_perl

    # ensures that the answer file for bugzilla to be configured is present and fills it with the corresponding template
    if ! defined(File["${config_file}"]) {
      file { "${config_file}":
        ensure    =>   present,
        owner     =>   www-data,
        group     =>   www-data,
        mode      =>   '0644',
        content   =>   template("modus_bugzilla/${config_template}.erb"),
      }
    }

    # run checksetup.pl along with the answer file which will configure bugzilla
    exec { "perl checksetup.pl ${config_file}":
      path          =>   $path,
      cwd           =>   $bugzilla_target_dir,
      user          =>   www-data,
      group         =>   www-data,
      logoutput     =>   true,
      refreshonly   =>   true,
      subscribe     =>   File["${config_file}"],
    }
  }
  # class definition - end