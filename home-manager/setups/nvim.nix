{config, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.file = {
    ".config/nvim" = {
      source = "${config.home.homeDirectory}/dotfiles/nvim";
      recursive = true;
    };
    ".config/nvim/lazy-lock.json".text = "";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
