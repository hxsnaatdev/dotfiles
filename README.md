<h1 align='center'>CONFIG</h1>

---



# dotfiles

macOS dotfiles powered by **nix-darwin + Home Manager** with a terminal-first setup: Fish, Neovim (LazyVim), WezTerm, Starship, Yazi, Zellij.

This repo is currently the git root of `~/.config`.

## Highlights

- `nix-darwin/flake.nix`: system packages + macOS defaults
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

Apply nix-darwin:

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin#Hasnaats-MacBook-Air
```

<details>
<summary>Different hostname?</summary>

Your flake output is keyed by the name in `nix-darwin/flake.nix`:

```nix
darwinConfigurations."superuser" = nix-darwin.lib.darwinSystem { ... };
```

Rename that attribute (or add another one) and then run:

```bash
darwin-rebuild switch --flake ~/.config/nix-darwin#<your-host>
```

</details>

<details>
<summary>Home Manager note</summary>

`nix-darwin/flake.nix` imports `nix-darwin/home.nix`.

That file is intentionally not tracked here by default (it tends to contain personal paths/machine specifics). Use `nix-darwin/home-manager.nix` as a starting point.

</details>

## Layout

```text
~/.config/
  nix-darwin/   nix-darwin + home-manager entry
  fish/         shell config
  nvim/         Neovim (LazyVim)
  wezterm/      terminal config
  yazi/         file manager
  zellij/       multiplexer
  starship.toml prompt
```


