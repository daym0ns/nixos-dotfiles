{ config, pkgs, ... }:
let
  homeDir = "${config.home.homeDirectory}";
  configDir = "${homeDir}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in

{
  home.packages = with pkgs; [
    zsh
    fzf
    git
    nitch
    oh-my-posh
  ];

  home.file.".zshrc" = {
    source = create_symlink "${configDir}/zshrc";
  };

  xdg.configFile."ohmyposh" = {
    source = create_symlink "${configDir}/ohmyposh";
    recursive = true;
  };
}
