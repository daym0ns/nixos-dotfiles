{ config, pkgs, ... }:
let
  homeDir = "${config.home.homeDirectory}";
  configDir = "${homeDir}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    alacritty = "alacritty";
    walls = "walls";
  };
in

{
  home = {
    username = "user";
    homeDirectory = "/home/user";
  };

  imports = [
    ./homeModules/hyprland.nix
    ./homeModules/nvim.nix
    ./homeModules/zsh.nix
    ./homeModules/dev.nix
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      test = "echo hi";
    };
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${configDir}/${subpath}";
    recursive = true;
  }) configs;

  home.packages = with pkgs; [
    vesktop
    alacritty
    pavucontrol
    ungoogled-chromium
  ];

  home.stateVersion = "25.11";
}
