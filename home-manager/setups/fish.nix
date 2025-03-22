{config, ...}: {
  programs.fish = {
    enable = true;
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
    shellInitLast = ''
      zoxide init fish | source
    '';
  };
}
