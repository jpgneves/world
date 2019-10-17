{ stdenv, buildGoModule, fetchgit }:

buildGoModule rec {
  name = "evans-${version}";
  version = "0.8.2";
  rev = "2a87ba810ec90fa61d947f703595a1e870534f08";
  goPackagePath = "github.com/ktr0731/evans";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/ktr0731/evans.git";
    sha256 = "0di83lbjafsy1c58xxpq1y70rnar540n5291mv6xzkhynrrcicby";
  };

  modSha256 = "1b5cxh44qsvs5isz4k7vvq2pqb8hrfq98wh7f80hfsnxh3xsxb6k";

  subPackages = ["."];
}
