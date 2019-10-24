{ pkgs, ... }:
{
  vale = pkgs.callPackage ./vale.nix {};
}
