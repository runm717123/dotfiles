{
  config,
  pkgs,
  ...
}: {
  # NOTE: replace "/dotefiles" here with the parent folder name
  # e.g if this file is at dota2/home-manager/home.nix then use "dota2"

  home.username = builtins.getEnv "USER";
  home.homeDirectory = "/home/${builtins.getEnv "USER"}";
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    nodejs_22
    nest-cli
    corepack_22
    gcc
    fzf
    ripgrep
    alejandra
    nerd-fonts.inconsolata
    unzip
    gitAndTools.gh
    yazi
    file
    jq
    fd
    postgresql_16
    zoxide
    turbo
  ];

  home.sessionVariables =
    {
      COREPACK_ENABLE = "1";
      _ZO_DOCTOR = 0; # disable zoxide doctor annoying message
    }
    ## combine with the env.nix file
    // import (config.home.homeDirectory + "/dotfiles/env.nix");

  imports = [
    ./setups/git.nix
    ./setups/nvim.nix
    ./setups/bash.nix
    ./setups/fish.nix
    ./setups/postgresql.nix
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
