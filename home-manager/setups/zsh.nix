{config, ...}: {
  programs.zsh = {
    enable = true;
    # enableCompletion = true;
    shellAliases = {
      hs = "home-manager switch";
      hsr = "home-manager switch && exit";
      g = "git";
      lg = "lazygit";
      "..." = "cd ../..";
      n = "nvim";
      nn = "$HOME/dotfiles/executables/neovide.exe --wsl";
    };
    initExtra = ''
      # set -o vi
      #
      # bind 'set show-mode-in-prompt on'
      # bind 'set vi-ins-mode-string \1\e[5 q\2'  # Bar cursor for Insert mode
      # bind 'set vi-cmd-mode-string \1\e[1 q\2'  # Block cursor for Normal mode

      if [ -x "$HOME/.nix-profile/bin/fish" ]; then
          exec $HOME/.nix-profile/bin/fish
      fi

      eval "$(zoxide init zsh)"
    '';
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromJSON (builtins.readFile "/Users/ndev/dotfiles/oh-my-posh/cobalt2-custom.omp");
  };
}
