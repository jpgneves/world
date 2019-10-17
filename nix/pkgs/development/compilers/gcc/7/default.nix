{ stdenv, pkgs }:

let
  self = pkgs.gcc-unwrapped.override { langC = false; };
in
  self
