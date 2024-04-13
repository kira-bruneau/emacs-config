{ inputs, lib, ... }:

{
  imports = [
    ../environments/gaming.nix
    ../environments/gui/gnome.nix
    ../users/jakira.nix
    inputs.jovian.nixosModules.default
  ];

  system.stateVersion = "23.11";

  users.defaultUser = "jakira";

  jovian = {
    steam = {
      enable = true;
      autoStart = true;
      user = "jakira";
      desktopSession = "gnome";
    };

    decky-loader.enable = true;
  };
}
