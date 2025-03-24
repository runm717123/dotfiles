{config, ...}: {
  programs.bash = {
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
      yw = "yarn workspace";
      dev = "yarn workspace @apps/go start";
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

      rm -f ~/.config/nvim/lazy-lock.json

      eval "$(zoxide init bash)"
    '';
  };

  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.readFile "${config.home.homeDirectory}/dotfiles/oh-my-posh/cobalt2-custom.omp");
  };
}
