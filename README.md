<h1 align="center">CONFIG</h1>

<p align="center">
  macOS dotfiles for a terminal-first development environment powered by nix-darwin and Home Manager.
</p>

---

## Overview

This repository is the git root of `~/.config`. It keeps system configuration, shell setup, editor configuration, keyboard automation, terminal tooling, and CLI app settings in one place.

The main stack is:

- **nix-darwin** for macOS system configuration
- **Home Manager** for user-level configuration
- **Fish** with abbreviations, completions, and interactive helpers
- **Neovim / LazyVim** for editing
- **WezTerm**, **Kitty**, **Zellij**, and **Starship** for terminal workflows
- **Yazi**, **btop**, **fastfetch**, and other CLI utilities
- **Kanata**, **Karabiner**, and **warpd** for keyboard and window control

## Repository layout

```text
~/.config/
  nix-darwin/
    flake.nix              nix-darwin flake entrypoint
    hosts/darwin.nix       macOS system packages, defaults, and users
    home/default.nix       Home Manager user entrypoint
    home/dev/git.nix       Git-related Home Manager config
    home/comms/            email and communication modules

  fish/
    config.fish            shell startup, aliases, abbreviations, helpers
    conf.d/                Fish startup snippets
    completions/           command completions
    functions/             custom Fish functions

  nvim/                    Neovim / LazyVim configuration
  wezterm/                 WezTerm terminal configuration
  kitty/                   Kitty terminal configuration
  zellij/                  terminal multiplexer configuration
  starship.toml            prompt configuration

  keyboard/
    kanata/                Kanata keyboard layers, scripts, binaries
    karabiner/             Karabiner configuration source

  karabiner/               exported Karabiner configuration and backups
  warpd/                   pointer/window navigation configuration
  yazi/                    file manager configuration
  atuin/                   shell history configuration
  btop/                    system monitor configuration
  fastfetch/               system summary configuration
  gh/                      GitHub CLI configuration
  gh-dash/                 GitHub dashboard configuration
  opencode/                OpenCode configuration
  github-copilot/          Copilot-related metadata
  uv/                      uv package manager metadata
```

## Setup on macOS

Clone this repository into `~/.config`:

```bash
git clone https://github.com/hxsnaatdev/dotfiles.git ~/.config
```

Enable Nix flakes if they are not already enabled:

```nix
experimental-features = nix-command flakes
```

Build the nix-darwin configuration without switching:

```bash
darwin-rebuild build --flake ~/.config/nix-darwin#Hasnaats-MacBook-Air
```

Apply the nix-darwin configuration:

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin#Hasnaats-MacBook-Air
```

The flake also exposes `#ariz` as a compatibility output:

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin#ariz
```

## Nix structure

`nix-darwin/flake.nix` wires together the system and Home Manager modules:

```nix
modules = [
  ./hosts/darwin.nix
  home-manager.darwinModules.home-manager
  {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.ariz = import ./home;
  }
];
```

The system-level configuration lives in `nix-darwin/hosts/darwin.nix`. The user-level Home Manager entrypoint lives in `nix-darwin/home/default.nix`.

## Common commands

Check the flake:

```bash
nix flake check --no-write-lock-file ./nix-darwin
```

Build without applying:

```bash
darwin-rebuild build --flake ./nix-darwin#Hasnaats-MacBook-Air
```

Switch to the configured system:

```bash
darwin-rebuild switch --flake ./nix-darwin#Hasnaats-MacBook-Air
```

Review local changes:

```bash
git status
git diff
```

## Notes

- This repo is intended to be used directly from `~/.config`.
- Some generated or machine-specific files may appear after using tools such as Karabiner, Copilot, or uv.
- Keyboard configuration is split between Kanata source files and Karabiner exports.
- `nix flake check --no-write-lock-file ./nix-darwin` is the quickest validation before committing Nix changes.
