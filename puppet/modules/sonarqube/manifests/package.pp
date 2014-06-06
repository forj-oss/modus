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

  # module designed to install and set up the latest sonarqube package

  # class definition - start
  class sonarqube::package
  inherits sonarqube::params {

    # classes required for this module to work
    require ::openjdk
    require ::maven
    require ::mysql_starter

    # sonarqube package
    exec { "${sonarqube}":
      path        =>   $path,
      cwd         =>   $sonarqube_tmp_dir,
      user        =>   root,
      group       =>   root,
      logoutput   =>   true,
    }

    # sonarqube package extraction
    exec { "unzip ${sonarqube_tmp_dir}/${app_name}.zip":
      path        =>   $path,
      cwd         =>   $sonarqube_target_dir,
      user        =>   root,
      group       =>   root,
      logoutput   =>   true,
      require     =>   Exec["${sonarqube}"],
    }

    # ensures that the config file for sonarqube to be configured is present
    file { "${sonarqube_config_file}":
      ensure    =>   present,
      owner     =>   root,
      group     =>   root,
      content   =>   template("sonarqube/${sonarqube_config_template}.erb"),
      require   =>   Exec["unzip ${sonarqube_tmp_dir}/${app_name}.zip"],
    }

    # sonarqube war file creation
    exec { "sh build-war.sh":
      path        =>   $path,
      cwd         =>   "${sonarqube_target_dir}/sonar-${sonarqube_package_version}/war",
      user        =>   root,
      group       =>   root,
      logoutput   =>   true,
      require     =>   File["${sonarqube_config_file}"],
    }
  }
  # class definition - end
