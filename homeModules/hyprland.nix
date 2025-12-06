{ config, pkgs, ... }:
let
  homeDir = "${config.home.homeDirectory}";
  configDir = "${homeDir}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    waybar = "waybar";
    wofi = "wofi";
    hypr = "hypr";
  };
in

{

  home.packages = with pkgs; [
    wofi
    waybar
    hyprpaper
    wl-clipboard
    rose-pine-hyprcursor
  ];

  home.file.".icons" = {
    source = create_symlink "${configDir}/icons";
    recursive = true;
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${configDir}/${subpath}";
    recursive = true;
  }) configs;

}
