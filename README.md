# dotfiles

## Install Xcode Command Line Tools

```bash
xcode-select --install
```

## Install Brew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install chezmoi

```bash
brew install chezmoi
```

## Apply config

```bash
chezmoi init --apply apoloqize
chezmoi update
```
