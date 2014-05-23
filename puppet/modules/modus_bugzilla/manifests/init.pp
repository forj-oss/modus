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
  class modus_bugzilla {

    # ensures that the directory for bugzilla to be installed is present
    if ! defined(File['/usr/local/bugzilla']) {
      file { '/usr/local/bugzilla':
        ensure   =>   directory,
        owner    =>   www-data,
        group    =>   www-data,
      }
    }

    # classes to be instantiated
    include ::modus_perl::perl_package
    include ::modus_mysql::mysql_package
    include ::modus_apache::apache_package
    include ::modus_git::git_package

    class { 'modus_bugzilla::bugzilla_package':
      require   =>   File['/usr/local/bugzilla'],
    }    
    class { '::modus_perl::perl_modules_package':
      require   =>   Class['modus_bugzilla::bugzilla_package'],
    }
    class { 'modus_bugzilla::mysql_config':
      require   =>   Class['::modus_perl::perl_modules_package'],
    }
    class { 'modus_bugzilla::bugzilla_config':
      admin_email      =>   'admin@hp-bugzilla.com',
      admin_password   =>   'letmein',
      admin_realname   =>   'admin',
      require          =>   Class['modus_bugzilla::mysql_config'],
    }
    class { 'modus_bugzilla::apache_config':
      require   =>   Class['modus_bugzilla::bugzilla_config'],
    }
  }
  # class definition - end