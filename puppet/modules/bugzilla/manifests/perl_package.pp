  # module designed to install the latest perl, pmtools and cpanminus packages

  # class definition - start
  class bugzilla::perl_package (

    $perl                    =   'perl',
    $pmtools                 =   'pmtools',
    $cpanminus               =   'cpanminus',
    $perl_packages_version   =   'latest',
  ){

    # perl package installation
    if ! defined(Package[$perl]) {
      package { $perl:
        ensure   =>   $perl_packages_version,
      }
    }

    # pmtools package installation
    if ! defined(Package[$pmtools]) {
      package { $pmtools:
        ensure   =>   $perl_packages_version,
      }
    }

    # cpanminus package installation
    if ! defined(Package[$cpanminus]) {
      package { $cpanminus:
        ensure   =>   $perl_packages_version,
      }
    }
  }
  # class definition - end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            