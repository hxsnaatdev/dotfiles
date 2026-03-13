{ config, pkgs, ... }:

{

  home.username = "ariz";
  home.homeDirectory = "/Users/ariz";
  home.stateVersion = "23.05"; 

  # Makes sense for user specific applications that shouldn't be available system-wide
  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # ".config/wezterm".source = ~/dotfiles/wezterm;
    # ".config/zellij".source = ~/dotfiles/zellij;
    # ".config/nvim".source = ~/dotfiles/nvim;
    # ".config/nix".source = ~/dotfiles/nix;
    # ".config/nix-darwin".source = ~/dotfiles/nix-darwin;
    # ".config/tmux".source = ~/dotfiles/tmux;
  };


  imports = [  
    inputs.ai-nixCfg.homeManagerModules.claude-code  
    inputs.ai-nixCfg.homeManagerModules.codex  
    inputs.ai-nixCfg.homeManagerModules.github-copilot  
    inputs.ai-nixCfg.homeManagerModules.crush  
  ];  


  home.sessionVariables = {
  };

  home.sessionPath = [
    "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
  ];
  programs.home-manager.enable = true;
  #programs.zsh = {
   # enable = true;
   # initExtra = ''
      # Add any additional configurations here
   #j   export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
    #  if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    #    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
    #  fi
    #'';
  #};
}
