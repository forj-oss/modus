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
  class bugzilla {

    # ensures that the directory for bugzilla to be installed is present
    if ! defined(File['/usr/local/bugzilla']) {
      file { '/usr/local/bugzilla':
        ensure   =>   directory,
        owner    =>   root,
        group    =>   www-data,
      }
    }

    # classes to be instantiated
    include bugzilla::perl_package
    include bugzilla::mysql_server_package
    include bugzilla::httpd_package
    include bugzilla::git_package

    class { 'bugzilla::bugzilla_package':
      require   =>   File['/usr/local/bugzilla'],
    }
    class { 'bugzilla::perl_modules_package':
      option    =>   'required',
      require   =>   Class['bugzilla::bugzilla_package'],
    }
    class { 'bugzilla::mysql_server_config':
      require   =>   Class['bugzilla::perl_modules_package'],
    }
    class { 'bugzilla::bugzilla_config':
      require   =>   Class['bugzilla::mysql_server_config'],
    }
    class { 'bugzilla::httpd_config':
      require   =>   Class['bugzilla::bugzilla_config'],
    }
  }
  # class definition - end
