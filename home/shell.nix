{
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".p10k.zsh".source = ~/dotfiles/.p10k.zsh;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    history = {
      path = "$HOME/.zsh_history";
      size = 10000000;
      save = 10000000;

      append = true;

      share = true;
      extended = true;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      ignorePatterns = [
        "ls"
        "ll"
        "la"
        "clear"
        "history"
        "cd"
        "pwd"
        "exit"
        "cd *"
      ];
    };

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = ["git"];
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
    ];

    initExtraFirst = ''
      if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
        source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
      fi
    '';

    initExtra = ''
      # zsh configs
      source ~/.p10k.zsh

      # history settings
      setopt EXTENDED_HISTORY
      setopt HIST_VERIFY            # Nie wykonuj natychmiast po rozwinięciu historii (HIST_VERIFY)
      setopt HIST_REDUCE_BLANKS     # Usuwaj zbędne spacje z historii (HIST_REDUCE_BLANKS)
      export HIST_STAMPS="yyyy-mm-dd HH:MM:SS"

      # Key bindings
      bindkey "^E" history-incremental-search-backward  # CTRL+E
      bindkey "^S" history-incremental-search-forward   # CTRL+S
      bindkey "^[[A" up-line-or-beginning-search
      bindkey "^[[B" down-line-or-beginning-search

      # Podman completion
      [[ $commands[podman] ]] && source <(podman completion zsh)

      # Bash completion
      autoload -U +X bashcompinit && bashcompinit

      # Terragrunt completion
      complete -o nospace -C ${pkgs.terragrunt}/bin/terragrunt terragrunt

      # SOPS/AGE
      export SOPS_AGE_KEY_FILE=$HOME/.sops/sops.key
    '';
  };

  home.shellAliases = {
    python = "uvx python";
    htop = "btop";
    cat = "bat";
    cd = "z";
    la = "eza -la --color=auto";
    ll = "eza -l --color=auto";
    l = "eza --color=auto";
    ls = "eza --color=auto";
    activate = "source .venv/bin/activate";
  };
}
