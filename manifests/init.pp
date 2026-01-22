# @summary Restricts SSH logins via GeoIP location checking
#
# This class configures GeoIP-based access control for SSH connections,
# allowing access only from specified countries using TCP wrappers.
#
# @param countries
#   Array of ISO 3166-1 alpha-2 country codes that should be allowed SSH access
#
# @param manage_dependencies
#   Whether to manage the wget package dependency
#
# @example Basic usage with default countries (Austria and UK)
#   include geoipcheck
#
# @example Allow access from specific countries
#   class { 'geoipcheck':
#     countries => ['US', 'CA', 'GB'],
#   }
#
# @example Disable wget package management
#   class { 'geoipcheck':
#     countries           => ['DE', 'FR'],
#     manage_dependencies => false,
#   }
#
class geoipcheck (
  Array[String[2,2]] $countries = ['AT', 'UK'],
  Boolean $manage_dependencies = true,
) {
  package { ['geoip-bin', 'geoip-database']:
    ensure => present,
  }

  if $manage_dependencies {
    ensure_packages(['wget'])
  }

  file { 'geoip_dir':
    ensure => directory,
    path   => '/usr/local/geoip',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/usr/local/geoip/check':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => template('geoipcheck/check.sh.erb'),
    require => File['geoip_dir'],
  }

  file { '/usr/local/geoip/update':
    ensure  => file,
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
