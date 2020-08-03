{ stdenv, pkgs, fetchgit }:

stdenv.mkDerivation rec {
  name = "libkqueue";

  nativeBuildInputs = [ pkgs.cmake ];

  cmakeFlags = [ '-G "Unix Makefiles"' "-DCMAKE_INSTALL_PREFIX=/usr" "-DCMAKE_INSTALL_LIBDIR=lib" ];

  src = fetchgit {
    url = "https://github.com/mheily/libkqueue";
    rev = "b062c15578b270a203476434028c20f0a53bd583";
    sha256 = "0di60mmyvrfnffgjwks9lj06s18mj9i6hj0p1wpk0s52gkiiyvf2";
  };
}
