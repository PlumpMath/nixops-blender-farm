# Settings for mounting nas server from digital ocean nodes. Experiments with
# NFS and DAV, with ZeroTier as a p2p network
#


{ config, lib, pkgs, ... }:
let dav-url = "https://nas.example.com:443/x_render";
in {

  ##
  ## ZeroTier
  ##

  # services.zerotierone.enable = true;
  # services.zerotierone.joinNetworks = [""]; # provide your zerotier-one network here


  ##
  ## WebDAV
  ##

  environment.etc."davfs2/certs/nas.pem".text = ''-----BEGIN CERTIFICATE-----
<PROVIDE-SELF-SIGNED-CERTIFICATE-HERE>
-----END CERTIFICATE-----
  '';


  services.davfs2.enable = true;
  services.davfs2.extraConfig = ''
    trust_server_cert /etc/davfs2/certs/nas.pem
  '';
  environment.etc."davfs2/secrets".text = ''
     ${dav-url} webdav-user p4ssw0rd
  '';
  environment.etc."davfs2/secrets".mode="0400";


  #networking.hosts = {
  #   "10.44.44.123" = [ "nas" "nas.example.com" ];
  #};

  fileSystems."/x_render" = {
    device = dav-url;
    fsType = "davfs";
    neededForBoot = false;
    noCheck = true;
    options = ["rw" "user" "uid=1000" "noauto"];
  };


  ##
  ## NFS
  ##

  # fileSystems."/x_render" = {
  #   device = "nas:/volume1/x_render";
  #   fsType = "nfs";
  # };


}


