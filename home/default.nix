{username, ...}: {
  imports = [
    ./shell.nix
    ./packages.nix
    ./alacritty.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";

    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
}
