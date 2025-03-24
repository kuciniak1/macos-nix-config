hostname := "kuciniak-macbook"

default:
  @just --list

# Build and switch to the new system configuration
[group('nix')]
rebuild: 
  darwin-rebuild switch --flake . --impure

# Update all inputs
[group('nix')]
update:
  nix flake update

# List all generations of the system profile
[group('nix')]
history:
  nix profile history --profile /nix/var/nix/profiles/system

# Remove all generations older than 7 days
# has to be started with sudo
[group('nix')]
clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

# Garbage collect all unused nix store entries
# has to be started twice, first with sudo and then without
[group('nix')]
gc:
  sudo nix-collect-garbage --delete-older-than 7d
  nix-collect-garbage --delete-older-than 7d

# Format all nix files
[group('nix')]
fmt:
  nix fmt

# Add all changes to the git repository
[group('git')]
update-git message:
  just fmt
  git add .
  git commit -m "{{message}}"
  git push