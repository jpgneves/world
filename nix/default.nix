{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  callPackage = pkgs.lib.callPackageWith (pkgs // self);
  self = {
       weechat = pkgs.weechat.override {
         configure = { availablePlugins, ...}: {
           plugins = with availablePlugins; [
             (python.withPackages (ps: with ps; [websocket_client]))
           ];
         };
       };
       emacs = callPackage ./pkgs/applications/editors/emacs {};
       p4 = callPackage ./pkgs/applications/version-management/p4 {};
       opensnitch = callPackage ./pkgs/applications/networking/opensnitch {};
       bingo = callPackage ./pkgs/development/tools/bingo {};
       evans = callPackage ./pkgs/development/tools/evans {};
       janet = callPackage ./pkgs/development/interpreters/janet {};
       janetsh = callPackage ./pkgs/shells/janetsh {
               janet = self.janet;
       };
       python27Packages = callPackage ./python-packages.nix {
         pythonPackages = pkgs.python27Packages;
       };
       adaPackages = callPackage ./ada-packages.nix {};
       gnat = callPackage ./pkgs/development/tools/gnat {};
       gprbuild = callPackage ./pkgs/development/tools/gprbuild {
         xmlada = self.adaPackages.xmlada;
         gnat = self.gnat;
       };
       kustomize = callPackage ./pkgs/applications/networking/cluster/kustomize {};
  };
in
  self
