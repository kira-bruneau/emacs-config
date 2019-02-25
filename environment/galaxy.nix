{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    docker
    git-review
    jetbrains.idea-ultimate
    slack
    virtualbox
  ];
}
