{ stdenv, fetchurl, lib, openssl, makeWrapper, pkgs }:

stdenv.mkDerivation rec {
  name = "p4-${version}";
  version = "2018.2.1751184";

  src = fetchurl {
    url = "http://www.perforce.com/downloads/perforce/r18.2/bin.linux26x86_64/p4";
    sha256 = "1lzfi0w9xdl7ywl3wacw5mnb2kk1lsdrpjwxy49bxay1hyh0lnbr";
    executable = true;
  };

  unpackPhase = "true";
  dontBuild = true;
  nativeBuildInputs = [ makeWrapper ];

  ldLibraryPath = lib.makeLibraryPath [
      stdenv.cc.cc.lib
      openssl
  ];

  installPhase = ''
    mkdir -p $out/bin

    cp $src p4
    chmod +w p4
    patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" ./p4
    chmod -w p4
    cp p4 $out/bin/p4

    wrapProgram $out/bin/p4 \
      --suffix LD_LIBRARY_PATH : ${ldLibraryPath}
  '';

  meta = {
    description = "Perforce Client";
    homepage = https://www.perforce.com;
    license = stdenv.lib.licenses.unfreeRedistributable;
    platforms = [ "x86_64-linux" ];
  };
}
