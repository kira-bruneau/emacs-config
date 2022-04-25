{ pkgs, ... }:

{
  imports = [
    ../package/bcml
    ../package/lutris
    ../package/mupen64plus
  ];

  home.packages = with pkgs; [
    # Games & Launchers
    clonehero
    polymc
    pokemmo-installer
    protontricks
    (sm64ex.override {
      compileFlags = [
        "BETTERCAMERA=1"
      ];
    })
    steam
    steam-run
    VVVVVV

    # Emulators
    dolphinEmuMaster
    wineWowPackages.staging
    winetricks

    # Controllers
    xwiimote

    # Chat
    discord

    # Recording
    obs-studio

    # Overlay / Post-processing
    goverlay
    mangohud
    vkBasalt
  ];
}
