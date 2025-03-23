{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    git
    just
    vim
    zsh
  ];

  environment.variables.EDITOR = "vim";
}
