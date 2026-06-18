<h1 align='center'>CONFIG</h1>

---

# dotfiles

macOS dotfiles powered by **nix-darwin + Home Manager** with a terminal-first setup: Fish, Neovim (LazyVim), WezTerm, Starship, Yazi, Zellij.

This repo is currently the git root of `~/.config`.

## Highlights

- `nix-darwin/flake.nix`: nix-darwin flake entrypoint
- `nix-darwin/hosts/darwin.nix`: macOS system packages and defaults
- `nix-darwin/home/default.nix`: Home Manager user entrypoint
- `fish/config.fish`: vi mode + clipboard yanks + `eza` aliases + `atuin`
- `nvim/`: LazyVim bootstrapped via `lazy.nvim`
- `starship.toml`: custom 2-line prompt
- `yazi/`: hidden files on + theme + keymaps + hex preview

## Setup (macOS)

Clone into `~/.config`:

```bash
git clone https://github.com/hxsnaatdev/dotfiles.git ~/.config
```

Enable flakes (required):

```nix
# /etc/nix/nix.conf (or equivalent)
experimental-features = nix-command flakes
```

Build nix-darwin without switching:

```bash
darwin-rebuild build --flake ~/.config/nix-darwin#Hasnaats-MacBook-Air
```

Apply nix-darwin:

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin#Hasnaats-MacBook-Air
```

<details>
<summary>Different hostname?</summary>

Your flake output is keyed by the name in `nix-darwin/flake.nix`:

```nix
darwinConfigurations."Hasnaats-MacBook-Air" = ...;
```

Rename that attribute or add another output, then run:

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin#<your-host>
```

The current flake also exposes `#ariz` as a compatibility alias.

</details>

<details>
<summary>Home Manager note</summary>

`nix-darwin/flake.nix` imports `home-manager.darwinModules.home-manager` and wires the user config with:

```nix
home-manager.users.ariz = import ./home;
```

The Home Manager entrypoint is `nix-darwin/home/default.nix`.

</details>

## Layout

```text
~/.config/
  nix-darwin/
    flake.nix          flake entrypoint
    hosts/darwin.nix   macOS/nix-darwin system config
    home/default.nix   Home Manager user config
  fish/                shell config
  nvim/                Neovim (LazyVim)
  wezterm/             terminal config
  yazi/                file manager
  zellij/              multiplexer
  starship.toml        prompt
```
