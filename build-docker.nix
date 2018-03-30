{ pkgs   ? import <nixpkgs> {}
}:

# Todo: this script should build a docker image seeded with all
# compile-o-rama packages.
#
# The following points to the recipe for such a script:
# http://lethalman.blogspot.de/2016/04/cheap-docker-images-with-nix_15.html
# and additional examples can be found here:
# https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/docker/examples.nix