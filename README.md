# Hanzo Homebrew Tap

[![Open in Hanzo](https://hanzo.app/badges/open-in-hanzo.svg)](https://hanzo.app/dev/open?repo=github.com/hanzoai/homebrew-tap&ref=main&action=open) [![Edit with Hanzo](https://hanzo.app/badges/edit-with-hanzo.svg)](https://hanzo.app/dev/open?repo=github.com/hanzoai/homebrew-tap&ref=main&action=edit) [![Deploy with Hanzo](https://hanzo.app/badges/deploy-with-hanzo.svg)](https://hanzo.app/dev/open?repo=github.com/hanzoai/homebrew-tap&ref=main&action=deploy)

Homebrew formulae and casks for [Hanzo AI](https://hanzo.ai) tools.

## Install

```bash
brew tap hanzoai/tap
brew install hanzo
```

## What is in the tap

| Formula | Installs | What it is |
|---------|----------|------------|
| `hanzo` | `hanzo`, `hanzo-cli` | Hanzo, the one command: the terminal coding agent and every Hanzo product — [hanzoai/cli](https://github.com/hanzoai/cli) |

There are no casks. `hanzo-desktop` was removed because `hanzoai/desktop` is private, so
its release assets 404 to `brew` — the cask had never installed for anyone.

`hanzo` installs a second name, `hanzo-cli`, as a symlink to the same binary. That name
is what the Hanzo Cloud control binary resolves first when it delegates a verb it does not
serve itself, so the two must never be separate builds — a `hanzo-cli` left behind at an
older version is an invisible stale install.

There is no `hanzo-dev` formula: Hanzo is one product and one command. The coding agent is
`hanzo` itself (`hanzo dev` is the same session), and the `dev` engine it runs comes from
the installer below.

## First run

```bash
hanzo auth login     # sign in through Hanzo IAM
hanzo --help         # every command
```

The coding agent is the CLI: bare `hanzo` starts a session, and `hanzo dev` is the same one
with its tool named by a flag (`hanzo dev --claude`).

## Curl instead

If you would rather not use Homebrew, the installer does the same job on macOS and Linux
and keeps itself up to date:

```bash
curl -fsSL https://hanzo.sh | sh
```

## Updating the formulae

`hanzo` is written by hanzoai/cli's release matrix — its `tap` job, on every tag. Do not
hand-edit it: a version behind the release is a bug in that lane.


MIT OR Apache-2.0, at your option — see [HIP-0137](https://github.com/hanzoai/hips/blob/main/HIPs/hip-0137-one-license.md).
