{ pkgs   ? import <nixpkgs> {}
}:

rec {

  # C/C++/Rust
  clang = pkgs.clang_39;
  gcc = pkgs.gcc;
  rust = pkgs.rustc;

  # Functional languages
  mlton = pkgs.mlton;
  ocaml = pkgs.ocaml;
  chez = pkgs.chez;
  ghc = pkgs.ghc;
  scala = pkgs.scala;
#  Do not yet bulid on Mac OS
#  coreclr = pkgs.coreclr;
#  racket = pkgs.pltScheme;
#  manticore = pkgs.manticore;
#  todo: multimlton, java

  # Distributed-memory language support
#  Do not yet bulid on Mac OS
#  hpx = pkgs.hpx;
# We may need to write our own nix build scripts for these
# packages:
#   ocr, chapel, charm++

}