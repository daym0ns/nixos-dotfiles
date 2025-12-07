{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    go
    gh
    xhost
    gnumake
    xorg.xhost
    xorg.xinit
  ];

}
