{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    networkmanager.enable = true;
    hostName = "nixos";
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";
  
  # Locales
  i18n.defaultLocale = "en_US.UTF-8";

  # Keyboard in TTY
  console.keyMap = "pl";

  services.xserver = {
    enable = true;
    displayManager.sessionCommands = ''
      feh --bg-scale ~/.config/walls/wall3.jpg
    '';
#    windowManager= {
#      xmonad.enable = true;
#      xmonad.enableContribAndExtras = true;
#    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.displayManager = {
    ly.enable = true;
  };

  # Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  environment.systemPackages = with pkgs; [
    unzip
    tree
    wget
    git
    vim
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11"; # dont change!!

}
