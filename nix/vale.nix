{
  stdenv,
  vale
}:
  stdenv.mkDerivation rec {
    name = "diss-vale";
    src = ./..;
    buildInputs = [ vale ];

    buildPhase = ''
      rm -f vale.log
      vale --glob='*.tex' $src | tee -a vale.log
    '';

    installPhase = ''
      mkdir -p $out
      cp vale.log $out
    '';
  }
