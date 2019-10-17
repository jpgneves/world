{ stdenv, fetchFromGitHub, lib, pkgs, xmlada, gnat }:

let
  gccWithAda = pkgs.gcc-unwrapped.overrideAttrs (oldAttrs: rec {
    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ gnat ];
    configureFlags = (lib.lists.remove "--enable-languages=c\,c++" oldAttrs.configureFlags) ++ [ "--enable-languages=ada" "--enable-libada" ];
    });
  myStdEnv = stdenv.override { cc = gccWithAda; };
in
  myStdEnv.mkDerivation rec {
  pname = "gprbuild";
  version = "19.2";

  nativeBuildInputs = [ pkgs.which gnat gccWithAda ];

  src = fetchFromGitHub {
    owner = "AdaCore";
    repo = "${pname}";
    rev = "${version}";
    sha256 = "0085gsnwqak37mzfg1hss9719wj79y1lip49vj5in8cj7yicaxl1";
  };

  configureScript = ''
    ./bootstrap.sh --with-xmlada=${xmlada.src} --prefix=./bootstrap
  '';

  meta = with stdenv.lib; {
    description = "GPRbuild is an advanced build system designed to help automate the construction of multi-language systems.";
    license = stdenv.lib.licenses.gpl3;
    platforms = platforms.all;
    maintainers = with stdenv.lib.maintainers; [ ];
  };

}
