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
class jenkins::job_builder_execute (

  $job_template = $jenkins::params::job_template,
) inherits jenkins::params {

  $jjb_target_dir = $jenkins::params::jjb_target_dir

  file { "${jjb_target_dir}/config":
    ensure => directory,
    owner  => root,
    group  => root,
  }

  jenkins::copy_job_templates { $job_template:
    jjb_target_dir => $jjb_target_dir,
    require        => File["${jjb_target_dir}/config"],
    before         => Exec["jenkins-jobs --ignore-cache update ${jjb_target_dir}/config"],
  }

  exec { "jenkins-jobs --ignore-cache update ${jjb_target_dir}/config":
    path      => '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin',
    logoutput => true,
    user      => root,
    group     => root,
    onlyif    => 'test -d /usr/share/tomcat7/.jenkins/jobs',
  }
}
# class definition - end