# == Class: geoipcheck
#
# Full description of class geoipcheck here.
#
# === Parameters
#
# Document parameters here.
#
# [*countries*]
#   Array of countries that should be accepted to login
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
# Copyright 2015 Hannes Schaller
#
class geoipcheck (
  Array $countries = [ 'AT', 'UK' ],
){

  package {['geoip-bin', 'geoip-database']:
    ensure => present
  }

  ensure_packages( 'wget' )

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
