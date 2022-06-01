with (import <nixpkgs> {});
let
  basePackages = [
	pkgs.bashInteractive
	git
	direnv

	ocaml
    	ocamlformat
	opam
	dune_2
    	ocamlPackages.dune-release
    	ocamlPackages.ocp-indent
    	ocamlPackages.utop
    	ocamlPackages.merlin
        ocamlPackages.menhir
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
    eval $(opam env)
  '';
}
