{ pkgs
, pythonPackages
, stdenv
}:

let
  callPackage = pkgs.lib.callPackageWith ( pkgs // pythonPackages // self );
  self = {
    hg-evolve = callPackage ./pkgs/development/python-modules/hg-evolve {};
  };
in self
