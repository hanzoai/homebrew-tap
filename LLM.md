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
