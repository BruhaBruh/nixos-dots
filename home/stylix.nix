{ pkgs, lib, vars, ... }:

let
  iconTheme =
    if vars.apple.cursors.enabled then {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    } else {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
in
{
  stylix = {
    enable = true;
    targets = {
      hyprland.enable = false;
      hyprpaper.enable = false;
      rofi.enable = false;
      waybar.enable = false;
    };
  };

  gtk = {
    enable = true;

    iconTheme = iconTheme;
  };
}
