{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      package = pkgs.arc-theme;
      name = "Arc";
    };

    iconTheme = {
      package = pkgs.arc-icon-theme;
      name = "Arc";
    };

    cursorTheme = {
      inherit (config.home.pointerCursor) package name size;
    };

    font.name = "sans-serif";
  };

  home = {
    sessionVariables = {
      # Use GTK 3 settings in Qt 5
      # https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications
      QT_QPA_PLATFORMTHEME = "gtk3";
    };
  };
}