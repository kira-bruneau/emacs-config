{ config, lib, ... }:

{
  imports = [
    ../environments/gaming.nix
    ../environments/gui/sway.nix
    ../environments/media-server.nix
    ../services/kubo.nix
    ../services/minecraft/BigChadGuysPlus.nix
    ../users/builder.nix
    ../users/kira.nix
  ];

  system.stateVersion = "23.11";

  users.defaultUser = "kira";
}
