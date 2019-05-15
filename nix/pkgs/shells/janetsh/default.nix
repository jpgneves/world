{ stdenv, lib, fetchgit, janet }:

let
  version = "dev";
in
stdenv.mkDerivation {
     name = "janetsh-${version}";

     buildInputs = [ janet ];

     src = fetchgit {
         url = "https://github.com/andrewchambers/janetsh.git";
         rev = "e635bfb84da1d4e3b5308c429e70206e6bdb1dba";
         sha256 = "0jsmb917711ligpvmddawxrhsj8lvw94jfr473syq31l1jhpdjg9";
     };

     meta = {
        description = "Janetsh";
        license = lib.licenses.mit;
     };

     passthru = {
        shellPath = "/bin/janetsh";
     };
}
