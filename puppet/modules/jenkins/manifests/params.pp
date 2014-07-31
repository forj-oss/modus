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

# module designed to set up the parameters needed for jenkins package

# class definition - start
class jenkins::params (

  $jenkins_package_revision = hiera('jenkins::params::jenkins_package_revision', '1.573'),
  $jenkins_target_dir       = hiera('jenkins::params::jenkins_target_dir', '/usr/local/jenkins'),
  $app_name                 = hiera('jenkins::params::app_name', 'jenkins'),
  $tomcat_port              = hiera('jenkins::params::tomcat_port', '8080'),
  $jjb_target_dir           = hiera('jenkins::params::jenkins_target_dir', '/etc/jenkins_jobs'),
){

  $path             = hiera('jenkins::params::path', '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin')
  $jenkins          = "wget -O ${app_name}.war http://mirrors.jenkins-ci.org/war/${jenkins_package_revision}/jenkins.war"
  $target_war_file  = "${jenkins_target_dir}/${app_name}.war"
  $jenkins_jobs_dir = hiera('jenkins::params::jenkins_jobs_dir', '/usr/share/tomcat7/.jenkins/jobs')
  $config_template  = hiera('jenkins::params::config_template', 'jenkins_jobs_ini')
  $jenkins_vhost    = hiera('jenkins::params::jenkins_vhost', $::ec2_public_ipv4)
  $jenkins_protocol = hiera('jenkins::params::jenkins_protocol','http')
  $url              = "${jenkins_protocol}://${jenkins_vhost}:${tomcat_port}/${app_name}"
  $username         = hiera('jenkins::params::username', '')
  $password         = hiera('jenkins::params::password', '')
  $job_template     = hiera('jenkins::params::job_template', [])
}
# class definition - end
