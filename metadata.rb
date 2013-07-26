maintainer        "Martin Fenner"
maintainer_email  "mfenner@plos.org"
license           "MIT"
description       "Configures orcid-feed"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "1.0.0"
depends           "apt"
depends           "build-essential"
depends           "git"
depends           "passenger_apache2"
depends           "phantomjs"

%w{ ubuntu }.each do |os|
  supports os
end