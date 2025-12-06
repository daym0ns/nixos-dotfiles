{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    go
    gh
  ];

}
