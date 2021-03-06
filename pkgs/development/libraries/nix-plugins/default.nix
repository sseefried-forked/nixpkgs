{ stdenv, fetchFromGitHub, nix, cmake, pkgconfig, boost }:
let version = "4.0.2"; in
stdenv.mkDerivation {
  name = "nix-plugins-${version}";

  src = fetchFromGitHub {
    owner = "shlevy";
    repo = "nix-plugins";
    rev = version;
    sha256 = "0cr1lz788rw7kxfs2acplhdl5cv8qrfh4kdqxi0p63ajnd303k8c";
  };

  nativeBuildInputs = [ cmake pkgconfig ];

  buildInputs = [ nix boost ];

  meta = {
    description = "Collection of miscellaneous plugins for the nix expression language";
    homepage = https://github.com/shlevy/nix-plugins;
    license = stdenv.lib.licenses.mit;
    platforms = stdenv.lib.platforms.all;
  };
}
