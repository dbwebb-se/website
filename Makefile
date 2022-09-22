#!/usr/bin/make -f
#
# Build website with environment
#

# --------------------------------------------------------------------------
#
# General
#

# Detect OS
OS = $(shell uname -s)

# Defaults
ECHO = echo

# Make adjustments based on OS
# http://stackoverflow.com/questions/3466166/how-to-check-if-running-in-cygwin-mac-or-linux/27776822#27776822
ifneq (, $(findstring CYGWIN, $(OS)))
	ECHO = /bin/echo -e
endif

# Colors and helptext
NO_COLOR	= \033[0m
ACTION		= \033[32;01m
OK_COLOR	= \033[32;01m
ERROR_COLOR	= \033[31;01m
WARN_COLOR	= \033[33;01m

# Which makefile am I in?
WHERE-AM-I = "$(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))"
THIS_MAKEFILE := $(call WHERE-AM-I)

# Echo some nice helptext based on the target comment
HELPTEXT = $(ECHO) "$(ACTION)--->" `egrep "^\# target: $(1) " $(THIS_MAKEFILE) | sed "s/\# target: $(1)[ ]*-[ ]* / /g"` "$(NO_COLOR)"


# --------------------------------------------------------------------------
#
# Local
#
WWW_SITE	:= dbwebb.se
WWW_LOCAL	:= local.$(WWW_SITE)
SERVER_ADMIN := mos@$(WWW_SITE)
BASE_URL    = https://$(WWW_SITE)/

GIT_BASE 	= git/$(WWW_SITE)
HTDOCS_BASE = $(HOME)/htdocs
LOCAL_HTDOCS = $(HTDOCS_BASE)/$(WWW_SITE)
ROBOTSTXT	 := robots.txt

# Certificates for https
#SSL_APACHE_CONF = /etc/letsencrypt/options-ssl-apache.conf
SSL_APACHE_CONF = $(LOCAL_HTDOCS)/config/apache/options-ssl-apache.conf
SSL_PEM_BASE 	= /etc/letsencrypt/live/$(WWW_SITE)

# Theme
LESSC   := node_modules/.bin/lessc
CSSLINT := node_modules/.bin/csslint
LESS 			:= theme/style_dbwebb.less
LESS_OPTIONS 	:= --strict-imports --include-path=theme/modules:theme/modules/vertical-grid/less:theme/modules/typographic-grid/less:theme/modules/responsive-menu/src/less:theme/modules/figure/less:theme/mos-theme/style
FONT_AWESOME	:= theme/mos-theme/style/font-awesome/fonts/

# Cache
FORUM_CACHE = $(LOCAL_HTDOCS)/htdocs/forum/cache

# Publish
EXCLUDE_ON_PUBLISH = --exclude old --exclude backup --exclude .git --exclude .solution --exclude .solutions --exclude error.log --exclude cache --exclude access.log --delete

# Backup
TODAY = `date +'%y%m%d'`

# target: help                    - Displays help.
.PHONY:  help
help:
	@$(call HELPTEXT,$@)
	@$(ECHO) "Usage:"
	@$(ECHO) " make [target] ..."
	@$(ECHO) "target:"
	@egrep "^# target:" $(THIS_MAKEFILE) | sed 's/# target: / /g'



# target: docker                  - Enable to execute in docker.
.PHONY: docker
docker: clean-cache-anax
	@$(call HELPTEXT,$@)
	# Always do "make clean-cache-anax"
	#  after you have updated files in 'content/',
	#  this enables the 'cache/anax/' cache to be re-built.



# target: warm-cache              - Warm up the cache.
.PHONY: warm-cache
warm-cache:
	@$(call HELPTEXT,$@)
	# Update this to pre warm the (local) cache
	@-install -d -m 777 $(LOCAL_HTDOCS)/cache/anax-warm
	@-install -d -m 777 $(LOCAL_HTDOCS)/cache/anax
	bash -c "time php $(LOCAL_HTDOCS)/script/cache-warm.php"
	@-rm -rf $(LOCAL_HTDOCS)/cache/anax-pre
	@-mv $(LOCAL_HTDOCS)/cache/anax $(LOCAL_HTDOCS)/cache/anax-pre
	@-mv $(LOCAL_HTDOCS)/cache/anax-warm $(LOCAL_HTDOCS)/cache/anax

	curl --silent --insecure https://dbwebb.se/om > /dev/null



# target: install-cache-anax      - Install the local anax cache directory.
.PHONY: install-cache-anax
install-cache-anax:
	@$(call HELPTEXT,$@)
	-bash -c "install -d -m 777 cache/{cimage,anax}"



# target: clean-cache-anax        - Clean the local anax cache directory.
.PHONY: clean-cache-anax
clean-cache-anax: install-cache-anax
	@$(call HELPTEXT,$@)
	-rm -f cache/anax/*



# target: update                  - Update codebase (no submodules) and publish by clearing the cache.
.PHONY: update
update: codebase-update site-build local-publish warm-cache
	@$(call HELPTEXT,$@)



# target: update-all              - Update codebase and publish by clearing the cache.
.PHONY: update-all
update-all: codebase-update submodule-update site-build local-publish warm-cache
	@$(call HELPTEXT,$@)



# target: local-publish           - Publish website to local host.
.PHONY: local-publish
local-publish:
	@$(call HELPTEXT,$@)
	rsync -av $(EXCLUDE_ON_PUBLISH) config content htdocs script vendor $(LOCAL_HTDOCS)

	@# Enable upload of attachement to the forum
	[ ! -d $(LOCAL_HTDOCS)/htdocs/forum/files ] ||  chmod 777 $(LOCAL_HTDOCS)/htdocs/forum/files

	@# Recreate the link to the forum cache, since its not rsynced
	if [ -d  $(LOCAL_HTDOCS)/htdocs/forum ]; then ln -sf ../../cache/forum  $(LOCAL_HTDOCS)/htdocs/forum/cache; fi
	#rsync -av "./cache/" $(LOCAL_HTDOCS)/cache/

	@# Enable robots if available
	[ ! -f $(ROBOTSTXT) ] || cp $(ROBOTSTXT) "$(LOCAL_HTDOCS)/htdocs/robots.txt"

	# Make soma parts writable
	# https://dbwebb.se/repo/htmlphp/example/pdo-sqlite/
	if [ -d $(LOCAL_HTDOCS)/htdocs/repo/htmlphp/example/pdo-sqlite/db/ ]; then chmod 777 $(LOCAL_HTDOCS)/htdocs/repo/htmlphp/example/pdo-sqlite/db/; chmod 666 $(LOCAL_HTDOCS)/htdocs/repo/htmlphp/example/pdo-sqlite/db/*; fi



# target: local-cache-clear       - Clear the cache.
.PHONY: local-cache-clear
local-cache-clear:
	@$(call HELPTEXT,$@)
	-sudo rm -rf $(LOCAL_HTDOCS)/cache/anax/
	-install -d $(LOCAL_HTDOCS)/cache/anax/
	-chmod 777 $(LOCAL_HTDOCS)/cache/anax/
	#-sudo rm -f $(LOCAL_HTDOCS)/cache/forum/*



# target: local-publish-clear     - Publish website to local host and clear the cache.
.PHONY: local-publish-clear
local-publish-clear: local-cache-clear local-publish
	@$(call HELPTEXT,$@)



# target: production-publish      - Publish latest to the production server.
production-publish:
	@$(call HELPTEXT,$@)
	ssh -p 22 mos@$(WWW_SITE) -t "cd $(GIT_BASE) && git pull && make update"



# target: install-dev             - Install local development tools.
.PHONY: install-dev
install-dev:
	@$(call HELPTEXT,$@)
	npm install



# target: update-dev              - Update local development tools.
.PHONY: update-dev
update-dev:
	@$(call HELPTEXT,$@)
	npm install



# target: reinit-databases - Clear and reinit the databases used as example.
.PHONY: reinit-databases
reinit-databases:
	@$(call HELPTEXT,$@)
	wget --quiet -O /dev/null $(BASE_URL)repo/htmlphp/example/pdo-sqlite/init.php

	# oophp filmdatabas
	wget --quiet -O /dev/null "https://arkiv.dbwebb.se/kod-exempel//gor-din-egen-filmdatabas/movie_reset.php?restore"



# target: local-publish-forum - Publish website and clear forum template cache.
.PHONY: local-publish-forum
local-publish-forum: local-cache-clear local-publish
	@$(call HELPTEXT,$@)
	-sudo rm -f $(LOCAL_HTDOCS)/cache/forum/tpl_dbwebb-v2.0_*



# target: codebase-update    - Update codebase.
.PHONY: codebase-update
codebase-update:
	@$(call HELPTEXT,$@)
	git pull
	composer install



# target: forum-init      - Init the forum structure, run after publish.
.PHONY: forum-init
forum-init:
	rsync -av htdocs/forum/files_/ $(LOCAL_HTDOCS)/cache/forum-files/
	chmod -f 666 $(LOCAL_HTDOCS)/cache/forum-files/* || true



# target: submodule-init      - Init all submodules.
# target: submodule-update    - Update all submodules.
.PHONY: submodule-init submodule-update
submodule-init:
	-git submodule update --init --recursive

submodule-update:
	-git pull --recurse-submodules && git submodule foreach git pull origin master



# target: server-node-echo    - Start up the echo server.
.PHONY: server-node-echo
server-node-echo:
	@$(call HELPTEXT,$@)
	cd $(LOCAL_HTDOCS)/htdocs/repo/javascript/example/lekplats/broadcast-server-with-node-js-and-html5-websockets && nodejs websocket_broadcastserver.js



# target: backup              - Take a backup of database and other essentials.
.PHONY: backup
backup:
	@$(call HELPTEXT,$@)
	install -d backup/$(TODAY)

	# Forum
	mysqldump -uroot dbw_forum | gzip > backup/$(TODAY)/dbw_forum.gz
	install -d backup/$(TODAY)/forum/files/
	rsync -a $(LOCAL_HTDOCS)/htdocs/forum/files/ backup/$(TODAY)/forum/files/

	# Point to latest successful backup
	rm -f backup/latest
	ln -s $(TODAY) backup/latest



# target: load-latest-backup      - Load latest backup from backup/latest.
.PHONY: load-latest-backup
load-latest-backup:
	@$(call HELPTEXT,$@)

	# Forum
	zcat backup/latest/dbw_forum.gz | mysql -uroot dbw_forum
	rsync -a --delete backup/latest/forum/files/ htdocs/forum/files/



# target: get-latest-backup       - Get latest backup from production.
.PHONY: get-latest-backup
get-latest-backup:
	@$(call HELPTEXT,$@)
	install -d backup/$(TODAY)
	rsync -av --delete -e "ssh -p 2222" mos@$(WWW_SITE):$(GIT_BASE)/backup/latest/ backup/$(TODAY)/

	# Point to latest successful backup
	rm -f backup/latest
	ln -s $(TODAY) backup/latest



# target: database-create         - Create needed databases.
.PHONY: database-create
database-create:
	@$(call HELPTEXT,$@)

	# Forum
	#create database dbw_forum;
	#grant all on dbw_forum.* to 'dbwebb'@'localhost' identified by 'password';

	#create database Anaxoophp;
	#grant all on Anaxoophp.* to acronym@localhost identified by 'password';

	#create database Movie;
	#grant all on Movie.* to 'acronym'@'localhost' identified by 'password';



# target: forum-no-activation    - No activation of new users.
.PHONY: forum-no-activation
forum-no-activation:
	@$(call HELPTEXT,$@)

	$(ECHO) "UPDATE phpbb_config SET config_value = 3 WHERE config_name = 'require_activation';" | mysql -uroot dbw_forum


#
# Build
#
.PHONY: prepare-build

prepare-build:
	rm -rf build
	install -d build/css build/lint



# target: less-update - Build less and update site.
.PHONY: less-update
less-update: less local-publish



# target: less-update-clear - Build less and update site and clear cache.
.PHONY: less-update-clear
less-update-clear: less local-publish-clear



# target: less - Build less stylesheet and update the site with it.
.PHONY: less
less: prepare-build
	#lessc $(LESS_OPTIONS) $(LESS) build/css/style.css
	lessc --clean-css $(LESS_OPTIONS) $(LESS) build/css/style.min.css
	#cp build/css/style.css htdocs/css/style.css
	cp build/css/style.min.css htdocs/css/style.min.css

	# Grid images§
	install -d htdocs/img/theme/
	rsync -av theme/modules/vertical-grid/img/ htdocs/img/theme/vertical-grid/
	rsync -av theme/modules/typographic-grid/img/ htdocs/img/theme/typographic-grid/

	# Theme js
	install -d htdocs/js/theme/
	rsync -av theme/js/ htdocs/js/theme/

	# Responsive menu
	rsync -av theme/modules/responsive-menu/htdocs/js/responsive-menu.min.js htdocs/js/theme

	# Font awesome
	rsync -av $(FONT_AWESOME) htdocs/fonts/



#
# Lint
#
.PHONY: lint

lint: less
	lessc --lint $(LESS) > build/lint/style.less
	- csslint build/css/style.css > build/lint/style.css
	ls -l build/lint/



# target: site-build              - Create essential directories and copy from vendor.
.PHONY: site-build
site-build:
	# Create and sync cache
	#bash -c "install -d -m 777 cache/{cimage,anax,forum,forum-files}"
	bash -c "install -d -m 777 cache/{cimage,anax}"
	rsync -av cache $(LOCAL_HTDOCS)

	# Copy from CImage
	install -d htdocs/cimage
	bash -c "rsync -av vendor/mos/cimage/webroot/{img,imgd,imgf,imgp,imgs,check_system}.php vendor/mos/cimage/icc htdocs/cimage"
	rsync -av vendor/mos/cimage/webroot/img/ htdocs/img/cimage/



# # target: site-build-docker       - Create essential directories for a docker installation.
# .PHONY: site-build-docker
# site-build-docker:
# 	# Create and sync cache
# 	bash -c "install -d -m 777 cache/{cimage,anax,forum,forum-files}"
#
# 	# Copy from CImage
# 	install -d htdocs/cimage
# 	bash -c "rsync -av vendor/mos/cimage/webroot/{img,imgd,imgf,imgp,imgs,check_system}.php vendor/mos/cimage/icc htdocs/cimage"
# 	rsync -av vendor/mos/cimage/webroot/img/ htdocs/img/cimage/



# target: etc-hosts          - Create a entry in the /etc/hosts for local access.
.PHONY: etc-hosts
etc-hosts:
	$(ECHO) "127.0.0.1 $(WWW_LOCAL)" | sudo bash -c 'cat >> /etc/hosts'
	@tail -1 /etc/hosts



# target: ssl-cert-create    - One way to create the certificates.
.PHONY: ssl-cert-create
ssl-cert-create:
	#cd $(HOME)/git/letsencrypt
	#./letsencrypt-auto certonly --standalone -d $(WWW_SITE) -d www.$(WWW_SITE)
	sudo certbot certonly --standalone -d $(WWW_SITE) -d www.$(WWW_SITE)



# target: ssl-cert-update    - Update certificates with new expiray date.
.PHONY: ssl-cert-renew
ssl-cert-renew:
	#cd $(HOME)/git/letsencrypt
	#./letsencrypt-auto renew
	sudo service apache2 stop
	sudo certbot renew
	sudo service apache2 start


# target: install-fresh      - Do a fresh installation of a new server.
.PHONY: install-fresh
install-fresh: etc-hosts virtual-host update



# target: virtual-host       - Create entries for the virtual host http.
.PHONY: virtual-host

define VIRTUAL_HOST_80
Define site $(WWW_SITE)
ServerAdmin $(SERVER_ADMIN)
ServerName $${site}

<VirtualHost *:80>
	ServerAlias local.$${site}
	ServerAlias do4.$${site}
	ServerAlias do3.$${site}
	ServerAlias bth1.$${site}
	DocumentRoot $(HTDOCS_BASE)/$${site}/htdocs
	ServerSignature Off

	Include $(HTDOCS_BASE)/$${site}/config/apache-env
	Include $(HTDOCS_BASE)/$${site}/config/apache-redirects
	Include $(HTDOCS_BASE)/$${site}/config/apache-rewrites

	<Directory />

		#FallbackResource /index.php

		# Rewrite to frontcontroller
		RewriteEngine on
		RewriteCond %{REQUEST_FILENAME} !-f
		RewriteCond %{REQUEST_FILENAME} !-d
		RewriteRule .* index.php [NC,L]

		Options Indexes FollowSymLinks
		AllowOverride None
		Require all granted
		Order allow,deny
		Allow from all
		Deny from env=spambot

		Options +ExecCGI
		AddHandler cgi-script .cgi

	</Directory>

	<FilesMatch "\.(jpe?g|png|gif|js|css|svg|ttf|otf|eot|woff|woff2|ico)$">
		ExpiresActive On
		ExpiresDefault "access plus 1 week"
	</FilesMatch>

	#LogLevel alert rewrite:trace6
	# tail -f error.log | fgrep '[rewrite:'

	ErrorLog  $(HTDOCS_BASE)/$${site}/error.log
	CustomLog $(HTDOCS_BASE)/$${site}/access.log combined
</VirtualHost>
endef
export VIRTUAL_HOST_80

define VIRTUAL_HOST_80_WWW
Define site $(WWW_SITE)
ServerAdmin $(SERVER_ADMIN)

<VirtualHost *:80>
	ServerName www.$${site}
	Redirect "/" "http://$${site}/"
</VirtualHost>
endef
export VIRTUAL_HOST_80_WWW

virtual-host:
	install -d $(LOCAL_HTDOCS)/htdocs
	$(ECHO) "$$VIRTUAL_HOST_80" | sudo bash -c 'cat > /etc/apache2/sites-available/$(WWW_SITE).conf'
	$(ECHO) "$$VIRTUAL_HOST_80_WWW" | sudo bash -c 'cat > /etc/apache2/sites-available/www.$(WWW_SITE).conf'
	sudo a2ensite $(WWW_SITE) www.$(WWW_SITE)
	sudo a2enmod rewrite expires cgi setenvif
	sudo apachectl configtest
	sudo service apache2 reload



# target: virtual-host-echo  - Echo virtual host for http.
virtual-host-echo:
	@$(ECHO) "$$VIRTUAL_HOST_80"
	#$(ECHO) "$$VIRTUAL_HOST_80_WWW"



# target: virtual-host-https - Create entries for the virtual host https.
.PHONY: virtual-host-https

define VIRTUAL_HOST_443
Define site $(WWW_SITE)
ServerAdmin $(SERVER_ADMIN)

<VirtualHost *:80>
    ServerName $${site}
	ServerAlias do4.$${site}
	ServerAlias do3.$${site}
	ServerAlias bth1.$${site}
	Redirect "/" "https://$${site}/"
</VirtualHost>

<VirtualHost *:443>
    ServerName $${site}

	Include $(SSL_APACHE_CONF)
	SSLCertificateFile 		$(SSL_PEM_BASE)/cert.pem
	SSLCertificateKeyFile 	$(SSL_PEM_BASE)/privkey.pem
	SSLCertificateChainFile $(SSL_PEM_BASE)/chain.pem

	ServerName $${site}
	ServerAlias do4.$${site}
	ServerAlias do3.$${site}
	DocumentRoot $(HTDOCS_BASE)/$${site}/htdocs
	ServerSignature Off

	Include $(HTDOCS_BASE)/$${site}/config/apache-env
	Include $(HTDOCS_BASE)/$${site}/config/apache-redirects
	Include $(HTDOCS_BASE)/$${site}/config/apache-rewrites

	<Directory />

		#FallbackResource /index.php

		# Rewrite to frontcontroller
		RewriteEngine on
		RewriteCond %{REQUEST_FILENAME} !-f
		RewriteCond %{REQUEST_FILENAME} !-d
		RewriteRule .* index.php [NC,L]

		Options Indexes FollowSymLinks
		AllowOverride None
		Require all granted
		Order allow,deny
		Allow from all
		Deny from env=spambot

		Options +ExecCGI
		AddHandler cgi-script .cgi

	</Directory>

	<FilesMatch "\.(jpe?g|png|gif|js|css|svg|ttf|otf|eot|woff|woff2|ico)$">
		ExpiresActive On
		ExpiresDefault "access plus 1 week"
	</FilesMatch>

	#LogLevel alert rewrite:trace6
	# tail -f error.log | fgrep '[rewrite:'

	ErrorLog  $(HTDOCS_BASE)/$${site}/error.log
	CustomLog $(HTDOCS_BASE)/$${site}/access.log combined
</VirtualHost>
endef
export VIRTUAL_HOST_443

define VIRTUAL_HOST_443_WWW
Define site $(WWW_SITE)
ServerAdmin $(SERVER_ADMIN)

<VirtualHost *:80>
    ServerName www.$${site}
	Redirect "/" "https://$${site}/"
</VirtualHost>

<VirtualHost *:443>
    ServerName www.$${site}

	Include $(SSL_APACHE_CONF)
	SSLCertificateFile 		$(SSL_PEM_BASE)/cert.pem
	SSLCertificateKeyFile 	$(SSL_PEM_BASE)/privkey.pem
	SSLCertificateChainFile $(SSL_PEM_BASE)/chain.pem

	Redirect "/" "https://$${site}/"
</VirtualHost>
endef
export VIRTUAL_HOST_443_WWW

virtual-host-https:
	$(ECHO) "$$VIRTUAL_HOST_443" | sudo bash -c 'cat > /etc/apache2/sites-available/$(WWW_SITE).conf'
	$(ECHO) "$$VIRTUAL_HOST_443_WWW" | sudo bash -c 'cat > /etc/apache2/sites-available/www.$(WWW_SITE).conf'
	sudo a2enmod ssl
	sudo apachectl configtest
	sudo service apache2 reload
