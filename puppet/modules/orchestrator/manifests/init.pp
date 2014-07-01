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

# this module triggers all the scripts needed to install and setup modus blueprint

class orchestrator {

  # common packages
  include ::apache_starter
  include ::git
  include ::maven
  include ::mercurial
  include ::mysql_starter
  include ::openjdk
  include ::perl
  include ::php
  include ::postfix

  # stack
  include ::bugzilla
  include ::jenkins
  include ::nexus
  include ::openldap
  include ::phpldapadmin
  include ::phpmyadmin
  include ::scmmanager
  include ::sonarqube
  include ::tomcat
}