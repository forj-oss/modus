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

  # module designed to interact with apache through puppetlabs-apache module in order to create a vhost for bugzilla to work with

  # class definition - start
  class bugzilla::apache
  inherits bugzilla::params {

    # class required for this module to work
    require ::apache_starter

    # apache vhost creation and set up
    ::apache::vhost { 'bugzilla':
      port            =>   "${bugzilla_port}",
      docroot         =>   "${bugzilla_target_dir}",
      docroot_owner   =>   'www-data',
      docroot_group   =>   'www-data',
      directories     =>   [
          {
            path          =>   "${bugzilla_target_dir}",
            options       =>   ['Indexes', '+ExecCGI', 'FollowSymLinks','MultiViews'],
            addhandlers   =>   [{ handler => 'cgi-script', extensions => ['.cgi']}],
          },
      ]

      #ssl       => true,
      #ssl_cert  => '/etc/ssl/bugzilla_houston_hp_com.crt',
      #ssl_key   => '/etc/ssl/bugzilla_houston_hp_com.key'
    }
  }
  # class definition - end