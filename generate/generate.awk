
{
	opam_name = "nix-" $1
	nix_name = $2
	package_version = $3
	git_revision = $4

	dir_path = "packages/" opam_name "/" opam_name "." package_version
	file_path = dir_path "/opam"

    # TODO add variants to support a package version being provided by multiple instance of Nixpkgs
    content = "opam-version: \"2.0\"\n" \
              "depends: [\n" \
              "  \"nixpkgs\" {= \"" git_revision "\" }\n" \
              "]\n" \
              "install: [\n" \
              "  \"nix-env\"\n" \
              "  \"-iA\"\n" \
              "  \"" nix_name "\"\n" \
              "  \"-f\"\n" \
              "  \"https://github.com/NixOS/nixpkgs/archive/" git_revision ".tar.gz\"\n" \
              "]"

	system("mkdir -p " dir_path)
	print content > file_path



	dir_path = "packages/nixpkgs/nixpkgs." git_revision
	file_path = dir_path "/opam"

    content = "opam-version: \"2.0\"\n" \
              "conflict-class: \"nixpkgs\""

	system("mkdir -p " dir_path)
    if (system("test -f " file_path) != 0)
	    print content > file_path
}
