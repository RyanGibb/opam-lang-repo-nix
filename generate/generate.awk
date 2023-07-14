
{
	opam_name = "nix-" $1
	name_name = $2
	package_version = $3
	git_revision = $4

	dir_path = "packages/" opam_name "/" opam_name "." package_version
	file_path = dir_path "/opam"

    content = "opam-version: \"2.0\"\n" \
              "install: [\n" \
              "  \"nix-env\"\n" \
              "  \"-iA\"\n" \
              "  \"rustc\"\n" \
              "  \"-f\"\n" \
              "  \"https://github.com/NixOS/nixpkgs/archive/" git_revision ".tar.gz\"\n" \
              "]"

	system("mkdir -p " dir_path)
	print content > file_path
}
