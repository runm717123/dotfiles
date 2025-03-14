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

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    nodejs_22
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
    zoxide
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.lazygit = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = config.programs.bash.sessionVariables.GIT_USERNAME;
    userEmail = config.programs.bash.sessionVariables.GIT_EMAIL;

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      core.editor = "nvim";
      push.default = "simple";
      include.path = "~/.gitconfig";
      alias = {
        ch = "checkout";
        br = "branch";
        st = "status";
        cm = "commit -m";
        lg = "log --oneline --graph --decorate";
        undo = "reset HEAD~ --soft";
        include = "commit --amend --no-edit";
      };

      # comment this if there is a problem or you not using gh cli
      # it replace the role of `gh auth setup-git`
      credential."https://github.com".helper = "!gh auth git-credential";
    };
  };

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

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".config/nvim" = {
      source = "${config.home.homeDirectory}/dotfiles/nvim";
      recursive = true;
    };
    ".config/nvim/lazy-lock.json".text = "";
    ".config/lazygit/config.yml".source = "${config.home.homeDirectory}/dotfiles/lazygit/config.yml";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    COREPACK_ENABLE = "1";
  };
}
