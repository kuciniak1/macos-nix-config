{pkgs, ...}: {
  system = {
    stateVersion = 5;
    primaryUser = "kuciniak";
    defaults = {
      dock = {
        autohide = true;
        show-recents = false;
      };

      finder = {
        _FXShowPosixPathInTitle = true;
        _FXSortFoldersFirst = true;
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "clmv";
        FXRemoveOldTrashItems = false;
        FXEnableExtensionChangeWarning = false;

        ShowHardDrivesOnDesktop = false;
        ShowMountedServersOnDesktop = false;
        ShowRemovableMediaOnDesktop = false;
      };

      trackpad = {
        Clicking = false;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = false;
      };

      NSGlobalDomain = {
        "com.apple.swipescrolldirection" = true;
        "com.apple.trackpad.scaling" = 1.0;
        "com.apple.sound.beep.feedback" = 0;
        AppleInterfaceStyle = "Dark";

        AppleKeyboardUIMode = 3;

        NSAutomaticCapitalizationEnabled = true;
        NSAutomaticInlinePredictionEnabled = true;
        NSAutomaticSpellingCorrectionEnabled = true;

        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
      };

      loginwindow = {
        GuestEnabled = false;
        SHOWFULLNAME = false;

        PowerOffDisabledWhileLoggedIn = true;

        RestartDisabledWhileLoggedIn = true;
        ShutDownDisabledWhileLoggedIn = true;
        SleepDisabled = true;
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;

  programs.zsh.enable = true;
  environment.shells = [pkgs.zsh];

  time.timeZone = "Europe/Warsaw";
}
