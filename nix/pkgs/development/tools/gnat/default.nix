{ stdenv, lib, openssl, makeWrapper, pkgs, xkeyboard_config }:

stdenv.mkDerivation rec {
  name = "gnat-${version}";
  version = "community-2019-20190517";

  src = builtins.fetchurl {
    url = "http://mirrors.cdn.adacore.com/art/5cdffc5409dcd015aaf82626";
    sha256 = "0whxvrhy5pdfdjfzxiinpka2wn9ra49d73mzz0vmrk1nzw7cfzgn";
  };

  unpackPhase = "true";
  dontBuild = true;
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
