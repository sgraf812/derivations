{ stdenv, fetchzip, makeWrapper, jre8 }:

stdenv.mkDerivation rec {
  name    = "ycomp-${version}";
  version = "1.3.19";

  src = fetchzip {
    url    = "http://pp.ipd.kit.edu/firm/download/yComp-${version}.zip";
    sha256 = "0aakjacc0cb3mz1vnk2bxi8b5qz32rnj9imb3ycgwjsk5rmwxmr0";
  };

  nativeBuildInputs = [ makeWrapper ];

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin
    cp ${src}/* $out/bin/
    chmod +x $out/bin/ycomp
    wrapProgram $out/bin/ycomp --prefix PATH ":" ${jre8}/bin ;
  '';
}
