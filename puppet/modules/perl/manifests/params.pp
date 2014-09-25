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

# module designed to set up the parameters needed for perl package

# class definition - start
class perl::params {

  $path                    = hiera('perl::params::path', '/usr/bin:/usr/sbin/:/bin:/sbin:/usr/local/bin:/usr/local/sbin')
  $perl                    = hiera('perl::params::perl', 'perl')
  $perl_package_version    = hiera('perl::params::perl_package_version', 'latest')
  $install_option          = hiera('perl::params::install_option', 'required')
  $perl_modules_target_dir = hiera('perl::params::perl_modules_target_dir', '/usr/local/bugzilla')
  $perl_required_modules   = [
    'perl install-module.pl CGI',
    'perl install-module.pl Digest::SHA',
    'perl install-module.pl Date::Format',
    'perl install-module.pl DateTime',
    'perl install-module.pl DateTime::TimeZone',
    'perl install-module.pl DBI',
    'perl install-module.pl Template',
    'perl install-module.pl Email::Send',
    'perl install-module.pl Email::MIME',
    'perl install-module.pl URI',
    'perl install-module.pl List::MoreUtils',
    'perl install-module.pl Math::Random::ISAAC',
    'perl install-module.pl DBD::mysql',
  ]
  $perl_all_modules        = hiera('perl::params::perl_all_modules', 'perl install-module.pl --all')
}
# class definition - end