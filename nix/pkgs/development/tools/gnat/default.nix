{ stdenv, lib, openssl, makeWrapper, pkgs, xkeyboard_config }:

stdenv.mkDerivation rec {
  name = "gnat-${version}";
  version = "community-2019-20190517-18C94";

  src = builtins.fetchurl {
    url = "https://community.download.adacore.com/v1/d40edcdd2d3cc8c64e0f9600ca274bc13d5b49ba?filename=gnat-2019-20190517-18C94-src.tar.gz";
    sha256 = "1ybcn36gdqmalqdwm57qsij6schp3iw065m6bhd3y9aypdlwppxf";
  };

  nativeBuildInputs = [ makeWrapper ];

  ldLibraryPath = lib.makeLibraryPath [
      stdenv.cc.cc.lib
      openssl
      pkgs.fontconfig
      pkgs.freetype
      pkgs.dbus_libs
      pkgs.xorg.libX11
      pkgs.xorg.libxcb
  ];

  installPhase = ''
    mkdir -p $out/bin

    cp $src gnat
    chmod +wx gnat
    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" ./gnat
    chmod -w gnat
    cp gnat $out/bin/gnat

    wrapProgram $out/bin/gnat \
      --suffix LD_LIBRARY_PATH : ${ldLibraryPath} \
      --prefix "QT_XKB_CONFIG_ROOT" ":" "${xkeyboard_config}/share/X11/xkb"
  '';

  meta = {
    description = "GNAT Community Edition";
    homepage = https://www.adacore.com/community;
    license = stdenv.lib.licenses.unfreeRedistributable;
    platforms = [ "x86_64-linux" ];
  };
}
