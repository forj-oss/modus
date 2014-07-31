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

# resource definition - start
define jenkins::manage_job_templates (

  $job_template     = $name,
  $jenkins_jobs_dir = $jenkins_jobs_dir,
  $jjb_target_dir   = undef,
){

  # creates yaml file from template
  file { "${jjb_target_dir}/config/${job_template}.yaml":
    ensure  => present,
    owner   => root,
    group   => root,
    content => template("jenkins/${job_template}_yaml.erb"),
  }

  # executes jjb using the yaml file and creates the job itself
  exec { "jenkins-jobs --ignore-cache update ${jjb_target_dir}/config/${job_template}.yaml":
    path      => '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin',
    logoutput => true,
    user      => root,
    group     => root,
    onlyif    => ["test -d ${jenkins_jobs_dir}", "test ! -d ${jenkins_jobs_dir}/${job_template}"],
    require   => File["${jjb_target_dir}/config/${job_template}.yaml"],
  }
}
# resource definition - end