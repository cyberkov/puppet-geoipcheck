# Contributing to this module

Thank you for contributing to this module! This module follows the [Voxpupuli](https://voxpupuli.org) coding standards.

## Getting Started

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests locally
5. Submit a pull request

## Testing

Before submitting a pull request, please ensure that:

1. All existing tests pass
2. Any new functionality includes appropriate tests
3. Code follows the style guidelines (run `bundle exec rake rubocop`)
4. Puppet manifests are validated (run `bundle exec rake syntax`)

To run all tests:

```bash
bundle install
bundle exec rake test
```

## Code Style

This module follows the [Puppet Language Style Guide](https://puppet.com/docs/puppet/latest/style_guide.html) and uses RuboCop for Ruby code style enforcement.

Run style checks:

```bash
bundle exec rake rubocop
bundle exec rake lint
```

## Commit Messages

Please write clear, concise commit messages that explain what your changes do and why.

## Pull Requests

- Keep pull requests focused on a single feature or fix
- Include tests for new functionality
- Update documentation as needed
- Reference any related issues in the PR description

## Questions?

If you have questions about contributing, please open an issue or reach out to the maintainers.

Thank you for contributing!
