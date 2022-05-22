with (import <nixpkgs> {});
let
  basePackages = [
	pkgs.bashInteractive
	git
	direnv

	ocaml
	opam
	dune_2
    ocamlPackages.dune-release
    ocamlPackages.merlin
    ocamlformat
    ocamlPackages.ocp-indent
    ocamlPackages.utop
  ];

  inputs = basePackages
    ++ lib.optional stdenv.isLinux inotify-tools
    ++ lib.optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
        CoreFoundation
        CoreServices
      ]);

in mkShell {
  buildInputs = inputs;
	shellHook =
  ''
  '';
}
