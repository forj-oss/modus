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
class bugzilla::config (

  $create_htaccess      = $bugzilla::params::create_htaccess,
  $webservergroup       = $bugzilla::params::webservergroup,
  $use_suexec           = $bugzilla::params::use_suexec,
  $db_driver            = $bugzilla::params::db_driver,
  $db_host              = $bugzilla::params::db_host,
  $db_port              = $bugzilla::params::db_port,
  $db_sock              = $bugzilla::params::db_sock,
  $db_check             = $bugzilla::params::db_check,
  $index_html           = $bugzilla::params::index_html,
  $cvsbin               = $bugzilla::params::cvsbin,
  $interdiffbin         = $bugzilla::params::interdiffbin,
  $diffpath             = $bugzilla::params::diffpath,
  $site_wide_secret     = $bugzilla::params::site_wide_secret,
  $mail_delivery_method = $bugzilla::params::mail_delivery_method,
  $admin_email          = $bugzilla::params::admin_email,
  $admin_password       = $bugzilla::params::admin_password,
  $admin_realname       = $bugzilla::params::admin_realname,
  $no_pause             = $bugzilla::params::no_pause,
  $smtp_server          = $bugzilla::params::smtp_server,
  $urlbase              = $bugzilla::params::urlbase,
) inherits bugzilla::params {

  # class required for this module to work
  require ::perl

  # ensures that the answer file for bugzilla to be configured is present and fills it with the corresponding template
  if ! defined(File[$bugzilla::params::config_file]) {
    file { $bugzilla::params::config_file:
      ensure  => present,
      owner   => www-data,
      group   => www-data,
      mode    => '0644',
      content => template("bugzilla/${bugzilla::params::config_template}.erb"),
    }
  }

  # run checksetup.pl along with the answer file which will configure bugzilla
  exec { "perl checksetup.pl ${bugzilla::params::config_file}":
    path        => $bugzilla::params::path,
    cwd         => $bugzilla::params::bugzilla_target_dir,
    user        => www-data,
    group       => www-data,
    logoutput   => true,
    refreshonly => true,
    subscribe   => File[$bugzilla::params::config_file],
  }
}
# class definition - end