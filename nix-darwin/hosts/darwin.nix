{ pkgs, ... }:

{
  nix.enable = false;
  nix.settings.auto-optimise-store = true;

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "ariz";

  users.users.ariz = {
    name = "ariz";
    home = "/Users/ariz";
  };

  environment.systemPackages = with pkgs; [
    fzf
    lazygit
    ripgrep
    uv
  ];

  programs.fish.enable = true;

  system.defaults = {
    dock = {
      autohide = true;
      autohide-delay = 0.0;
    };
  };

  system.stateVersion = 6;
}
