{ stdenv, fetchgit }:

stdenv.mkDerivation rec {
  pname = "xmlada";
  version = "19.2";

  src = fetchgit {
    rev = "refs/heads/${version}";
    url = "https://github.com/AdaCore/xmlada.git";
    sha256 = "1k8r3cm6qpk59x8kddn7y2nhacw9vw4gfv8569gv19d9nvwzb1kh";
  };

  configureScript = ''
    sh ./configure
  '';
  
  meta = with stdenv.lib; {
    description = "XML/Ada: A XML parser for Ada95";
    license = stdenv.lib.licenses.gpl3;
    platforms = platforms.all;
    maintainers = with stdenv.lib.maintainers; [ ];
  };

}
