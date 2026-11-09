# homebrew-tap

Homebrew tap for [Gostman](https://github.com/kunalgoesbyken/gostman).

```bash
brew install --cask kunalgoesbyken/tap/gostman      # desktop app
brew install kunalgoesbyken/tap/gostman-cli         # command line
```

The manifests follow Gostman releases on their own: a scheduled workflow runs `update.sh` every three hours and commits the new version and checksums from the release's `SHA256SUMS`.
