{
  config,
  lib,
  ...
}: {
  programs.fish = {
    enable = true;
    functions = {
      clip = ''
        function clip
            if test (count $argv) -eq 0
                echo "Usage: copy <command>"
                return 1
            end
            set command (string join " " $argv)
            eval $command | clip.exe
        end
      '';
    };
    shellAliases =
      {
        hs = "home-manager switch";
        hsr = "home-manager switch && exit";
        g = "git";
        lg = "lazygit";
        "..." = "cd ../..";
        n = "nvim";
        nn = "$HOME/dotfiles/executables/neovide.exe --wsl";
        dev = "yarn workspace @apps/go start";
        yw = "yarn workspace";
        dn = "rm -f ~/.config/nvim/lazy-lock.json";
        gpm = "git pull origin main";
        gcm = "git checkout main";
        gcmu = "git checkout main && git pull origin main";
        wpwd = "wslpath -w .";
        hostinger = "ssh root@72.60.196.72";
        contabo = "ssh root@167.86.66.154";
        # remove Zone.Identifier
        "rm-zi" = "find . -type f -name '*:*' -exec rm {} \;";
      }
      // (lib.optionalAttrs (builtins.pathExists (config.home.homeDirectory + "/dotfiles/secret.alias.nix")) (import (config.home.homeDirectory + "/dotfiles/secret.alias.nix")));
    interactiveShellInit = ''
      rm -f ~/.config/nvim/lazy-lock.json
    '';
    shellInitLast = ''
      # alt+f to move forward
      bind \ef forward-word

      zoxide init fish | source
      if test "$MODE" = "home"
        if not ss -tulnp | grep -q ":5433"
          # pgstart
        else
          echo "Postgres is already running"
        end
      else
        echo "Not in home mode"
      end
    '';
  };
}
