# == Class: jenkins::job_builder
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

# class definition - start
class jenkins::job_builder (

  $url             = $jenkins::params::url,
  $username        = $jenkins::params::username,
  $password        = $jenkins::params::password,
  $config_template = $jenkins::params::config_template,
) inherits jenkins::params {

  $jjb_target_dir = $jenkins::params::jjb_target_dir

  # A lot of things need yaml, be conservative requiring this package to avoid
  # conflicts with other modules.
  if ! defined(Package['python-yaml']) {
    package { 'python-yaml':
      ensure => present,
    }
  }

  if ! defined(Package['python-jenkins']) {
    package { 'python-jenkins':
      ensure => present,
    }
  }

  vcsrepo { '/opt/jenkins_job_builder':
    ensure   => latest,
    provider => git,
    revision => 'master',
    source   => 'https://git.openstack.org/openstack-infra/jenkins-job-builder',
  }

  exec { 'install_jenkins_job_builder':
    command     => 'pip install /opt/jenkins_job_builder',
    path        => $jenkins::params::path,
    refreshonly => true,
    subscribe   => Vcsrepo['/opt/jenkins_job_builder'],
  }

  file { $jjb_target_dir:
    ensure => directory,
  }

  exec { 'jenkins_jobs_update':
    command     => "jenkins-jobs update --delete-old ${jjb_target_dir}/config",
    timeout     => '600',
    path        => $jenkins::params::path,
    refreshonly => true,
    require     => [
      File["${jjb_target_dir}/jenkins_jobs.ini"],
      Package['python-jenkins'],
      Package['python-yaml'],
    ],
  }

  # TODO: We should put in  notify Exec['jenkins_jobs_update']
  #       at some point, but that still has some problems.
  file { "${jjb_target_dir}/jenkins_jobs.ini":
    ensure  => present,
    mode    => '0400',
    content => template("jenkins/${config_template}.erb"),
    require => File[$jjb_target_dir],
  }
}
# class definition - end