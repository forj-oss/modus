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

  # module designed to set up the parameters needed for postfix package

  # class definition - start
  class postfix::params (

    $postfix_target_dir   =   '/etc/postfix',
  ){

    $postfix                   =   'postfix'
    $postfix_package_version   =   'latest'
    $myhostname                =    $fqdn
    $alias_maps                =   '/etc/aliases'
    $alias_database            =   '/etc/aliases'
    $myorigin                  =   '/etc/mailname'
    $relayhost                 =   ''
    $mynetworks                =   "127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128"
    $mailbox_size_limit        =   0
    $recipient_delimiter       =   '+'
    $inet_interfaces           =   'all'
    $config_template           =   'main_cf'
    $config_file               =   "${postfix_target_dir}/${$config_template}"
    $mydestination             =   "${myhostname}, localhost.${domain}, , localhost"
  }
  # class definition - end