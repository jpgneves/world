{ stdenv, fetchFromGitHub, buildGoPackage }:

buildGoPackage rec {
  pname = "velero";
  version = "v1.2.0";

  goPackagePath = "github.com/vmware-tanzu/velero";

  srcs = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "velero";
    rev = "${version}";
    sha256 = "1lc3a22ql9l0fx9gd0d4g6wc9cah2adjdga3mi4vcavm5n5dmvbp";
  };

}
