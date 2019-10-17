{ pkgs
, stdenv
}:

let
  callPackage = pkgs.lib.callPackageWith ( pkgs // self );
  self = {
    xmlada = callPackage ./pkgs/development/ada-modules/xmlada {};
  };
in self
