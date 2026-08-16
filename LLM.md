# homebrew-tap

**Org:** hanzoai  ·  **Ecosystem:** hanzo  ·  **Path:** `/Users/a/work/hanzo/hanzoai/homebrew-tap`
**Origin:** https://github.com/hanzoai/homebrew-tap.git

## Discovery

This file (`CLAUDE.md`) is the canonical agent-facing readme; `LLM.md` is a symlink to it. Update either name and both stay in sync.

## Where to look first

- `README.md` — human-facing overview (if present)
- `package.json` / `Cargo.toml` / `pyproject.toml` / `go.mod` — language & deps
- `.github/workflows/` — CI surface
- `docs/` — extended docs (if present)

## Sibling repos

See the org-level `LLM.md` at `/Users/a/work/hanzo/hanzoai/LLM.md` for the full inventory of sibling repos and inter-repo dependencies.

## Who writes what

`Formula/hanzo.rb` is written by hanzoai/cli's release matrix (`.hanzo/workflows/
release-matrix.yml`, job `tap`) on every tag: it reads the `.sha256` sidecars
already uploaded beside the release assets, rewrites the version line and the four
checksums, and reads each rewrite back before pushing. `Formula/hanzo-dev.rb` has
no lane — the step that bumped it lived in hanzoai/dev's GitHub Actions and was
deleted with them.

**The gate here cannot see staleness, and that is the trap.** `hanzo.yml` downloads
every url and checks it against the sha256 beside it, so a formula naming an OLD
release stays green forever: both halves are consistent, they are simply consistent
about the wrong version. `hanzo` sat at v1.9.18 through 35 releases that way, and
`brew` served a CLI answering `hanzo serve` where the docs said `hanzo up`.
Freshness is a fact about the RELEASE, so it is enforced where the release happens.

## Standing rules for this tap

Every formula here must install for an unauthenticated user. A tap is a
public surface: `brew install` runs a plain, tokenless download.

- **Verify a checksum against the URL you actually ship, not the newest one you
  happen to have.** `hanzo-dev` shipped with `version "v0.6.83"` in the URL and
  v0.6.91's `sha256` in the formula. Both halves looked fine in isolation; the
  install failed with a checksum mismatch for everyone. Fetch the tarball at the
  exact URL in the file and `sha256sum` it before committing.
- **No formula or cask for a private repo.** `hanzoai/desktop` is private, so its
  release assets 404 to `brew`. The `hanzo-desktop` cask was removed for that
  reason — it had never been installable by a public user. If desktop ever ships
  a public artifact, add the cask back and keep the sha honest.
- **Model ids and commands in the README are claims and get checked.** It carried
  `hanzo login` (the command is `hanzo auth login`) and `-m zen4-mini` (no zen4
  family exists). Read ids from `hanzo models list` / catalog.hanzo.ai; read
  verbs from `hanzo --help`.
- Version strings are bare (`0.6.91`), the `v` lives in the URL as `v#{version}`.

## License

Relicensed from BSD-3-Clause to the dual `MIT OR Apache-2.0` grant under
HIP-0137 ("One License", `hanzoai/hips`). `LICENSE` states the dual grant;
`LICENSE-MIT` and `LICENSE-APACHE` carry the full texts. The original BSD
copyright line — `2026, Hanzo AI, Inc.` — carries over verbatim into
`LICENSE-MIT`: the relicense changes the grant, not the copyright record.
