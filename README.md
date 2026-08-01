# Hanzo Homebrew Tap

Homebrew formulae and casks for [Hanzo AI](https://hanzo.ai) tools.

## Install

```bash
brew tap hanzoai/tap
brew install hanzo
```

## Available Formulae

| Formula | Installs | Description |
|---------|----------|-------------|
| `hanzo` | `hanzo`, `hanzo-node` | The Hanzo CLI — deploy and manage Hanzo Cloud |
| `hanzo-dev` | `dev` | AI-powered development assistant |

| Cask | Description |
|------|-------------|
| `hanzo-desktop` | Hanzo AI desktop app — local agents, workflows, model orchestration |

`hanzo` installs a second name, `hanzo-node`, as a symlink to the same binary.
That name is what the Hanzo Cloud control binary resolves first when it delegates
a verb it does not serve itself, so the two must never be separate builds — a
`hanzo-node` left behind at an older version is an invisible stale install.

## Usage

```bash
# Hanzo CLI
hanzo login
hanzo --help

# Development assistant
dev
dev exec -m zen4-mini "explain this code"
```
