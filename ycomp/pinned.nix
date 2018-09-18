import ./default.nix {
  nixpkgs = import (builtins.fetchGit {
    name = "nixos-18.03-2018-09-18";
    url = https://github.com/nixos/nixpkgs-channels/;
    # Commit hash for nixos-18.03 as of 2018-09-18
    # `git ls-remote https://github.com/nixos/nixpkgs-channels nixos-18.03`
    ref = "nixos-18.03";
    rev = "01f5e794913a18494642b5f237bd76c054339d61";
  }) { };
}
