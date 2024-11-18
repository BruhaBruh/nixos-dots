{ pkgs, vars, scripts, ... }:

let
  serviceInterval = toString vars.randomWallpaperService.interval;
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "${vars.defaultWallpaper}";
      wallpaper = ", ${vars.defaultWallpaper}";
    };
  };

  home.file.".config/wallpapers" = {
    source = vars.configWallpapersDirectory;
    recursive = true;
  };

  systemd.user = {
    timers.random-wallpaper = {
      Unit = {
        Description = "Change wallpaper every 15 minutes";
      };
      Timer = {
        OnCalendar = "*:0/${serviceInterval}";
        Unit = "random-wallpaper.service";
      };
      Install = {
        WantedBy = [ "timers.target" ];
      };
    };

    services.random-wallpaper = {
      Unit = {
        Description = "Service to change wallpaper";
      };
      Service = {
        Type = "oneshot";
        ExecStart = "${scripts.randomwallpaper}/bin/randomwallpaper";
      };
    };
  };
}

