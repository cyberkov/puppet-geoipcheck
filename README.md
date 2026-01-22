# geoipcheck

[![CI](https://github.com/cyberkov/puppet-geoipcheck/actions/workflows/ci.yml/badge.svg)](https://github.com/cyberkov/puppet-geoipcheck/actions/workflows/ci.yml)
[![Puppet Forge](https://img.shields.io/puppetforge/v/cyberkov/geoipcheck.svg)](https://forge.puppetlabs.com/cyberkov/geoipcheck)
[![Puppet Forge - downloads](https://img.shields.io/puppetforge/dt/cyberkov/geoipcheck.svg)](https://forge.puppetlabs.com/cyberkov/geoipcheck)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What geoipcheck affects](#what-geoipcheck-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with geoipcheck](#beginning-with-geoipcheck)
4. [Usage](#usage)
5. [Reference](#reference)
6. [Limitations](#limitations)
7. [Development](#development)

## Overview

This module restricts SSH logins via GeoIP location checking, allowing access only from specified countries.

## Module Description

The geoipcheck module uses GeoIP databases to determine the geographic location of incoming SSH connections and restricts access based on country codes. It integrates with TCP wrappers (hosts.allow/hosts.deny) to enforce geographic-based access control for SSH services.

This module:
* Installs required GeoIP packages and databases
* Configures scripts to check IP addresses against allowed countries
* Sets up automatic GeoIP database updates via cron
* Configures hosts.allow and hosts.deny for SSH access control

## Setup

### What geoipcheck affects

* Installs packages: `geoip-bin`, `geoip-database`, and optionally `wget`
* Creates directory: `/usr/local/geoip`
* Creates scripts: `/usr/local/geoip/check` and `/usr/local/geoip/update`
* Modifies `/etc/hosts.allow` to add GeoIP check for SSH
* Modifies `/etc/hosts.deny` to deny all SSH by default
* Adds monthly cron job for GeoIP database updates

### Setup Requirements

This module requires:
* TCP wrappers support (hosts.allow/hosts.deny)
* puppetlabs-stdlib module
* Internet access for GeoIP database updates (unless using local mirrors)

### Beginning with geoipcheck

To get started with default settings (allowing Austria and UK):

```puppet
include geoipcheck
```

## Usage

Allow SSH access only from specific countries:

```puppet
class { 'geoipcheck':
  countries => ['US', 'CA', 'GB'],
}
```

Disable automatic management of wget package (if you manage it elsewhere):

```puppet
class { 'geoipcheck':
  countries           => ['DE', 'FR'],
  manage_dependencies => false,
}
```

## Reference

### Class: geoipcheck

#### Parameters

* `countries`: Array of ISO 3166-1 alpha-2 country codes that should be allowed SSH access. Default: `['AT', 'UK']`
* `manage_dependencies`: Boolean to control whether to manage the wget package. Default: `true`

## Limitations

This module is compatible with:
* RedHat-based systems (CentOS, RHEL, Oracle Linux, Scientific Linux)
* Debian-based systems (Debian, Ubuntu)
* Windows (limited support)

The module requires:
* Puppet >= 7.0.0
* TCP wrappers support
* GeoIP packages available in repositories

**Note**: This module modifies critical security files (hosts.allow, hosts.deny). Ensure you test thoroughly in a non-production environment first to avoid locking yourself out of systems.

## Development

This module follows the [Voxpupuli](https://voxpupuli.org) coding standards.
