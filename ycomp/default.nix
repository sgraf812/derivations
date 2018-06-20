{ stdenv, fetchzip, makeWrapper, jre }:

stdenv.mkDerivation rec {
  name    = "ycomp-${version}";
  version = "1.3.19";

  src = fetchzip {
    url    = "http://pp.ipd.kit.edu/firm/download/yComp-${version}.zip";
    sha256 = "cc4f93fb368fa0bfec88328c410d98b0fa1418a251d3f252fa037e3df547a53b";
  };

  nativeBuildInputs = [ makeWrapper ];

  phases = "installPhase";

  installPhase = ''
    mkdir -p $out/bin
    cp ${src}/* $out/bin/
    chmod +x $out/bin/ycomp
    wrapProgram $out/bin/ycomp --prefix PATH ":" ${jre}/bin ;
  '';
}
