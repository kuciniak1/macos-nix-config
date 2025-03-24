{pkgs, ...}: {
  system = {
    stateVersion = 5;
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

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
        FXRemoveOldTrashItems = true;
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
        SHOWFULLNAME = true;
        ShutDownDisabled = true;
      };
    };
  };

  security.pam.enableSudoTouchIdAuth = true;

  programs.zsh.enable = true;
  environment.shells = [pkgs.zsh];

  time.timeZone = "Europe/Warsaw";
}
