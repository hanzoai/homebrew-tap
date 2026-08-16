# Hanzo Homebrew Tap

Homebrew formulae and casks for [Hanzo AI](https://hanzo.ai) tools.

## Install

```bash
brew tap hanzoai/tap
brew install hanzo
```

## What is in the tap

| Formula | Installs | What it is |
|---------|----------|------------|
| `hanzo` | `hanzo`, `hanzo-node` | The Hanzo CLI — [hanzoai/cli](https://github.com/hanzoai/cli) |
| `hanzo-dev` | `dev` | Hanzo Dev, the terminal coding agent — [hanzoai/dev](https://github.com/hanzoai/dev) |

There are no casks. `hanzo-desktop` was removed because `hanzoai/desktop` is private, so
its release assets 404 to `brew` — the cask had never installed for anyone.

`hanzo` installs a second name, `hanzo-node`, as a symlink to the same binary. That name
is what the Hanzo Cloud control binary resolves first when it delegates a verb it does not
serve itself, so the two must never be separate builds — a `hanzo-node` left behind at an
older version is an invisible stale install.

`hanzo-dev` installs `dev` and nothing else. It deliberately does not write a `hanzo`
shim: `hanzo` is the CLI, a different program, and a shim here would shadow it for anyone
who installed this formula first.

## First run

```bash
hanzo auth login     # sign in through Hanzo IAM
hanzo --help         # every command
```

Hanzo Dev is in the CLI as `hanzo dev`, and the `hanzo-dev` formula also puts it on your
path on its own:

```bash
dev --help
```

## Curl instead

If you would rather not use Homebrew, the installer does the same job on macOS and Linux
and keeps itself up to date:

```bash
curl -fsSL https://hanzo.sh | sh
```

## Updating the formulae

`hanzo` is written by hanzoai/cli's release matrix — its `tap` job, on every tag. Do not
hand-edit it: a version behind the release is a bug in that lane.

`hanzo-dev` has no lane. The step that bumped it lived in hanzoai/dev's GitHub Actions and
went with them, so it is hand-bumped until hanzoai/dev carries the step on the forge the
way hanzoai/cli does. It was the only formula ever bumped by a robot here, which is how
`hanzo` came to sit 35 releases behind while this file said otherwise.

MIT OR Apache-2.0, at your option — see [HIP-0137](https://github.com/hanzoai/hips/blob/main/HIPs/hip-0137-one-license.md).
