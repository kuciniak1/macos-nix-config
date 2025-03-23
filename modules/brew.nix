{config, ...}: {
  environment.variables.HOMEBREW_NO_ANALYTICS = "1";

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    brews = [
      "pandoc"
      "tmux"
      "wget"
    ];

    casks = [
      "alacritty"
      "alfred"
      "appcleaner"
      "arc"
      "bitwarden"
      "calibre"
      "corretto"
      "discord"
      "flux"
      "font-fira-code-nerd-font"
      "gqrx"
      "jetbrains-toolbox"
      "jordanbaird-ice"
      "linearmouse"
      "microsoft-auto-update"
      "microsoft-teams"
      "minecraft"
      "mullvadvpn"
      "qbittorrent"
      "rectangle"
      "selfcontrol"
      "steam"
      "tempbox"
      "the-unarchiver"
      "tomatobar"
      "vlc"
      "zotero"
    ];

    masApps = {
      Amphetamine = 937984704;
      Cake = 1334702542;
      Tailscale = 1475387142;
    };
  };
}
