<h1 align="center">CONFIG</h1>

<p align="center">
  macOS dotfiles for a terminal-first development environment powered by nix-darwin and Home Manager.
</p>

---

## Overview

This repository is the git root of `~/.config`. It keeps system configuration, shell setup, editor configuration, keyboard automation, terminal tooling, and CLI app settings in one place.

The main stack is:

- **Home Manager** for user-level configuration
- **Fish** with abbreviations, completions, and interactive helpers
- **Neovim / LazyVim** for editing
- **WezTerm**, **Kitty**, **Zellij**, and **Starship** for terminal workflows
- **Yazi**, **btop**, **fastfetch**, and other CLI utilities
- **Kanata**, **Karabiner**, and **warpd** for keyboard and window control

## Repository layout

```text
~/.config/

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
  opencode/                OpenCode configuration
  github-copilot/          Copilot-related metadata
```


## Notes

- This repo is intended to be used directly from `~/.config`.
- Some generated or machine-specific files may appear after using tools such as Karabiner, Copilot, or uv.
- Keyboard configuration is split between Kanata source files and Karabiner exports.
