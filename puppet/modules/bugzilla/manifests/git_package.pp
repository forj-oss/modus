  # module designed to install and set up the latest git package, this is done through ppa repositories

  # class definition - start
  class bugzilla::git_package (

    $git                   =   'git',
    $git_package_version   =   'latest',
  ){

    # class variable
    $git_ppa   =   'ppa:git-core/ppa'

    # instantiates puppetlabs-apt module for managing apt command
    class { '::apt': }        

    # creates ppa repository for latest git package to be installed
    ::apt::ppa { $git_ppa: }

    # git package installation
    if ! defined(Package[$git]) {
      package { $git:
        ensure    =>   $git_package_version,
        require   =>   Apt::Ppa[$git_ppa],
      }
    }
  }
  # class definition - end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            