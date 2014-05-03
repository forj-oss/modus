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
  class modus_bugzilla::bugzilla_package (

    $package_revision      =   $modus_bugzilla::bugzilla_params::package_revision,
    $bugzilla_target_dir   =   $modus_bugzilla::bugzilla_params::bugzilla_target_dir,
  ) inherits modus_bugzilla::bugzilla_params {

    # class required for this module to work
    require modus_bugzilla::git_package

    vcsrepo { "${bugzilla_target_dir}":
      ensure     =>   present,
      provider   =>   git,
      source     =>   'http://git.mozilla.org/bugzilla/bugzilla',
      revision   =>   $package_revision,
      #user       =>   root,
      user       =>   www-data,
      group      =>   www-data,
    }
  }
  # class definition - end