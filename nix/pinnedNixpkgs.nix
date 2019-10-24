let
  spec = builtins.fromJSON ''
    {
       "owner": "NixOS",
       "repo": "nixpkgs",
       "rev": "2e6277f1794f56222aae164311005b7e372a38e0",
       "sha256": "0prrjn3zj064jkc7msdi072dyjvsqd1ibn9bbsxscar6vk9n1y7w"
    }
  '';
  url = "https://github.com/${spec.owner}/${spec.repo}/archive/${spec.rev}.tar.gz";
in
  builtins.fetchTarball { url = url; sha256 = spec.sha256; }
