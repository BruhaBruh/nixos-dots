{ vars, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    # ohMyZsh = {
    #   enable = true;
    #   plugins = [ "git" "history" "sudo" ];
    #   theme = "agnoster";
    # };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch --flake ${vars.flakeDirectory}";
      "rebuildHome" = "home-manager switch --flake ${vars.flakeDirectory}";
      "rebuildAll" = "sudo nixos-rebuild switch --flake ${vars.flakeDirectory} && home-manager switch --flake ${vars.flakeDirectory}";
      "sshtimeweb" = "ssh root@46.19.67.148";
      "sshpostnow" = "ssh root@83.147.244.71";
      "sshaeza" = "ssh root@91.184.242.152";
      "aezatunnel" = "ssh -N -L 2053:localhost:2053 root@91.184.242.152";
    };
  };
}