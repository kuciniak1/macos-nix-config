{username, ...}: {
  imports = [
    ./shell.nix
    ./packages.nix
    ./alacritty.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    stateVersion = "25.11";
  };
  programs.home-manager.enable = true;
}
