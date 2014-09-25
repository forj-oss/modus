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

  # creates config folder for default templates to be stored
  file { "${jjb_target_dir}/config":
    ensure => directory,
    owner  => root,
    group  => root,
  }

  jenkins::manage_job_templates { $job_template:
    jjb_target_dir   => $jjb_target_dir,
    jenkins_jobs_dir => $jenkins::params::jenkins_jobs_dir,
    require          => File["${jjb_target_dir}/config"],
  }
}
# class definition - end