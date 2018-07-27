{ nixpkgs ? import <nixpkgs> {} }:
nixpkgs.callPackage ./derivation.nix {}
