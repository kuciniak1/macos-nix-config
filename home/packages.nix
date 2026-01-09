{pkgs, ...}: {
  home.packages = with pkgs; [
    ### Infra
    age
    ansible
    ansible-lint
    awscli
    aws-nuke
    opentofu
    sops
    terragrunt

    ### Utils
    bat
    git-crypt
    glow
    jq
    nil
    nixd
    ripgrep
    tldr
    uv

    ### Misc
    btop
    cowsay
    tree

    ### Terminal config
    alacritty-theme
    silver-searcher
    zsh-autosuggestions
    zsh-powerlevel10k
    zsh-syntax-highlighting
  ];

  programs = {
    eza = {
      enable = true;
      git = true;
      icons = "auto";
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      defaultCommand = "ag --hidden -g ''";
    };

    git = {
      enable = true;
      settings = {
        user.name = "kuciniak1";
        user.email = "danielkucinski@proton.me";
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
