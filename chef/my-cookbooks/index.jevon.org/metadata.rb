name             'index.jevon.org'
maintainer       'Jevon Wright'
maintainer_email 'jevon@jevon.org'
license          'all_rights'
description      'Installs/Configures index.jevon.org'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.2'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/index.jevon.org/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/index.jevon.org' if respond_to?(:source_url)

depends "apache2"
depends "apt"
