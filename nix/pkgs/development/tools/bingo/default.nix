{ stdenv, buildGoModule, fetchgit }:

buildGoModule rec {
  name = "bingo-${version}";
  version = "76bcd77";
  rev = "76bcd777316dde1684ff59793f695e4337c0e62a";
  goPackagePath = "github.com/saibing/bingo";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/saibing/bingo.git";
    sha256 = "1nwcnqg48nbljhbfr9mfcx7q9qz5hcqd9cd9fb5dfa2xbv6934y4";
  };

  modSha256 = "0qp0pqrwqafykyya9yzv2nqglm6989d65v14d876fq4ixfpd1pif";

  subPackages = [ "." ];
}
