# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org).

## [Unreleased]

### Changed
- **BREAKING**: Minimum Puppet version raised to 7.0 (dropped Puppet 6 support)
- Migrated from Travis CI to GitHub Actions
- Updated to voxpupuli coding standards
- Updated Gemfile to use voxpupuli-test and voxpupuli-acceptance gems
- Updated metadata.json to support Puppet 7 and 8
- Modernized documentation format in manifests (Puppet Strings format)
- Improved README.md with comprehensive documentation

### Fixed
- Fixed default country code from 'UK' to 'GB' (correct ISO 3166-1 alpha-2 code)

### Removed
- Removed .travis.yml (replaced with GitHub Actions)
- Removed .gitlab-ci.yml (not needed)
- Removed appveyor.yml (replaced with GitHub Actions)
- Dropped support for Puppet 6.x

### Added
- GitHub Actions CI workflow
- GitHub Actions release workflow
- .github/CONTRIBUTING.md
- .github/PULL_REQUEST_TEMPLATE.md
- Updated .sync.yml with voxpupuli modulesync configuration

## Release 0.1.2

**Features**

**Bugfixes**

**Known Issues**
