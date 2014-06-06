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
  class bugzilla::params (

    $db_name               =   hiera('bugzilla::params::db_name', 'bugzilla'),
    $db_user               =   hiera('bugzilla::params::db_user', 'bugzilla'),
    $db_pass               =   hiera('bugzilla::params::db_pass', 'bugzilla'),
    $bugzilla_target_dir   =   hiera('bugzilla::params::bugzilla_target_dir', '/usr/local/bugzilla'),
    $config_template       =   hiera('bugzilla::params::config_template', 'answers'),
    $bugzilla_port         =   hiera('bugzilla::params::bugzilla_port', '3000'),
  ){

    $path                        =   hiera('bugzilla::params::path', '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin')
    $bugzilla_vhost              =   hiera('bugzilla::params::bugzilla_vhost', $ec2_public_ipv4)
    $bugzilla_protocol           =   hiera('bugzilla::params::bugzilla_protocol','http')
    $create_htaccess             =   hiera('bugzilla::params::create_htaccess', true)
    $webservergroup              =   hiera('bugzilla::params::webservergroup', 'www-data')
    $use_suexec                  =   hiera('bugzilla::params::use_suexec', false)
    $db_driver                   =   hiera('bugzilla::params::db_driver', 'mysql')
    $db_host                     =   hiera('bugzilla::params::db_host', 'localhost')
    $db_port                     =   hiera('bugzilla::params::db_port', 0)
    $db_sock                     =   hiera('bugzilla::params::db_sock', '')
    $db_check                    =   hiera('bugzilla::params::db_check', false)
    $index_html                  =   hiera('bugzilla::params::index_html', false)
    $cvsbin                      =   hiera('bugzilla::params::cvsbin', '/usr/bin/cvs')
    $interdiffbin                =   hiera('bugzilla::params::interdiffbin', '/usr/bin/interdiff')
    $diffpath                    =   hiera('bugzilla::params::diffpath', '/usr/bin')
    $site_wide_secret            =   hiera('bugzilla::params::site_wide_secret', '')
    $mail_delivery_method        =   hiera('bugzilla::params::mail_delivery_method', 'smtp')
    $admin_email                 =   hiera('bugzilla::params::admin_email', undef)
    $admin_password              =   hiera('bugzilla::params::admin_password', undef)
    $admin_realname              =   hiera('bugzilla::params::admin_realname', undef)
    $no_pause                    =   hiera('bugzilla::params::no_pause', true)
    $smtp_server                 =   hiera('bugzilla::params::smtp_server', 'localhost')
    $urlbase                     =   "${bugzilla_protocol}://${bugzilla_vhost}:${bugzilla_port}/"
    $config_file                 =   "${bugzilla_target_dir}/${config_template}"
    $bugzilla_package_revision   =   hiera('bugzilla::params::bugzilla_package_revision', '4.4')
    $bugzilla_package_source     =   hiera('bugzilla::params::bugzilla_package_source', 'http://git.mozilla.org/bugzilla/bugzilla')
  }
  # class definition - end
