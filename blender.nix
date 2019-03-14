{ stdenv, pkgs, ...} :
let blender = import ./pkgs/blender-beta.nix;
in {
    environment.systemPackages = [
      blender
    ];
}
