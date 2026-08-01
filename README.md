# Hanzo Homebrew Tap

Homebrew formulae for [Hanzo AI](https://hanzo.ai) command-line tools.

## Install

```bash
brew tap hanzoai/tap
brew install hanzo
```

## Formulae

| Formula | Installs | What it is |
|---------|----------|------------|
| `hanzo` | `hanzo`, `hanzo-node` | The Hanzo CLI — sign in, run AI coding sessions, drive every Hanzo Cloud product |
| `hanzo-dev` | `dev` | Hanzo Dev — the local AI coding agent for your terminal |

`hanzo` installs a second name, `hanzo-node`, as a symlink to the same binary.
That name is what the Hanzo Cloud control binary resolves first when it delegates
a verb it does not serve itself, so the two must never be separate builds — a
`hanzo-node` left behind at an older version is an invisible stale install.

The tap is not the only way in. `curl -fsSL https://hanzo.sh | sh` installs the
same CLI build on macOS, Linux and Windows, and is what the docs lead with.

## Usage

```bash
hanzo auth login                  # sign in through Hanzo IAM
hanzo --help                      # every product group, one per Hanzo Cloud product
hanzo "fix the failing test"      # start an AI coding session on the task

dev                               # Hanzo Dev, interactive
dev exec -m zen5-coder "explain this code"
```

Model ids come from the cloud catalog (`hanzo models list`), not from this
README. The Zen family is `zen5`, `zen5-coder`, `zen5-flash`, `zen5-mini` and
`zen5-pro`, plus `enso`, `enso-flash` and `enso-ultra`.

## Hanzo Desktop

Not distributed through this tap. `hanzoai/desktop` is a private repository, so
its release assets return 404 to an unauthenticated `brew` download and a cask
here could never install for anyone. Get the desktop app from
[hanzo.ai/download](https://hanzo.ai/download).
