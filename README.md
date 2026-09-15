# homebrew-piperace

Homebrew tap for the [Piperace](https://piperace.com) CLI — macOS and Linux,
arm64 and amd64.

```
brew install piperace/piperace/piperace
```

That one line is enough — installing a fully qualified `owner/tap/formula`
name trusts only that formula automatically (Homebrew's
[tap trust](https://docs.brew.sh/Tap-Trust) model, since Homebrew 6.0.0).

If you'd rather install by the short name afterwards:

```
brew tap piperace/piperace
brew trust --formula piperace/piperace/piperace
brew install piperace
brew upgrade piperace   # later, for new versions
```

Binaries are pulled straight from the same S3 release bucket the npm
package and the in-app updater use (`piperace-downloads`), so this tap
carries no build of its own — only a formula pointing at an existing,
already-published version.

Linux is declared for real, not to pad out platform coverage: Homebrew's
tap-trust audit evaluates an `on_macos`/`on_arm`/`on_intel` formula against
every platform once the tap is trusted, and an on_macos-only formula fails
that check on Linux with "formula requires at least a URL". We already
publish `linux-arm64`/`linux-amd64` to the same bucket, so pointing Linuxbrew
at them is a real answer instead of a dummy URL.

## When the formula changes

Only when a version is announced — never when a build is merely published.
In `piperace_client`:

```
mage release            # publishes a build; changes nothing for users
mage announce 1.5.24    # makes it live: backend, this formula and npm together
mage announce 1.5.23    # rollback is the same command
mage status             # which version each channel hands out
```

`mage announce` needs a GitHub token with Contents: read/write on this repo,
stored once with `pbpaste | mage saveHomebrewTapToken` (or `HOMEBREW_TAP_TOKEN`
in the environment).
