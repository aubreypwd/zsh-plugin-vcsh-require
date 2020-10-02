# `vcshr`

A function to help `vcsh` users _require_ *Github* repositories using `vcsh` for auto-installation in `~/.zshrc`, etc.

## Usage

```bash
vcshr "<packag-name>" "<github-username>" "<github-repo>" --overwrite --autoignore --ssh
```

E.g.:

```bash
vcshr "homebrew" "aubreypwd" "vcsh-homebrew" --overwrite --autoignore --ssh
```

Will require `git@github.com:aubreypwd/vcsh-homebrew.git` as `homebrew`.

## Argumentes

- `--overwrite` to make sure that all files get clobbered by the clone process
- `--autoignore` to automatically write a new `.gitignore.d` for the repo
- `--ssh` to use Github's SSH URL vs. HTTPS (default)

## Requires

- `vcsh`<sup>*</sup>

<sup>*</sup> If using [homebrew](https://brew.sh) on macOS, these will automatically be installed.

## Install

Using [antigen](https://github.com/zsh-users/antigen):

```bash
antigen bundle aubreypwd/zsh-plugin-vcshr@1.0.0
```

## Development

Install the package on `master`:

```bash
antigen bundle aubreypwd/zsh-plugin-vcshr
```

...and contribute upstream by working in `$HOME/.antigen/bundles/aubreypwd/zsh-plugin-vcshr`.

---

## Changelog

### 1.0.0

- First version
