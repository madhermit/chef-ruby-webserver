name             'ruby-webserver'
maintainer       'Hunter'
maintainer_email 'hunter@madhermit.net'
license          'All rights reserved'
description      'Installs/Configures ruby-webserver'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

supports        'ubuntu'
version          '0.1.4'

depends "apt"
depends "hostname"
depends "git"
depends "nginx"
depends "unicorn"
depends "postgresql"
depends "redis"
depends "ruby_rbenv"
depends "ruby_build"
depends "build-essential"
