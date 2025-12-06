{ config, pkgs, ... }:
let
  homeDir = "${config.home.homeDirectory}";
  configDir = "${homeDir}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    xmonad = "xmonad";
  };
in

{

  home.packages = with pkgs; [
    xmobar
    xclip
    dmenu
    feh
  ];

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${configDir}/${subpath}";
    recursive = true;
  }) configs;

}
