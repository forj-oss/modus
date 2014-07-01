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

# module designed to install and set up the latest apache package, this is done through puppetlabs-apache module

# class definition - start
class apache_starter::start {

  # apache package installation and set up with mod_heaers, mod_expires and mod_php enabled
  class { '::apache':
    purge_configs => false,
    mpm_module    => 'prefork',
  }

  include ::apache::mod::headers
  include ::apache::mod::expires
  include ::apache::mod::php

  ::apache::mod { 'proxy_connect': }
  include ::apache::mod::deflate
  include ::apache::mod::proxy
  include ::apache::mod::proxy_ajp
  include ::apache::mod::proxy_http
  include ::apache::mod::rewrite
}
# class definition - end
