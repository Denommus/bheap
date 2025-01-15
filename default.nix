{
  buildDunePackage,
  melange,
}:
buildDunePackage {
  pname = "bheap";
  version = "2.0.0";

  src = ./.;

  minimalOCamlVersion = "5.2";

  nativeBuildInputs = [ melange ];

  doCheck = false;
}
