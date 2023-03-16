{ pkgs, ... }:

let
  whichf = pkgs.writeShellScriptBin "whichf" ''
    readlink -f $(which $@)
  '';
in
{
  imports = [
    ../package/bash
    ../package/direnv
    ../package/emacs
    ../package/git
    ../package/gpg
    ../package/htop
    ../package/ssh
    ../package/tmux
    ../package/fzf
  ];

  # Packages
  home.packages = with pkgs; [
    # Core utils
    du-dust
    sd
    tealdeer
    whichf

    # Administration
    nethogs
    pciutils

    # Search
    fd
    ripgrep

    # Networking
    curl
    netcat
    nmap
    whois

    # Data conversion & manipulation
    ffmpeg
    jq
    p7zip
    poke
    unrar
    unzip
    xmlstarlet

    # Nix
    cachix
    nix-index
    nixpkgs-review
    patchelf

    # General development
    binutils
    file
    linuxPackages.perf
    tokei

    # Debuggers
    strace
    tcpflow
    valgrind

    # Multimedia
    youtube-dl
  ];

  programs.man.enable = true;
}
