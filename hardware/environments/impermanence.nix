{ inputs, config, lib, ... }:

{
  imports = [
    inputs.impermanence.nixosModules.impermanence
  ];

  fileSystems."/persist".neededForBoot = true;

  environment.persistence."/persist" = {
    hideMounts = true;
    directories = [
      "/home"
      "/nix"
      "/var/lib/nix-daemon"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/log/journal"
    ]
    ++ lib.optional config.services.accounts-daemon.enable "/var/lib/AccountsService"
    ++ lib.optional config.services.blueman.enable "/var/lib/blueman"
    ++ lib.optional config.hardware.bluetooth.enable "/var/lib/bluetooth"
    ++ lib.optional config.services.colord.enable "/var/lib/colord"
    ++ lib.optional config.services.fprintd.enable "/var/lib/fprint"
    ++ lib.optionals config.services.fwupd.enable [ "/var/cache/fwupd" "/var/lib/fwupd" ]
    ++ lib.optional config.networking.wireless.iwd.enable "/var/lib/iwd"
    ++ lib.optional config.services.kubo.enable config.services.kubo.dataDir
    ++ lib.optional config.services.logrotate.enable "/var/lib/logrotate"
    ++ lib.optionals config.networking.networkmanager.enable [
      "/etc/NetworkManager/system-connections"
      "/var/lib/NetworkManager"
      "/var/lib/NetworkManager-fortisslvpn"
    ]
    ++ builtins.map (container: "/var/lib/nixos-containers/${container}") (builtins.attrNames config.containers)
    ++ lib.optional config.services.power-profiles-daemon.enable "/var/lib/power-profiles-daemon"
    ++ lib.optional config.security.sudo.enable "/var/db/sudo"
    ++ lib.optional config.services.tailscale.enable "/var/lib/tailscale"
    ++ lib.optional config.services.upower.enable "/var/lib/upower";

    files = [
      "/etc/machine-id" # unique id (generated by systemd-boot)
    ];
  };

  services.logrotate.enable = false;
}
