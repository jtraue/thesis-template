{ stdenv
, texlive
, glibcLocales
}:
let
  f = builtins.foldl' (set: pkgname: set // { "${pkgname}" = texlive."${pkgname}"; }) {};
  latex = texlive.combine (
    {
      inherit (texlive)
        latexmk
        xetex
        biber

        scheme-basic

        acronym
        amsfonts
        amsmath
        babel
        biblatex
        booktabs
        caption
        colortbl
        csquotes
        ellipsis
        etoolbox
        float
        inconsolata
        listings
        mathdesign
        microtype
        natbib
        pdfsync
        pgf
        placeins
        setspace
        tikz-timing
        titlesec
        todonotes
        url
        xcolor
        koma-script

        babel-german
        fontspec
        xpatch
        logreq
        ec
        bigfoot
        xstring
        ;
    }
  );
in
stdenv.mkDerivation rec {
  name = "thesis";
  src = ./..;
  buildInputs = [ latex glibcLocales ];

  preBuild = "export HOME=$PWD";

  installPhase = ''
    mkdir -p $out
    cp thesis.pdf $out/${name}.pdf
  '';
}
