name             'openiaml.org'
maintainer       'Jevon Wright'
maintainer_email 'jevon@jevon.org'
license          'all_rights'
description      'Installs/Configures openiaml.org'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.5'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/openiaml.org/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/openiaml.org' if respond_to?(:source_url)

depends "apache2"
depends "apt"
