{ config, ... }:

{
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
    defaultCacheTtl = 240;
    defaultCacheTtlSsh = 240;
    pinentryFlavor = "gnome3";
  };

  # Manage gpg keys outside of home-manager (synced with Syncthing)
  home.file = {
    ".authinfo.gpg".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Auth/.authinfo.gpg";
  };

  xdg.dataFile = {
    "gnupg/openpgp-revocs.d".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Auth/gnupg/openpgp-revocs.d";

    "gnupg/private-keys-v1.d".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Auth/gnupg/private-keys-v1.d";

    "gnupg/pubring.kbx".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/Auth/gnupg/pubring.kbx";
  };
}
