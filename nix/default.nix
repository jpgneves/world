{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  callPackage = pkgs.lib.callPackageWith (pkgs // self);
  self = {
       emacs = callPackage ./pkgs/applications/editors/emacs {};
       p4 = callPackage ./pkgs/applications/version-management/p4 {};
       opensnitch = callPackage ./pkgs/applications/networking/opensnitch {};
       bingo = callPackage ./pkgs/development/tools/bingo {};
       gotools = callPackage ./pkgs/development/tools/go-tools {};
       python27Packages = callPackage ./python-packages.nix {
         pythonPackages = pkgs.python27Packages;
       };
  };
in
  self
