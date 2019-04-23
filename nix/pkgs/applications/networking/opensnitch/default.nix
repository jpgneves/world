{ stdenv, fetchgit, buildGoPackage, pkgs }:

with pkgs;
let
  pythonPackages = pp: with pp; [ grpcio-tools ];
  python3WithPackages = python3.withPackages pythonPackages;
in buildGoPackage rec {
  name = "opensnitch-${version}";
  version = "dev";
  rev = "5c8f7102c29caf94e967f8433a68b861a4b1666f";
  goPackagePath = "github.com/evilsocket/opensnitch";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/evilsocket/opensnitch.git";
    sha256 = "14gzzy35idzanm6c8hsziv31c6l52hrp5wxcc51w50mrd2axsw25";
  };

  goDeps = ./dependencies.nix;

  buildInputs = [ dep
                  libnetfilter_queue
                  libnfnetlink
                  pkg-config
                  python3WithPackages
                ];

}
