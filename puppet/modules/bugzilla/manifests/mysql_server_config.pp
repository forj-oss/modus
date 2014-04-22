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

  # module designed to interact with mysql through puppetlabs-mysql module in order to create a new database with its user for bugzilla to work with

  # class definition - start
  class bugzilla::mysql_server_config {

    # creates "bugzilla_db" and "bugzilla_user" on localhost and manage them within mysql
    ::mysql::db { 'bugzilla_db':
      user       =>   'bugzilla_user',
      password   =>   'letmein',
      host       =>   'localhost',
      grant      =>   ['SELECT', 'INSERT', 'UPDATE', 'DELETE', 'INDEX', 'ALTER', 'CREATE', 'LOCK TABLES', 'CREATE TEMPORARY TABLES', 'DROP', 'REFERENCES'],
    }
  }
  # class definition - end