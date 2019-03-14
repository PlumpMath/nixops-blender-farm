{ config, lib, pkgs, ... }:
{
    services.openssh.enable = true;
    deployment.targetEnv = "digitalOcean";
    deployment.digitalOcean.region = "fra1";
    deployment.digitalOcean.size = "16gb"; #c-2

}
