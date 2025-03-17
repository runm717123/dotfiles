{config, ...}: {
  programs.lazygit = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = config.home.sessionVariables.GIT_USERNAME;
    userEmail = config.home.sessionVariables.GIT_EMAIL;

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
        st = status;
        get = pull origin;
        post = push origin;
        backup = commit - am "backup";
        config-edit = config - -global - -edit;
      };

      # comment this if there is a problem or you not using gh cli
      # it replace the role of `gh auth setup-git`
      credential."https://github.com".helper = "!gh auth git-credential";
    };
  };

  home.file = {
    ".config/lazygit/config.yml".source = "${config.home.homeDirectory}/dotfiles/lazygit/config.yml";
  };
}
