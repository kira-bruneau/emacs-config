{ pkgs, pkgsUnstable, pkgsKiraNur, ... }:

let
  emacs = pkgs.callPackage ./package.nix {
    ggt = pkgsKiraNur.ggt;
    ollama = pkgsUnstable.ollama;
  };
in
{
  imports = [
    ../../environments/config.nix
    ../aspell
    ../gpg
  ];

  home = {
    packages = with pkgs; [
      emacs
    ];

    sessionVariables.EDITOR = "emacseditor";
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = "emacsclient.desktop";
  };

  wayland.windowManager.sway.config = {
    startup = [{ command = "${emacs}/bin/emacs"; }];
    assigns."2" = [{ app_id = "^emacs"; }];
  };
}
