{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    nix-mode
    go-mode
    protobuf-mode
    rust-mode
    lsp-mode
    company-lsp
    gruvbox-theme
    use-package
    ]) ++ (with epkgs.melpaPackages; [
    lsp-ui
    futhark-mode
    ])
  )
