{ stdenv, buildGoModule, fetchgit }:

buildGoModule rec {
  name = "evans-${version}";
  version = "0.7.3";
  rev = "58f5702b907cddb9ce138781fbc33a468c0b834d";
  goPackagePath = "github.com/ktr0731/evans";

  src = fetchgit {
    inherit rev;
    url = "https://github.com/ktr0731/evans.git";
    sha256 = "0x2ylim3358xhvj7mqvy5n441nwwbrb2jfr2vjaxlljl4qdl4hzj";
  };

  modSha256 = "107njq7sl48mm4c37ps3d9353pm4k07870xg603hzglwi5bcj6p4";

  subPackages = ["."];
}
