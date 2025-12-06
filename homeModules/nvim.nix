{ config, pkgs, ... }:
let
  homeDir = "${config.home.homeDirectory}";
  configDir = "${homeDir}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
  };
in

{

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    # dependencies
    fd
    fzf
    git
    gcc
    xclip
    ripgrep
    wl-clipboard
    
    # language servers
    nil
    gopls
    lua-language-server
    haskell-language-server
  ];

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${configDir}/${subpath}";
    recursive = true;
  }) configs;

}
