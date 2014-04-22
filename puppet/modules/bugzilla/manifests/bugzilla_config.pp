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
  class bugzilla::bugzilla_config (

    $create_htaccess    =   true,
    $webservergroup     =   'www-data',
    $use_suexec         =   false,
    $db_driver          =   'mysql',
    $db_host            =   'localhost',
    $db_name            =   'bugzilla_db',
    $db_user            =   'bugzilla_user',
    $db_pass            =   'letmein',
    $db_port            =   0,
    $db_sock            =   '',
    $db_check           =   false,
    $index_html         =   false,
    $cvsbin             =   '/usr/bin/cvs',
    $interdiffbin       =   '/usr/bin/interdiff',
    $diffpath           =   '/usr/bin',
    $site_wide_secret   =   '123456789abcdefghijklmnopqrstuvwxyz',
    $admin_email        =   'diegodnova@hp.com',
    $admin_password     =   'letmein',
    $admin_realname     =   'Diego De Nova',
    $no_pause           =   true,
    $smtp_server        =   'localhost',
  ){

    # class variables
    $path                   =   '/usr/bin:/usr/sbin:/bin'
    $bugzilla_target_dir    =   '/usr/local'
    $config_file            =   "${bugzilla_target_dir}/bugzilla/answers"
    $config_template        =   'answers'

    if ! defined(File["${bugzilla_target_dir}/bugzilla/localconfig"]) {
      file { "${bugzilla_target_dir}/bugzilla/localconfig":
        ensure    =>   present,
        owner     =>   root,
        group     =>   www-data,
        mode      =>   '0644',
        content   =>   file("/etc/puppet/modules/bugzilla/files/localconfig"),
        before    =>   File[$config_file],
      }
    }

    # ensures that the answer file for bugzilla to be configured is present and fills it with the corresponding template
    if ! defined(File[$config_file]) {
      file { $config_file:
        ensure    =>   present,
        owner     =>   root,
        group     =>   www-data,
        mode      =>   '0644',
        content   =>   template("bugzilla/${config_template}.erb"),
        #notify    =>   Exec["perl checksetup.pl ${config_file}"],
      }
    }

    # run checksetup.pl along with the answer file which will configure bugzilla
    exec { "perl checksetup.pl ${config_file}":
      path          =>   $path,
      cwd           =>   "${bugzilla_target_dir}/bugzilla",
      user          =>   root,
      group         =>   www-data,
      logoutput     =>   true,
      refreshonly   =>   true,
      subscribe     =>   File[$config_file],
    }
  }
  # class definition - end