# homebrew-pcr

Homebrew tap for the [`pcr`](https://github.com/pcr-developers/cli) CLI —
the open-source capture-and-ship side of [PCR.dev](https://pcr.dev),
Prompt & Code Review for AI-native teams.

## Install

```bash
brew tap pcr-developers/pcr
brew install pcr
```

That gives you the `pcr` binary on `PATH`. From there:

```bash
pcr help        # interactive command browser
pcr login       # authenticate
pcr init        # register the current git repo
pcr start       # capture prompts as you work
```

The full quick-start lives in the [main CLI README](https://github.com/pcr-developers/cli#two-minute-tour).

## Upgrade

```bash
brew update
brew upgrade pcr
```

## Supported platforms

| Platform | Bottle |
|---|---|
| macOS · Apple Silicon | `pcr-macos-arm64` |
| macOS · Intel | `pcr-macos-x64` |
| Linux · x64 | `pcr-linux-x64` |

For Windows, install via npm — see [the CLI README](https://github.com/pcr-developers/cli#install).

## How this tap stays in sync with releases

Cutting a release in `pcr-developers/cli` triggers a `repository_dispatch`
event that runs [`.github/workflows/update-formula.yml`](.github/workflows/update-formula.yml)
in this tap. The workflow:

1. Downloads the SHA-256 checksums from the release's assets.
2. Renders `Formula/pcr.rb.template` with the new version + checksums.
3. Commits the resulting `Formula/pcr.rb` to `main`.

So a `git push --tags` in the CLI repo is all it takes — no manual
formula bumps. If you ever need to repair a botched release, you can
trigger the workflow by hand from the **Actions** tab.

## Repo layout

```text
homebrew-pcr/
├── Formula/
│   ├── pcr.rb            ← live formula (auto-updated)
│   └── pcr.rb.template   ← template the workflow renders into pcr.rb
├── .github/workflows/
│   └── update-formula.yml
├── LICENSE               ← Apache 2.0
└── README.md             ← you are here
```

## License

Apache 2.0 — same as the CLI itself. See [LICENSE](LICENSE).
