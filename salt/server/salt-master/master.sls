##### Primary configuration settings #####
##########################################
# This configuration file is used to manage the behavior of the Salt Master.
# Values that are commented out but have an empty line after the comment are
# defaults that do not need to be set in the config. If there is no blank line
# after the comment then the value is presented as an example and is not the
# default.

# Per default, the master will automatically include all config files
# from master.d/*.conf (master.d is a directory in the same directory
# as the main master config file).
#default_include: master.d/*.conf

# The address of the interface to bind to:
interface: {{ salt_master['interface'] }}

# Whether the master should listen for IPv6 connections. If this is set to True,
# the interface option must be adjusted, too. (For example: "interface: '::'")
#ipv6: False

# The tcp port used by the publisher:
#publish_port: 4505

# The user under which the salt master will run. Salt will update all
# permissions to allow the specified user to run the master. The exception is
# the job cache, which must be deleted if this user is changed. If the
# modified files cause conflicts, set verify_env to False.
user: root

# The port used by the communication interface. The ret (return) port is the
# interface used for the file server, authentication, job returns, etc.
#ret_port: 4506

# Specify the location of the daemon process ID file:
#pidfile: /var/run/salt-master.pid

# The root directory prepended to these options: pki_dir, cachedir,
# sock_dir, log_file, autosign_file, autoreject_file, extension_modules,
# key_logfile, pidfile:
#root_dir: /

# The path to the master's configuration file.
#conf_file: /etc/salt/master

# Directory used to store public key data:
#pki_dir: /etc/salt/pki/master

# Key cache. Increases master speed for large numbers of accepted
# keys. Available options: 'sched'. (Updates on a fixed schedule.)
# Note that enabling this feature means that minions will not be
# available to target for up to the length of the maintanence loop
# which by default is 60s.
#key_cache: ''

# Directory to store job and cache data:
# This directory may contain sensitive data and should be protected accordingly.
#
#cachedir: /var/cache/salt/master

# Directory for custom modules. This directory can contain subdirectories for
# each of Salt's module types such as "runners", "output", "wheel", "modules",
# "states", "returners", etc.
#extension_modules: <no default>

# Directory for custom modules. This directory can contain subdirectories for
# each of Salt's module types such as "runners", "output", "wheel", "modules",
# "states", "returners", "engines", etc.
# Like 'extension_modules' but can take an array of paths
#module_dirs: <no default>
#   - /var/cache/salt/minion/extmods

# Verify and set permissions on configuration directories at startup:
#verify_env: True

# Set the number of hours to keep old job information in the job cache:
#keep_jobs: 24

# The number of seconds to wait when the client is requesting information
# about running jobs.
#gather_job_timeout: 10

# Set the default timeout for the salt command and api. The default is 5
# seconds.
#timeout: 5

# The loop_interval option controls the seconds for the master's maintenance
# process check cycle. This process updates file server backends, cleans the
# job cache and executes the scheduler.
#loop_interval: 60

# Set the default outputter used by the salt command. The default is "nested".
#output: nested

# Set the default output file used by the salt command. Default is to output
# to the CLI and not to a file. Functions the same way as the "--out-file"
# CLI option, only sets this to a single file for all salt commands.
#output_file: None

# Return minions that timeout when running commands like test.ping
#show_timeout: True

# By default, output is colored. To disable colored output, set the color value
# to False.
#color: True

# Do not strip off the colored output from nested results and state outputs
# (true by default).
# strip_colors: False

# To display a summary of the number of minions targeted, the number of
# minions returned, and the number of minions that did not return, set the
# cli_summary value to True. (False by default.)
#
#cli_summary: False

# Set the directory used to hold unix sockets:
#sock_dir: /var/run/salt/master

# The master can take a while to start up when lspci and/or dmidecode is used
# to populate the grains for the master. Enable if you want to see GPU hardware
# data for your master.
# enable_gpu_grains: False

# The master maintains a job cache. While this is a great addition, it can be
# a burden on the master for larger deployments (over 5000 minions).
# Disabling the job cache will make previously executed jobs unavailable to
# the jobs system and is not generally recommended.
#job_cache: True

# Cache minion grains, pillar and mine data via the cache subsystem in the
# cachedir or a database.
#minion_data_cache: True

# Cache subsystem module to use for minion data cache.
#cache: localfs
# Enables a fast in-memory cache booster and sets the expiration time.
#memcache_expire_seconds: 0
# Set a memcache limit in items (bank + key) per cache storage (driver + driver_opts).
#memcache_max_items: 1024
# Each time a cache storage got full cleanup all the expired items not just the oldest one.
#memcache_full_cleanup: False
# Enable collecting the memcache stats and log it on `debug` log level.
#memcache_debug: False

# Store all returns in the given returner.
# Setting this option requires that any returner-specific configuration also
# be set. See various returners in salt/returners for details on required
# configuration values. (See also, event_return_queue below.)
#
#event_return: mysql

# On busy systems, enabling event_returns can cause a considerable load on
# the storage system for returners. Events can be queued on the master and
# stored in a batched fashion using a single transaction for multiple events.
# By default, events are not queued.
#event_return_queue: 0

# Only return events matching tags in a whitelist, supports glob matches.
#event_return_whitelist:
#  - salt/master/a_tag
#  - salt/run/*/ret

# Store all event returns **except** the tags in a blacklist, supports globs.
#event_return_blacklist:
#  - salt/master/not_this_tag
#  - salt/wheel/*/ret

# Passing very large events can cause the minion to consume large amounts of
# memory. This value tunes the maximum size of a message allowed onto the
# master event bus. The value is expressed in bytes.
#max_event_size: 1048576

# By default, the master AES key rotates every 24 hours. The next command
# following a key rotation will trigger a key refresh from the minion which may
# result in minions which do not respond to the first command after a key refresh.
#
# To tell the master to ping all minions immediately after an AES key refresh, set
# ping_on_rotate to True. This should mitigate the issue where a minion does not
# appear to initially respond after a key is rotated.
#
# Note that ping_on_rotate may cause high load on the master immediately after
# the key rotation event as minions reconnect. Consider this carefully if this
# salt master is managing a large number of minions.
#
# If disabled, it is recommended to handle this event by listening for the
# 'aes_key_rotate' event with the 'key' tag and acting appropriately.
# ping_on_rotate: False

# By default, the master deletes its cache of minion data when the key for that
# minion is removed. To preserve the cache after key deletion, set
# 'preserve_minion_cache' to True.
#
# WARNING: This may have security implications if compromised minions auth with
# a previous deleted minion ID.
#preserve_minion_cache: False

# Allow or deny minions from requesting their own key revocation
#allow_minion_key_revoke: True

# If max_minions is used in large installations, the master might experience
# high-load situations because of having to check the number of connected
# minions for every authentication. This cache provides the minion-ids of
# all connected minions to all MWorker-processes and greatly improves the
# performance of max_minions.
# con_cache: False

# The master can include configuration from other files. To enable this,
# pass a list of paths to this option. The paths can be either relative or
# absolute; if relative, they are considered to be relative to the directory
# the main master configuration file lives in (this file). Paths can make use
# of shell-style globbing. If no files are matched by a path passed to this
# option, then the master will log a warning message.
#
# Include a config file from some other path:
# include: /etc/salt/extra_config
#
# Include config from several files and directories:
# include:
#   - /etc/salt/extra_config


#####  Large-scale tuning settings   #####
##########################################
# Max open files
#
# Each minion connecting to the master uses AT LEAST one file descriptor, the
# master subscription connection. If enough minions connect you might start
# seeing on the console (and then salt-master crashes):
#   Too many open files (tcp_listener.cpp:335)
#   Aborted (core dumped)
#
# By default this value will be the one of `ulimit -Hn`, ie, the hard limit for
# max open files.
#
# If you wish to set a different value than the default one, uncomment and
# configure this setting. Remember that this value CANNOT be higher than the
# hard limit. Raising the hard limit depends on your OS and/or distribution,
# a good way to find the limit is to search the internet. For example:
#   raise max open files hard limit debian
#
#max_open_files: 100000

# The number of worker threads to start. These threads are used to manage
# return calls made from minions to the master. If the master seems to be
# running slowly, increase the number of threads. This setting can not be
# set lower than 3.
#worker_threads: 5

# Set the ZeroMQ high water marks
# http://api.zeromq.org/3-2:zmq-setsockopt

# The listen queue size / backlog
#zmq_backlog: 1000

# The publisher interface ZeroMQPubServerChannel
#pub_hwm: 1000

# These two ZMQ HWM settings, salt_event_pub_hwm and event_publisher_pub_hwm
# are significant for masters with thousands of minions.  When these are
# insufficiently high it will manifest in random responses missing in the CLI
# and even missing from the job cache.  Masters that have fast CPUs and many
# cores with appropriate worker_threads will not need these set as high.

# On deployment with 8,000 minions, 2.4GHz CPUs, 24 cores, 32GiB memory has
# these settings:
#
#   salt_event_pub_hwm: 128000
#   event_publisher_pub_hwm: 64000

# ZMQ high-water-mark for SaltEvent pub socket
#salt_event_pub_hwm: 20000

# ZMQ high-water-mark for EventPublisher pub socket
#event_publisher_pub_hwm: 10000

# The master may allocate memory per-event and not
# reclaim it.
# To set a high-water mark for memory allocation, use
# ipc_write_buffer to set a high-water mark for message
# buffering.
# Value: In bytes. Set to 'dynamic' to have Salt select
# a value for you. Default is disabled.
# ipc_write_buffer: 'dynamic'


#####        Security settings       #####
##########################################
# Enable "open mode", this mode still maintains encryption, but turns off
# authentication, this is only intended for highly secure environments or for
# the situation where your keys end up in a bad state. If you run in open mode
# you do so at your own risk!
#open_mode: False

# Enable auto_accept, this setting will automatically accept all incoming
# public keys from the minions. Note that this is insecure.
#auto_accept: False

# Time in minutes that an incoming public key with a matching name found in
# pki_dir/minion_autosign/keyid is automatically accepted. Expired autosign keys
# are removed when the master checks the minion_autosign directory.
# 0 equals no timeout
# autosign_timeout: 120

# If the autosign_file is specified, incoming keys specified in the
# autosign_file will be automatically accepted. This is insecure.  Regular
# expressions as well as globing lines are supported.
#autosign_file: /etc/salt/autosign.conf

# Works like autosign_file, but instead allows you to specify minion IDs for
# which keys will automatically be rejected. Will override both membership in
# the autosign_file and the auto_accept setting.
#autoreject_file: /etc/salt/autoreject.conf

# Enable permissive access to the salt keys. This allows you to run the
# master or minion as root, but have a non-root group be given access to
# your pki_dir. To make the access explicit, root must belong to the group
# you've given access to. This is potentially quite insecure. If an autosign_file
# is specified, enabling permissive_pki_access will allow group access to that
# specific file.
#permissive_pki_access: False

# Allow users on the master access to execute specific commands on minions.
# This setting should be treated with care since it opens up execution
# capabilities to non root users. By default this capability is completely
# disabled.
#publisher_acl:
#  larry:
#    - test.ping
#    - network.*
#
# Blacklist any of the following users or modules
#
# This example would blacklist all non sudo users, including root from
# running any commands. It would also blacklist any use of the "cmd"
# module. This is completely disabled by default.
#
#
# Check the list of configured users in client ACL against users on the
# system and throw errors if they do not exist.
#client_acl_verify: True
#
#publisher_acl_blacklist:
#  users:
#    - root
#    - '^(?!sudo_).*$'   #  all non sudo users
#  modules:
#    - cmd
#
# WARNING: client_acl and client_acl_blacklist options are deprecated and will
# be removed in the future releases. Use publisher_acl and
# publisher_acl_blacklist instead.

# Enforce publisher_acl & publisher_acl_blacklist when users have sudo
# access to the salt command.
#
#sudo_acl: False

# Allow Linux users to authenticate with the API via PAM
auth.pam.service: login

# The external auth system uses the Salt auth modules to authenticate and
# validate users to access areas of the Salt system.
external_auth:
  pam:
    {{ pillar['user']['name'] }}:
      - '.*'
  {% for user in pillar['salt-api']['users'] %}
    {{ user['name'] }}:
      - '.*'
  {% endfor %}

# REST API 4 Salt
rest_cherrypy:
  port: 6969
  disable_ssl: true

# Time (in seconds) for a newly generated token to live. Default: 12 hours
#token_expire: 43200
#
# Allow eauth users to specify the expiry time of the tokens they generate.
# A boolean applies to all users or a dictionary of whitelisted eauth backends
# and usernames may be given.
# token_expire_user_override:
#   pam:
#     - fred
#     - tom
#   ldap:
#     - gary
#
#token_expire_user_override: False

# Allow minions to push files to the master. This is disabled by default, for
# security purposes.
#file_recv: False

# Set a hard-limit on the size of the files that can be pushed to the master.
# It will be interpreted as megabytes. Default: 100
#file_recv_max_size: 100

# Signature verification on messages published from the master.
# This causes the master to cryptographically sign all messages published to its event
# bus, and minions then verify that signature before acting on the message.
#
# This is False by default.
#
# Note that to facilitate interoperability with masters and minions that are different
# versions, if sign_pub_messages is True but a message is received by a minion with
# no signature, it will still be accepted, and a warning message will be logged.
# Conversely, if sign_pub_messages is False, but a minion receives a signed
# message it will be accepted, the signature will not be checked, and a warning message
# will be logged. This behavior went away in Salt 2014.1.0 and these two situations
# will cause minion to throw an exception and drop the message.
# sign_pub_messages: False

# Use TLS/SSL encrypted connection between master and minion.
# Can be set to a dictionary containing keyword arguments corresponding to Python's
# 'ssl.wrap_socket' method.
# Default is None.
#ssl:
#    keyfile: <path_to_keyfile>
#    certfile: <path_to_certfile>
#    ssl_version: PROTOCOL_TLSv1_2

#####     Salt-SSH Configuration     #####
##########################################

# Pass in an alternative location for the salt-ssh roster file
#roster_file: /etc/salt/roster

# Define locations for roster files so they can be chosen when using Salt API.
# An administrator can place roster files into these locations. Then when
# calling Salt API, parameter 'roster_file' should contain a relative path to
# these locations. That is, "roster_file=/foo/roster" will be resolved as
# "/etc/salt/roster.d/foo/roster" etc. This feature prevents passing insecure
# custom rosters through the Salt API.
#
#rosters:
# - /etc/salt/roster.d
# - /opt/salt/some/more/rosters

# The log file of the salt-ssh command:
#ssh_log_file: /var/log/salt/ssh

# Pass in minion option overrides that will be inserted into the SHIM for
# salt-ssh calls. The local minion config is not used for salt-ssh. Can be
# overridden on a per-minion basis in the roster (`minion_opts`)
#ssh_minion_opts:
#  gpg_keydir: /root/gpg

# Set this to True to default to using ~/.ssh/id_rsa for salt-ssh
# authentication with minions
#ssh_use_home_key: False

#####    Master Module Management    #####
##########################################
# Manage how master side modules are loaded.

# Add any additional locations to look for master runners:
#runner_dirs: []

# Enable Cython for master side modules:
#cython_enable: False


#####      State System settings     #####
##########################################
# The state system uses a "top" file to tell the minions what environment to
# use and what modules to use. The state_top file is defined relative to the
# root of the base environment as defined in "File Server settings" below.
#state_top: top.sls

# The master_tops option replaces the external_nodes option by creating
# a plugable system for the generation of external top data. The external_nodes
# option is deprecated by the master_tops option.
#
# To gain the capabilities of the classic external_nodes system, use the
# following configuration:
# master_tops:
#   ext_nodes: <Shell command which returns yaml>
#
#master_tops: {}

# The external_nodes option allows Salt to gather data that would normally be
# placed in a top file. The external_nodes option is the executable that will
# return the ENC data. Remember that Salt will look for external nodes AND top
# files and combine the results if both are enabled!
#external_nodes: None

# The renderer to use on the minions to render the state data
#renderer: yaml_jinja

# The Jinja renderer can strip extra carriage returns and whitespace
# See http://jinja.pocoo.org/docs/api/#high-level-api
#
# If this is set to True the first newline after a Jinja block is removed
# (block, not variable tag!). Defaults to False, corresponds to the Jinja
# environment init variable "trim_blocks".
#jinja_trim_blocks: False
#
# If this is set to True leading spaces and tabs are stripped from the start
# of a line to a block. Defaults to False, corresponds to the Jinja
# environment init variable "lstrip_blocks".
#jinja_lstrip_blocks: False

# The failhard option tells the minions to stop immediately after the first
# failure detected in the state execution, defaults to False
#failhard: False

# The state_verbose and state_output settings can be used to change the way
# state system data is printed to the display. By default all data is printed.
# The state_verbose setting can be set to True or False, when set to False
# all data that has a result of True and no changes will be suppressed.
#state_verbose: True

# The state_output setting changes if the output is the full multi line
# output for each changed state if set to 'full', but if set to 'terse'
# the output will be shortened to a single line.  If set to 'mixed', the output
# will be terse unless a state failed, in which case that output will be full.
# If set to 'changes', the output will be full unless the state didn't change.
#state_output: full

# Automatically aggregate all states that have support for mod_aggregate by
# setting to 'True'. Or pass a list of state module names to automatically
# aggregate just those types.
#
# state_aggregate:
#   - pkg
#
#state_aggregate: False

# Send progress events as each function in a state run completes execution
# by setting to 'True'. Progress events are in the format
# 'salt/job/<JID>/prog/<MID>/<RUN NUM>'.
#state_events: False

#####      File Server settings      #####
##########################################
# Salt runs a lightweight file server written in zeromq to deliver files to
# minions. This file server is built into the master daemon and does not
# require a dedicated port.

# The file server works on environments passed to the master, each environment
# can have multiple root directories, the subdirectories in the multiple file
# roots cannot match, otherwise the downloaded files will not be able to be
# reliably ensured. A base environment is required to house the top file.
# Example:
# file_roots:
#   base:
#     - /srv/salt/
#   dev:
#     - /srv/salt/dev/services
#     - /srv/salt/dev/states
#   prod:
#     - /srv/salt/prod/services
#     - /srv/salt/prod/states

file_roots:
  base:
    - /srv/salt
    - /srv/formulas


# When using multiple environments, each with their own top file, the
# default behaviour is an unordered merge. To prevent top files from
# being merged together and instead to only use the top file from the
# requested environment, set this value to 'same'.
top_file_merging_strategy: same

# To specify the order in which environments are merged, set the ordering
# in the env_order option. Given a conflict, the last matching value will
# win.
#env_order: ['base', 'dev', 'prod']

# If top_file_merging_strategy is set to 'same' and an environment does not
# contain a top file, the top file in the environment specified by default_top
# will be used instead.
#default_top: base

# The hash_type is the hash to use when discovering the hash of a file on
# the master server. The default is md5 but sha1, sha224, sha256, sha384
# and sha512 are also supported.
#
# WARNING: While md5 is also supported, do not use it due to the high chance
# of possible collisions and thus security breach.
#
# Prior to changing this value, the master should be stopped and all Salt
# caches should be cleared.
#hash_type: sha256

# The buffer size in the file server can be adjusted here:
#file_buffer_size: 1048576

# A regular expression (or a list of expressions) that will be matched
# against the file path before syncing the modules and states to the minions.
# This includes files affected by the file.recurse state.
# For example, if you manage your custom modules and states in subversion
# and don't want all the '.svn' folders and content synced to your minions,
# you could set this to '/\.svn($|/)'. By default nothing is ignored.
#file_ignore_regex:
#  - '/\.svn($|/)'
#  - '/\.git($|/)'

# A file glob (or list of file globs) that will be matched against the file
# path before syncing the modules and states to the minions. This is similar
# to file_ignore_regex above, but works on globs instead of regex. By default
# nothing is ignored.
# file_ignore_glob:
#  - '*.pyc'
#  - '*/somefolder/*.bak'
#  - '*.swp'

# File Server Backend
#
# Salt supports a modular fileserver backend system, this system allows
# the salt master to link directly to third party systems to gather and
# manage the files available to minions. Multiple backends can be
# configured and will be searched for the requested file in the order in which
# they are defined here. The default setting only enables the standard backend
# "roots" which uses the "file_roots" option.
#fileserver_backend:
#  - roots
#
# To use multiple backends list them in the order they are searched:
fileserver_backend:
  - git
  - roots

# Uncomment the line below if you do not want the file_server to follow
# symlinks when walking the filesystem tree. This is set to True
# by default. Currently this only applies to the default roots
# fileserver_backend.
#fileserver_followsymlinks: False
#
# Uncomment the line below if you do not want symlinks to be
# treated as the files they are pointing to. By default this is set to
# False. By uncommenting the line below, any detected symlink while listing
# files on the Master will not be returned to the Minion.
#fileserver_ignoresymlinks: True
#
# By default, the Salt fileserver recurses fully into all defined environments
# to attempt to find files. To limit this behavior so that the fileserver only
# traverses directories with SLS files and special Salt directories like _modules,
# enable the option below. This might be useful for installations where a file root
# has a very large number of files and performance is impacted. Default is False.
# fileserver_limit_traversal: False
#
# The fileserver can fire events off every time the fileserver is updated,
# these are disabled by default, but can be easily turned on by setting this
# flag to True
#fileserver_events: False

# Git File Server Backend Configuration
#
# Optional parameter used to specify the provider to be used for gitfs. Must
# be one of the following: pygit2, gitpython, or dulwich. If unset, then each
# will be tried in that same order, and the first one with a compatible
# version installed will be the provider that is used.
gitfs_provider: pygit2

# Along with gitfs_password, is used to authenticate to HTTPS remotes.
# gitfs_user: ''

# Along with gitfs_user, is used to authenticate to HTTPS remotes.
# This parameter is not required if the repository does not use authentication.
#gitfs_password: ''

# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.
# This parameter enables authentication over HTTP. Enable this at your own risk.
#gitfs_insecure_auth: False

# Along with gitfs_privkey (and optionally gitfs_passphrase), is used to
# authenticate to SSH remotes. This parameter (or its per-remote counterpart)
# is required for SSH remotes.
#gitfs_pubkey: ''

# Along with gitfs_pubkey (and optionally gitfs_passphrase), is used to
# authenticate to SSH remotes. This parameter (or its per-remote counterpart)
# is required for SSH remotes.
#gitfs_privkey: ''

# This parameter is optional, required only when the SSH key being used to
# authenticate is protected by a passphrase.
#gitfs_passphrase: ''

# When using the git fileserver backend at least one git remote needs to be
# defined. The user running the salt master will need read access to the repo.
#
# The repos will be searched in order to find the file requested by a client
# and the first repo to have the file will return it.
# When using the git backend branches and tags are translated into salt
# environments.
# Note: file:// repos will be treated as a remote, so refs you want used must
# exist in that repo as *local* refs.
gitfs_remotes:
  - git://github.com/saltstack-formulas/apt-formula.git
  - git://github.com/saltstack-formulas/nfs-formula.git
  - git://github.com/saltstack-formulas/openssh-formula.git
  - git://github.com/saltstack-formulas/samba-formula.git
  - git://github.com/saltstack-formulas/sudoers-formula.git
  - git://github.com/saltstack-formulas/users-formula.git
  - git://github.com/eligundry/salt.eligundry.com.git:
    - root: salt
    - name: eligundry
    - saltenv:
      - base:
        - ref: {{ eligundry_branch }}

# The gitfs_ssl_verify option specifies whether to ignore ssl certificate
# errors when contacting the gitfs backend. You might want to set this to
# false if you're using a git backend that uses a self-signed certificate but
# keep in mind that setting this flag to anything other than the default of True
# is a security concern, you may want to try using the ssh transport.
#gitfs_ssl_verify: True
#
# The gitfs_root option gives the ability to serve files from a subdirectory
# within the repository. The path is defined relative to the root of the
# repository and defaults to the repository root.
#gitfs_root: somefolder/otherfolder
#
#
#####         Pillar settings        #####
##########################################
# Salt Pillars allow for the building of global data that can be made selectively
# available to different minions based on minion grain filtering. The Salt
# Pillar is laid out in the same fashion as the file server, with environments,
# a top file and sls files. However, pillar data does not need to be in the
# highstate format, and is generally just key/value pairs.

pillar_roots:
  base:
    - /srv/pillar

ext_pillar:
  - git:
    - {{ eligundry_branch }} https://github.com/eligundry/salt.eligundry.com.git:
      - env: base
      - root: pillar

# The ext_pillar_first option allows for external pillar sources to populate
# before file system pillar. This allows for targeting file system pillar from
# ext_pillar.
ext_pillar_first: True

# The external pillars permitted to be used on-demand using pillar.ext
#on_demand_ext_pillar:
#  - libvirt
#  - virtkey

# The pillar_gitfs_ssl_verify option specifies whether to ignore ssl certificate
# errors when contacting the pillar gitfs backend. You might want to set this to
# false if you're using a git backend that uses a self-signed certificate but
# keep in mind that setting this flag to anything other than the default of True
# is a security concern, you may want to try using the ssh transport.
#pillar_gitfs_ssl_verify: True

# The pillar_opts option adds the master configuration file data to a dict in
# the pillar called "master". This is used to set simple configurations in the
# master config file that can then be used on minions.
#pillar_opts: False

# The pillar_safe_render_error option prevents the master from passing pillar
# render errors to the minion. This is set on by default because the error could
# contain templating data which would give that minion information it shouldn't
# have, like a password! When set true the error message will only show:
#   Rendering SLS 'my.sls' failed. Please see master log for details.
#pillar_safe_render_error: True

# The pillar_source_merging_strategy option allows you to configure merging strategy
# between different sources. It accepts five values: none, recurse, aggregate, overwrite,
# or smart. None will not do any merging at all. Recurse will merge recursively mapping of data.
# Aggregate instructs aggregation of elements between sources that use the #!yamlex renderer. Overwrite
# will overwrite elements according the order in which they are processed. This is
# behavior of the 2014.1 branch and earlier. Smart guesses the best strategy based
# on the "renderer" setting and is the default value.
#pillar_source_merging_strategy: smart

# Recursively merge lists by aggregating them instead of replacing them.
#pillar_merge_lists: False

# Set this option to 'True' to force a 'KeyError' to be raised whenever an
# attempt to retrieve a named value from pillar fails. When this option is set
# to 'False', the failed attempt returns an empty string. Default is 'False'.
#pillar_raise_on_missing: False

# Git External Pillar (git_pillar) Configuration Options
#
# Specify the provider to be used for git_pillar. Must be either pygit2 or
# gitpython. If unset, then both will be tried in that same order, and the
# first one with a compatible version installed will be the provider that
# is used.
#git_pillar_provider: pygit2

# If the desired branch matches this value, and the environment is omitted
# from the git_pillar configuration, then the environment for that git_pillar
# remote will be base.
#git_pillar_base: master

# If the branch is omitted from a git_pillar remote, then this branch will
# be used instead
#git_pillar_branch: master

# Environment to use for git_pillar remotes. This is normally derived from
# the branch/tag (or from a per-remote env parameter), but if set this will
# override the process of deriving the env from the branch/tag name.
git_pillar_env: base

# Path relative to the root of the repository where the git_pillar top file
# and SLS files are located.
#git_pillar_root: ''

# Specifies whether or not to ignore SSL certificate errors when contacting
# the remote repository.
#git_pillar_ssl_verify: False

# When set to False, if there is an update/checkout lock for a git_pillar
# remote and the pid written to it is not running on the master, the lock
# file will be automatically cleared and a new lock will be obtained.
#git_pillar_global_lock: True

# Git External Pillar Authentication Options
#
# Along with git_pillar_password, is used to authenticate to HTTPS remotes.
#git_pillar_user: ''

# Along with git_pillar_user, is used to authenticate to HTTPS remotes.
# This parameter is not required if the repository does not use authentication.
#git_pillar_password: ''

# By default, Salt will not authenticate to an HTTP (non-HTTPS) remote.
# This parameter enables authentication over HTTP.
#git_pillar_insecure_auth: False

# Along with git_pillar_privkey (and optionally git_pillar_passphrase),
# is used to authenticate to SSH remotes.
#git_pillar_pubkey: ''

# Along with git_pillar_pubkey (and optionally git_pillar_passphrase),
# is used to authenticate to SSH remotes.
#git_pillar_privkey: ''

# This parameter is optional, required only when the SSH key being used
# to authenticate is protected by a passphrase.
#git_pillar_passphrase: ''

# A master can cache pillars locally to bypass the expense of having to render them
# for each minion on every request. This feature should only be enabled in cases
# where pillar rendering time is known to be unsatisfactory and any attendant security
# concerns about storing pillars in a master cache have been addressed.
#
# When enabling this feature, be certain to read through the additional ``pillar_cache_*``
# configuration options to fully understand the tunable parameters and their implications.
#
# Note: setting ``pillar_cache: True`` has no effect on targeting Minions with Pillars.
# See https://docs.saltstack.com/en/latest/topics/targeting/pillar.html
#pillar_cache: False

# If and only if a master has set ``pillar_cache: True``, the cache TTL controls the amount
# of time, in seconds, before the cache is considered invalid by a master and a fresh
# pillar is recompiled and stored.
#pillar_cache_ttl: 3600

# If and only if a master has set `pillar_cache: True`, one of several storage providers
# can be utililzed.
#
# `disk`: The default storage backend. This caches rendered pillars to the master cache.
#         Rendered pillars are serialized and deserialized as msgpack structures for speed.
#         Note that pillars are stored UNENCRYPTED. Ensure that the master cache
#         has permissions set appropriately. (Same defaults are provided.)
#
# memory: [EXPERIMENTAL] An optional backend for pillar caches which uses a pure-Python
#         in-memory data structure for maximal performance. There are several caveats,
#         however. First, because each master worker contains its own in-memory cache,
#         there is no guarantee of cache consistency between minion requests. This
#         works best in situations where the pillar rarely if ever changes. Secondly,
#         and perhaps more importantly, this means that unencrypted pillars will
#         be accessible to any process which can examine the memory of the ``salt-master``!
#         This may represent a substantial security risk.
#
#pillar_cache_backend: disk


#####          Syndic settings       #####
##########################################
# The Salt syndic is used to pass commands through a master from a higher
# master. Using the syndic is simple. If this is a master that will have
# syndic servers(s) below it, then set the "order_masters" setting to True.
#
# If this is a master that will be running a syndic daemon for passthrough, then
# the "syndic_master" setting needs to be set to the location of the master server
# to receive commands from.

# Set the order_masters setting to True if this master will command lower
# masters' syndic interfaces.
#order_masters: False

# If this master will be running a salt syndic daemon, syndic_master tells
# this master where to receive commands from.
#syndic_master: masterofmasters

# This is the 'ret_port' of the MasterOfMaster:
#syndic_master_port: 4506

# PID file of the syndic daemon:
#syndic_pidfile: /var/run/salt-syndic.pid

# The log file of the salt-syndic daemon:
#syndic_log_file: /var/log/salt/syndic

# The behaviour of the multi-syndic when connection to a master of masters failed.
# Can specify ``random`` (default) or ``ordered``. If set to ``random``, masters
# will be iterated in random order. If ``ordered`` is specified, the configured
# order will be used.
#syndic_failover: random

# The number of seconds for the salt client to wait for additional syndics to
# check in with their lists of expected minions before giving up.
#syndic_wait: 5


#####      Peer Publish settings     #####
##########################################
# Salt minions can send commands to other minions, but only if the minion is
# allowed to. By default "Peer Publication" is disabled, and when enabled it
# is enabled for specific minions and specific commands. This allows secure
# compartmentalization of commands based on individual minions.

# The configuration uses regular expressions to match minions and then a list
# of regular expressions to match functions. The following will allow the
# minion authenticated as foo.example.com to execute functions from the test
# and pkg modules.
#peer:
#  foo.example.com:
#    - test.*
#    - pkg.*
#
# This will allow all minions to execute all commands:
#peer:
#  .*:
#    - .*
#
# This is not recommended, since it would allow anyone who gets root on any
# single minion to instantly have root on all of the minions!

# Minions can also be allowed to execute runners from the salt master.
# Since executing a runner from the minion could be considered a security risk,
# it needs to be enabled. This setting functions just like the peer setting
# except that it opens up runners instead of module functions.
#
# All peer runner support is turned off by default and must be enabled before
# using. This will enable all peer runners for all minions:
#peer_run:
#  .*:
#    - .*
#
# To enable just the manage.up runner for the minion foo.example.com:
#peer_run:
#  foo.example.com:
#    - manage.up
#
#
#####         Mine settings     #####
#####################################
# Restrict mine.get access from minions. By default any minion has a full access
# to get all mine data from master cache. In acl definion below, only pcre matches
# are allowed.
# mine_get:
#   .*:
#     - .*
#
# The example below enables minion foo.example.com to get 'network.interfaces' mine
# data only, minions web* to get all network.* and disk.* mine data and all other
# minions won't get any mine data.
# mine_get:
#   foo.example.com:
#     - network.interfaces
#   web.*:
#     - network.*
#     - disk.*


#####         Logging settings       #####
##########################################
# The location of the master log file
# The master log can be sent to a regular file, local path name, or network
# location. Remote logging works best when configured to use rsyslogd(8) (e.g.:
# ``file:///dev/log``), with rsyslogd(8) configured for network logging. The URI
# format is: <file|udp|tcp>://<host|socketpath>:<port-if-required>/<log-facility>
#log_file: /var/log/salt/master
#log_file: file:///dev/log
#log_file: udp://loghost:10514

#log_file: /var/log/salt/master
#key_logfile: /var/log/salt/key

# The level of messages to send to the console.
# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
#
# The following log levels are considered INSECURE and may log sensitive data:
# ['garbage', 'trace', 'debug']
#
#log_level: warning

# The level of messages to send to the log file.
# One of 'garbage', 'trace', 'debug', info', 'warning', 'error', 'critical'.
# If using 'log_granular_levels' this must be set to the highest desired level.
#log_level_logfile: warning

# The date and time format used in log messages. Allowed date/time formatting
# can be seen here: http://docs.python.org/library/time.html#time.strftime
#log_datefmt: '%H:%M:%S'
#log_datefmt_logfile: '%Y-%m-%d %H:%M:%S'

# The format of the console logging messages. Allowed formatting options can
# be seen here: http://docs.python.org/library/logging.html#logrecord-attributes
#
# Console log colors are specified by these additional formatters:
#
# %(colorlevel)s
# %(colorname)s
# %(colorprocess)s
# %(colormsg)s
#
# Since it is desirable to include the surrounding brackets, '[' and ']', in
# the coloring of the messages, these color formatters also include padding as
# well.  Color LogRecord attributes are only available for console logging.
#
#log_fmt_console: '%(colorlevel)s %(colormsg)s'
#log_fmt_console: '[%(levelname)-8s] %(message)s'
#
#log_fmt_logfile: '%(asctime)s,%(msecs)03d [%(name)-17s][%(levelname)-8s] %(message)s'

# This can be used to control logging levels more specificically.  This
# example sets the main salt library at the 'warning' level, but sets
# 'salt.modules' to log at the 'debug' level:
#   log_granular_levels:
#     'salt': 'warning'
#     'salt.modules': 'debug'
#
#log_granular_levels: {}


#####         Node Groups           ######
##########################################
# Node groups allow for logical groupings of minion nodes. A group consists of
# a group name and a compound target. Nodgroups can reference other nodegroups
# with 'N@' classifier. Ensure that you do not have circular references.
#
#nodegroups:
#  group1: 'L@foo.domain.com,bar.domain.com,baz.domain.com or bl*.domain.com'
#  group2: 'G@os:Debian and foo.domain.com'
#  group3: 'G@os:Debian and N@group1'
#  group4:
#    - 'G@foo:bar'
#    - 'or'
#    - 'G@foo:baz'


#####     Range Cluster settings     #####
##########################################
# The range server (and optional port) that serves your cluster information
# https://github.com/ytoolshed/range/wiki/%22yamlfile%22-module-file-spec
#
#range_server: range:80


#####  Windows Software Repo settings #####
###########################################
# Location of the repo on the master:
#winrepo_dir_ng: '/srv/salt/win/repo-ng'
#
# List of git repositories to include with the local repo:
#winrepo_remotes_ng:
#  - 'https://github.com/saltstack/salt-winrepo-ng.git'


#####  Windows Software Repo settings - Pre 2015.8 #####
########################################################
# Legacy repo settings for pre-2015.8 Windows minions.
#
# Location of the repo on the master:
#winrepo_dir: '/srv/salt/win/repo'
#
# Location of the master's repo cache file:
#winrepo_mastercachefile: '/srv/salt/win/repo/winrepo.p'
#
# List of git repositories to include with the local repo:
#winrepo_remotes:
#  - 'https://github.com/saltstack/salt-winrepo.git'


#####      Returner settings          ######
############################################
# Which returner(s) will be used for minion's result:
#return: mysql


######    Miscellaneous  settings     ######
############################################
# Default match type for filtering events tags: startswith, endswith, find, regex, fnmatch
#event_match_type: startswith

# Save runner returns to the job cache
#runner_returns: True

# Permanently include any available Python 3rd party modules into Salt Thin
# when they are generated for Salt-SSH or other purposes.
# The modules should be named by the names they are actually imported inside the Python.
# The value of the parameters can be either one module or a comma separated list of them.
#thin_extra_mods: foo,bar
