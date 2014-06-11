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

  # this module triggers all the scripts needed to install bugzilla

  # class definition - start
  class bugzilla
  inherits bugzilla::params {

    # ensures that the directory for bugzilla to be installed is present
    if ! defined(File["${bugzilla_target_dir}"]) {
      file { "${bugzilla_target_dir}":
        ensure   =>   directory,
        owner    =>   www-data,
        group    =>   www-data,
      }
    }

    # classes to be instantiated
    include ::apache_starter
    include ::git
    include ::mysql_starter
    include ::perl

    class { 'bugzilla::package':
      require   =>   File["${bugzilla_target_dir}"],
    }    
    class { '::perl::modules_package':
      require   =>   Class['bugzilla::package'],
    }
    class { 'bugzilla::mysql':
      require   =>   Class['::perl::modules_package'],
    }
    class { 'bugzilla::config':
      admin_email      =>   'admin@hp-bugzilla.com',
      admin_password   =>   'letmein',
      admin_realname   =>   'admin',
      require          =>   Class['bugzilla::mysql'],
    }
    class { 'bugzilla::apache':
      require   =>   Class['bugzilla::config'],
    }
  }
  # class definition - end