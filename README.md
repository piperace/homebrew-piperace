# homebrew-piperace

Homebrew tap for the [Piperace](https://piperace.com) CLI.

```
brew tap piperace/piperace
brew install piperace
```

(`brew install piperace/piperace/piperace` also works as a one-liner —
same install, just spelled as owner/tap/formula instead of two steps.)

Binaries are pulled straight from the same S3 release bucket the npm
package and the in-app updater use (`piperace-downloads`), so this tap
carries no build of its own — only a formula pointing at an existing,
already-published version.

## Updating the formula

After `mage deploy` publishes a new version to S3, edit
`Formula/piperace.rb`:

1. Bump `version`.
2. Replace both `url`s with the new version path.
3. Replace both `sha256`s — they're printed in `dist/SHA256SUMS`
   (or `dist/manifest.json`) after the build.

Then `brew upgrade piperace` picks it up on any machine with the tap
installed.
