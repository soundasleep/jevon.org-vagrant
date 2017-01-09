jevon.org
=========

# Setting up with Vagrant

Install Vagrant (and Virtualbox), check out this project, and then simply run:

```
vagrant up
vagrant provision
```

Once completed, you should be able to go to http://localhost:8080 and see the openiaml.org homepage.

# Automated test

You can also run `bundle` then `bundle exec cucumber` to run quick smoke tests
for each of the deployed sites.

# Deploying onto production

**TODO** In theory, you can run each of the scripts as root from a fresh install,
and everything will get set up automatically.

# Features supported

- One static HTML application
- - openiaml.org

# Private data

Some sites have private data that I don't want on GitHub -
things like version control URLs, usernames, passwords.
These can all be stored in /private/RECIPE.json and this
will be picked up with `chef.sh` on init.

# Redeploying a site

**TODO** In theory, just `chef-solo ...` with the specific site JSON... not tested yet...

# Developing Chef recipe changes

1. Make a change to my-cookbooks/RECIPE/recipes/default.rb
2. Run `./update.sh RECIPE` to rebuild Berksfile.lock and re-vendor cookbooks
3. Run (as root) `chef-solo ...`, as usual

# TODO (MVP)

- Domains setup
- - Jevon.org running (currently PHP, future Rails)
- - Openiaml.org running (static HTML)
- Infrastructure setup
- - Iptables configured
- - Fail2ban configured
- Services setup
- - Apache on 80 and 443 with SSL
- - MySQL with multiple databases and users per application
- - SSH on custom port, preferably login with ~/.id_rsa
- - Disk space warnings
- Applications setup
- - One static HTML applications
- - - openiaml.org
- - Two PHP applications
- - - Phpinfo
- - - Redmine
- - Two Ruby on Rails applications
- - - Boggle.jevon.org
- - - ??
- - One OpenID server
- Cron jobs set up
- - Backup local database
- - Generate awstats
- Documented list on how to do each of these
- - Deploy entire jevon.org to a new VM
- - Deploy entire jevon.org to a new Linode
- - Update a single PHP or Ruby application on jevon.org
- - Update all applications on jevon.org
- - Adding a new port to close
- - Modifying fail2ban configuration

# Future ideas

- Disable Apache2 default site
- Move my-cookbooks/openiaml.org into separate repository
- Cucumber testing for SSL e.g. `curl -H "Host: mysite.com" http://1.2.3.4` or `curl --resolve example.com:80:1.2.3.4 --resolve example.com:443:2.3.4.5 http://example.com/`
