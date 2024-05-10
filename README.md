# GitHub Copilot CLI Aliases

In this repository, you will find a collection of aliases for the GitHub Copilot CLI. These aliases are designed to make it easier to use the GitHub Copilot CLI by providing shortcuts for common commands.

## Installation

### Prerequisites

- [GitHub CLI](https://cli.github.com/)
- [GitHub Copilot CLI](https://docs.github.com/en/copilot/github-copilot-in-the-cli/using-github-copilot-in-the-cli#setting-up-aliases-for-copilot-in-the-cli)
- [fisher](https://github.com/jorgebucaran/fisher)

### Install

```bash
fisher install PunGrumpy/github-copilot-cli-aliases.fish
```

## Usage

The following aliases are available:

- `ghcs` - Alias for `gh copilot suggest`
- `ghce` - Alias for `gh copilot explain`

```bash
# Suggest code
ghcs "How to read a file in Python"

# Explain code
ghce "How to read a file in Python"
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
