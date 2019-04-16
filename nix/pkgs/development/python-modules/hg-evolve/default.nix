{ stdenv
, buildPythonPackage
, fetchPypi
, isPy3k
}:

buildPythonPackage rec {
  pname = "hg-evolve";
  version = "8.5.0";
  disabled = isPy3k;

  src = fetchPypi {
    inherit pname version;
    sha256 = "c7ef633c1ab9ef4ef9da8c74165a7b12daa32a38d6b3de9324ba4ce2b42ea126";
  };

  doCheck = false;

  meta = with stdenv.lib; {
    description = "evolve extension for Mercurial";
    homepage = "https://www.mercurial-scm.org/doc/evolution/";
    license = licenses.gpl2;
    priority = 0;
  };
    
}
