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
      if test "$MODE" = "home"
        if not ss -tulnp | grep -q ":5433"
          pgstart
        else
          echo "Postgres is already running"
        end
      else
        echo "Not in home mode"
      end
    '';
  };
}
