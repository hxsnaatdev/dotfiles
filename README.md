# dotfiles

Opinionated macOS (aarch64-darwin) setup using **nix-darwin + Home Manager**, with a terminal-first workflow (Fish, Neovim/LazyVim, WezTerm, Starship, Yazi, Zellij, etc.).

This repo is currently the git root of `~/.config`.

## What You Get

| Area | Tooling | Notes |
| --- | --- | --- |
| System | `nix-darwin` | `nix-darwin/flake.nix` manages system packages + macOS defaults |
| User | Home Manager | `nix-darwin/home.nix` is the active Home Manager module (not tracked here by default) |
| Shell | Fish | Vi bindings, clipboard yanks, `eza` aliases, `atuin` integration |
| Prompt | Starship | Custom two-line prompt + rich git status |
| Editor | Neovim (LazyVim) | `nvim/` bootstraps `lazy.nvim` + a small plugin layer |
| Terminal | WezTerm | Catppuccin theme, transparency, a couple keybinds |
| File manager | Yazi | Hidden files on, custom theme, vim-like keymaps, hex preview |
| Multiplexer | Zellij | Custom keybinds for pane/tab workflows |
| Misc | btop, fastfetch, gh/gh-dash, karabiner, kitty | Mostly straightforward configs |

## Quick Start (macOS)

### 1) Clone

If you want to keep your existing `~/.config`, clone elsewhere and symlink what you need.

If you want this repo to *be* `~/.config` (this is how it's currently set up here):

```bash
git clone https://github.com/hxsnaatdev/dotfiles.git ~/.config
```

### 2) Install Nix

Install Nix using your preferred method.

This flake expects:

```text
nix.settings.experimental-features = "nix-command flakes"
```

### 3) Apply nix-darwin

This repo defines a host configuration in `nix-darwin/flake.nix`:

```nix
darwinConfigurations."Hasnaats-MacBook-Air" = ...
```

Run:

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin#Hasnaats-MacBook-Air
```

If your Mac hostname is different, either:

1. Change the attribute name in `nix-darwin/flake.nix`, or
2. Run `darwin-rebuild switch --flake ~/.config/nix-darwin#<your-hostname>` after updating the flake.

### 4) Home Manager

Home Manager is wired in via nix-darwin.

Important: `nix-darwin/flake.nix` imports `./home.nix`, but this repo currently does not track it (it often contains personal paths and machine-specific values). `nix-darwin/home-manager.nix` exists as a reference/template.

Create `nix-darwin/home.nix` with your Home Manager config, or change the import to point at a tracked file.

## Repo Layout

```text
~/.config/
  nix-darwin/          nix-darwin + home-manager entrypoints
  fish/                shell config (aliases, bindings, functions)
  nvim/                LazyVim-based Neovim setup
  wezterm/             terminal config
  starship.toml        prompt
  yazi/                file manager config + theme + keymaps
  zellij/              terminal multiplexer config
  btop/                system monitor config
  fastfetch/           system fetch config
  gh/ gh-dash/         GitHub CLI + dashboard
  karabiner/           keyboard remaps
  kitty/               kitty terminal config
  warpd/               window/navigation tool config
  opencode/            local plugin deps (kept minimal)
```

## Notable Behaviors

### Fish

`fish/config.fish` includes:

- Vi key bindings
- System clipboard yank/paste bindings
- `eza`-powered `ls`/`ll`/`lt`
- `y` function to launch Yazi and `cd` back to its last directory

### Neovim

`nvim/` bootstraps `lazy.nvim` and loads LazyVim. Minimal plugin overrides live in `nvim/lua/plugins/*`.

### Starship

Two-line prompt with git status and lots of language modules enabled in `starship.toml`.

### Yazi

`yazi/yazi.toml` enables:

- Hidden files shown by default
- Rule-based openers (edit vs open vs reveal)
- Hex preview via `hexyl` (see `append_previewers`)

## Security Notes (Read This Before You Commit)

- Some app configs can contain **tokens** or **secrets**.
- Example: Raycast’s `config.json` can contain access tokens. Keep that directory out of git, or sanitize it before adding.
- Before pushing, review changes with `git diff` and `git status`.

## Updating

```bash
git pull
darwin-rebuild switch --flake ~/.config/nix-darwin#Hasnaats-MacBook-Air
```

## Troubleshooting

- `darwin-rebuild` can’t find your host: update `darwinConfigurations.<name>` in `nix-darwin/flake.nix`.
- Home Manager import fails: create `nix-darwin/home.nix` (or point the import at a tracked file).
- Homebrew note: `nix-darwin/flake.nix` assumes Homebrew is installed separately.
