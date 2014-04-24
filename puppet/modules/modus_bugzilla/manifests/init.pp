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
        owner    =>   root,
        group    =>   www-data,
      }
    }

    # classes to be instantiated
    include modus_bugzilla::perl_package
    include modus_bugzilla::mysql_server_package
    include modus_bugzilla::httpd_package
    include modus_bugzilla::git_package

    class { 'modus_bugzilla::bugzilla_package':
      package_type      =>   'branch',
      package_version   =>   '4.4',
      require           =>   File['/usr/local/bugzilla'],
    }
    class { 'modus_bugzilla::perl_modules_package':
      install_option   =>   'required',
      require          =>   Class['modus_bugzilla::bugzilla_package'],
    }
    class { 'modus_bugzilla::mysql_server_config':
      require   =>   Class['modus_bugzilla::perl_modules_package'],
    }
    class { 'modus_bugzilla::bugzilla_config':
      require   =>   Class['modus_bugzilla::mysql_server_config'],
    }
    class { 'modus_bugzilla::httpd_config':
      require   =>   Class['modus_bugzilla::bugzilla_config'],
    }
  }
  # class definition - end