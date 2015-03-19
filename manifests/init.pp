# == Class: geoipcheck
#
# Full description of class geoipcheck here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'geoipcheck': }
#
# === Authors
#
# Hannes Schaller <admin@cyberkov.at>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class geoipcheck {

  package {['geoip-bin', 'geoip-database']:
    ensure => present
  }

  singleton_packages( 'wget' )

  file { 'geoip_dir':
    ensure => directory,
    path   => '/usr/local/geoip',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/usr/local/geoip/check':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('geoipcheck/check.sh.erb'),
    require => File['geoip_dir'],
  }

  file { '/usr/local/geoip/update':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('geoipcheck/update.sh.erb'),
    require => File['geoip_dir'],
  }

  file { '/etc/cron.monthly/geoip-update':
    ensure => link,
    target => '/usr/local/geoip/update',
  }

  file_line { 'hosts.allow':
    path    => '/etc/hosts.allow',
    line    => 'sshd: ALL: aclexec /usr/local/geoip/check %a',
    require => File['/usr/local/geoip/check'],
  }

  file_line { 'hosts.deny':
    path    => '/etc/hosts.deny',
    line    => 'sshd: ALL',
    require => File_line['hosts.allow'],
  }


}
