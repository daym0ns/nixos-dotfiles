{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    go
    gh
    xorg.xhost
    xorg.xserver
  ];

}
