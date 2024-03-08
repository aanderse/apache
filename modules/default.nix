{ nixosModulesPath, config, pkgs, lib, ... }:
{
  imports = [
    "${nixosModulesPath}/services/web-servers/apache-httpd"
    ./compat.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  services.httpd = {
    enable = true;
    enablePHP = true;
    user = "www-data";
    group = "www-data";
    phpPackage = pkgs.php56;

    virtualHosts."localhost" = {
      documentRoot = "/srv/www";
    };
  };

  systemd.services.httpd.wantedBy = [ "system-manager.target" ];
}
