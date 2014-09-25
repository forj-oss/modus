# Copyright 2013 OpenStack Foundation.

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

# Defined resource type to install jenkins plugins.

# Borrowed from: https://github.com/jenkinsci/puppet-jenkins

# resource definition - start
define jenkins::plugin (

  $plugin_name       = $name,
  $version           = 0,
  $update_site       = 'http://updates.jenkins-ci.org',
  $plugin_dir        = '/usr/share/tomcat7/.jenkins/plugins',
  $plugin_parent_dir = '/usr/share/tomcat7/.jenkins',
){

  $plugin = "${plugin_name}.hpi"

  if ($version != 0) {
    $base_url = "${update_site}/download/plugins/${plugin_name}/${version}"
  }
  else {
    $base_url = "${update_site}/latest"
  }

  if ! defined (File[$plugin_parent_dir]) {
    file { $plugin_parent_dir:
      ensure => directory,
      owner  => 'tomcat7',
      group  => 'tomcat7',
    }
  }

  if ! defined(File[$plugin_dir]) {
    file { $plugin_dir:
      ensure => directory,
      owner  => 'tomcat7',
      group  => 'tomcat7',
    }
  }

  #TODO: create user account group for running jenkins. require => [Group['jenkins'], User['jenkins']],

  if ! defined(Group['tomcat7']) {
    group { 'tomcat7':
      ensure => present,
    }
  }

  if ! defined(User['tomcat7']) {
    user { 'tomcat7':
      ensure => present,
    }
  }

  exec { "download-${plugin_name}":
    command => "wget --no-check-certificate ${base_url}/${plugin}",
    cwd     => $plugin_dir,
    require => File[$plugin_dir],
    path    => ['/usr/bin', '/usr/sbin',],
    user    => 'tomcat7',
    unless  => "test -f ${plugin_dir}/${plugin_name}.?pi",

    # OpenStack modification: don't auto-restart jenkins so we can control
    # outage timing better.
    # TODO: re-enable when we move jenkins to run as a service.
    # notify => Service['jenkins'],
  }
}
# class definition - end