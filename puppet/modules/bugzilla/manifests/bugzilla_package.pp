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

  # module designed to provide bugzilla package, this is done through git

  # class definition - start
  class bugzilla::bugzilla_package (

    $bugzilla_target_dir        =   '/usr/local',
    $bugzilla_package_version   =   '4.4',
  ){

    # class required for this module to work
    require bugzilla::git_package

    # class variables
    $path               =   '/usr/bin:/usr/sbin:/bin'
    $bugzilla_clone     =   "git clone --branch bugzilla-${bugzilla_package_version} http://git.mozilla.org/bugzilla/bugzilla"

    # bugzilla package cloning
    exec { $bugzilla_clone:
      path      =>   $path,
      cwd       =>   "${bugzilla_target_dir}",
      user      =>   root,
      group     =>   www-data,
      #creates   =>   "${bugzilla_target_dir}/bugzilla",
    }
  }
  # class definition - end