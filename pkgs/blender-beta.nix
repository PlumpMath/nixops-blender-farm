with (import <nixpkgs> {});
with lib;

let
 python = pythonPackages.python;

 libPath = lib.makeLibraryPath
    [
      boost cmake ffmpeg gettext glew ilmbase
      xorg.libXi xorg.libX11 xorg.libXext xorg.libXrender xorg.libXfixes libstdcxx5 xorg.libXxf86vm
      freetype libjpeg libpng libsamplerate libsndfile libtiff libGLU_combined openal
      opencolorio openexr openimageio openjpeg_1 python zlib fftw jemalloc opencollada
    ];

in
stdenv.mkDerivation rec {
  name = "blender-beta-${version}";
  version = "2.80-e79bb957fc3";
  src = fetchurl {
    url = "https://builder.blender.org/download/blender-${version}-linux-glibc224-x86_64.tar.bz2";
    sha256 = "62fa51ebf70c5d3102a96ab28ed83b0a71d03c9edbb25590007c5cb51ac3d716";
  };

  buildInputs = [ patchelf ];

  buildCommand =
    ''
      set -x 
      tar xvfa $src
      lib=$out/lib
      mkdir -p $out/bin
      cd blender-${version}-*
      cp -va lib $lib
      cp -va {2.80,icons} $out/

      patchelf --interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" --set-rpath "${libPath}" blender
      cp -va blender $out/blender
      ln -s $out/blender $out/bin/blender
      
    '';


  meta = with stdenv.lib; {
    description = "3D Creation/Animation/Publishing System";
    homepage = https://www.blender.org;
    # They comment two licenses: GPLv2 and Blender License, but they
    # say: "We've decided to cancel the BL offering for an indefinite period."
    license = licenses.gpl2Plus;
    platforms = [ "x86_64-linux" ];
  };
}

