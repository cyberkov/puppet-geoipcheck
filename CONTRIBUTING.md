# Contributing to puppet-geoipcheck

Thank you for contributing to this Puppet module! This module follows the [Voxpupuli](https://voxpupuli.org) coding standards.

## Getting Started

1. Fork the repository
2. Create a feature branch from `main`
3. Run the tests to ensure you have a clean baseline
4. Make your changes
5. Add tests for your changes
6. Ensure all tests pass
7. Submit a pull request

## Dependencies

All testing and development dependencies are managed by [Bundler](http://bundler.io/).

Install dependencies:

```bash
bundle install
```

## Testing

### Running All Tests

To run all static validations and unit tests:

```bash
bundle exec rake test
```

### Syntax and Style Checks

The test suite runs several linters and validators:

- Puppet Lint
- Puppet Syntax
- RuboCop
- Metadata linter

Run them individually or all together:

```bash
bundle exec rake syntax        # Check Puppet syntax
bundle exec rake lint          # Run puppet-lint
bundle exec rake rubocop       # Check Ruby style
bundle exec rake metadata_lint # Validate metadata.json
```

### Unit Tests

Unit tests use [rspec-puppet](http://rspec-puppet.com/):

```bash
bundle exec rake spec
```

To run tests in parallel:

```bash
bundle exec rake parallel_spec
```

### Acceptance Tests

Acceptance tests use [Beaker](https://github.com/voxpupuli/beaker):

```bash
bundle exec rake beaker
```

## Code Style

This module follows:
- [Puppet Language Style Guide](https://puppet.com/docs/puppet/latest/style_guide.html)
- [Voxpupuli coding guidelines](https://voxpupuli.org/docs/reviewing_pr/)
- RuboCop rules for Ruby code

## Documentation

- Use [Puppet Strings](https://puppet.com/docs/puppet/latest/puppet_strings.html) format for documenting classes and defined types
- Update README.md for any user-facing changes
- Update CHANGELOG.md following [Keep a Changelog](https://keepachangelog.com/) format

## Pull Requests

- Keep pull requests focused on a single feature or fix
- Include tests for new functionality
- Ensure CI checks pass
- Update documentation as needed
- Reference related issues in the PR description

## Commit Messages

Write clear, descriptive commit messages that explain what and why, not just what.

## Need Help?

If you have questions or need guidance:
- Open an issue for discussion
- Check [Voxpupuli documentation](https://voxpupuli.org/docs/)
- Reach out to maintainers

Thank you for your contributions!
