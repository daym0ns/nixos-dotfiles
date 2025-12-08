{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    go
    gh
    lua
    xhost
    gnumake
    xorg.xhost
    xorg.xinit
  ];

}
