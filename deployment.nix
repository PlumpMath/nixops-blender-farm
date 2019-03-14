{
  resources.sshKeyPairs.ssh-key = {};
  network.description = "Blender Render Farm Experiments";
  m1 = {  imports = [ ./users.nix ./digitalocean.nix ./blender.nix ./nas.nix ]; };
#  m2 = {  imports = [ ./users.nix ./digitalocean.nix ./blender.nix ./nas.nix ]; };
#  m3 = {  imports = [ ./users.nix ./digitalocean.nix ./blender.nix ./nas.nix ]; };
}
