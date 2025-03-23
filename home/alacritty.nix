{ pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      general.import = [
        "${pkgs.alacritty-theme}/campbell.toml"
      ];
      font = {
        size = 14;
        normal.family = "FiraCode Nerd Font Mono";
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };
}