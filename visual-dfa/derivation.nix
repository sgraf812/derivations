{ stdenv, fetchFromGitHub, makeWrapper, jdk, maven }:

stdenv.mkDerivation rec {
  name    = "visual-dfa-${version}";
  version = "0.0.1-SNAPSHOT";

  src = fetchFromGitHub {
    owner = "ppati000";
    repo = "visualDFA";
    rev = "1aeb1770aecb2b9690cc24b4ae3d3759f5ff75f4";
    sha256 = "0nb0cv8cgjsmpppvlbfizfayd6vs9f0f7w3fzbxb2svf5y191wa3";
  };

  nativeBuildInputs = [ makeWrapper maven ];

  installPhase = ''
    mkdir -p $out/bin/dfa/analyses
    cd $(mktemp -d)
    cp -r --no-preserve=mode,ownership,timestamp ${src}/Implementierung/visual-dfa .
	cd visual-dfa
    mvn compile assembly:single
    cp target/visual-dfa-${version}-jar-with-dependencies.jar $out/bin/visual-dfa.jar
    shopt -s extglob
	cp target/classes/dfa/analyses/!(*Dummy*)*.class $out/bin/dfa/analyses
    echo "#! ${stdenv.shell}" >> $out/bin/visual-dfa
    echo "java -Dswing.defaultlaf=javax.swing.plaf.metal.MetalLookAndFeel -jar $out/bin/visual-dfa.jar" >> $out/bin/visual-dfa
    chmod +x $out/bin/visual-dfa
    wrapProgram $out/bin/visual-dfa --prefix PATH ":" ${jdk}/bin ;
  '';
}
