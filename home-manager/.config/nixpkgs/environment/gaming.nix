{ config, pkgs, ... }:

{
  home.packages = with pkgs; with nur.repos.metadark; [
    # Games & Launchers
    clonehero # unfree
    lutris # unfreeRedistributable with steamSupport = true
    multimc
    pokemmo-installer
    protontricks
    runelite
    runescape-launcher # unfree
    steam # unfreeRedistributable
    steam-run # unfreeRedistributable
    VVVVVV # unfree

    # Emulators
    dolphinEmuMaster
    mupen64plus
    (winetricks.override { wine = wineWowPackages.staging; })
    wineWowPackages.staging

    # Controllers
    xwiimote

    # Chat
    discord # unfree

    # Recording
    obs-studio

    # Overlay / Post-processing
    goverlay
    vkBasalt
  ];
}
