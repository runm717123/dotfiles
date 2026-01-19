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
      gpick = ''
        function gpick
            if test (count $argv) -eq 0
                echo "Usage: gpick <branch-name>"
                return 1
            end
            git checkout -b $argv[1] && git pull origin $argv[1]
        end
      '';
      gtry = ''
        if test (count $argv) -eq 0
          echo "Usage: gtry <branch-name>"
          return 1
        end

        set branch $argv[1]

        git checkout main
        and git pull origin main
        and git checkout -b $branch
      '';
    };
    shellAliases =
      {
        py = "python3";
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
        # remove Zone.Identifier
        "rm-zi" = "find . -type f -name '*:*' -exec rm {} \;";
      }
      // (lib.optionalAttrs (builtins.pathExists (config.home.homeDirectory + "/dotfiles/secret.alias.nix")) (import (config.home.homeDirectory + "/dotfiles/secret.alias.nix")));
    shellInitLast = ''
      # alt+f to move forward
      bind \ef forward-word

      zoxide init fish | source
    '';
  };
}
