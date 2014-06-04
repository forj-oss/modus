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

  # module designed to set up the parameters needed for bugzilla package

  # class definition - start
  class modus_bugzilla::bugzilla_params (

    $create_htaccess             =   true,
    $webservergroup              =   'www-data',
    $use_suexec                  =   false,
    $db_driver                   =   'mysql',
    $db_host                     =   'localhost',
    $db_name                     =   'bugzilla',
    $db_user                     =   'bugzilla',
    $db_pass                     =   'bugzilla',
    $db_port                     =   0,
    $db_sock                     =   '',
    $db_check                    =   false,
    $index_html                  =   false,
    $cvsbin                      =   '/usr/bin/cvs',
    $interdiffbin                =   '/usr/bin/interdiff',
    $diffpath                    =   '/usr/bin',
    $site_wide_secret            =   '',
    $mail_delivery_method        =   'smtp',
    $admin_email                 =   undef,
    $admin_password              =   undef,
    $admin_realname              =   undef,
    $no_pause                    =   true,
    $smtp_server                 =   'localhost',
    $bugzilla_package_revision   =   '4.4',
    $bugzilla_target_dir         =   '/usr/local/bugzilla',
  ){

    $urlbase                   =   "http://${ec2_public_ipv4}:3000/"
    $path                      =   '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin'
    $config_template           =   'answers'
    $config_file               =   "${bugzilla_target_dir}/${config_template}"
    $bugzilla_package_source   =   'http://git.mozilla.org/bugzilla/bugzilla'
  }
  # class definition - end