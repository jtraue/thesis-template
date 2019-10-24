{ nixpkgs ? import ./pinnedNixpkgs.nix
, pkgs ? import nixpkgs {}
}:
{
  pdf = pkgs.callPackage ./make_pdf.nix {};
  lint = pkgs.callPackage ./lint.nix {};
}
