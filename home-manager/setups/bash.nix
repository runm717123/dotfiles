{config, ...}: {
  programs.bash = {
    enable = true;
    enableCompletion = true;
    sessionVariables = import (config.home.homeDirectory + "/dotfiles/env.nix");
    shellAliases = {
      hs = "home-manager switch";
      hsr = "home-manager switch && exit";
      g = "git";
      lg = "lazygit";
      "..." = "cd ../..";
      n = "nvim";
      nn = "$HOME/dotfiles/executables/neovide.exe --wsl";
      dev = "yarn workspace @apps/go start";
    };
    initExtra = ''
      # Set up the Neovim plugin manager
      rm ~/.config/nvim/lazy-lock.json
      eval "$(zoxide init bash)"
    '';
  };

  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;
    settings = builtins.fromJSON (builtins.readFile "${config.home.homeDirectory}/dotfiles/oh-my-posh/cobalt2-custom.omp");
  };
}
