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
    bazel-mode
    company-lsp
    gruvbox-theme
    use-package
    tide
    typescript-mode
    direnv
    ]) ++ (with epkgs.melpaPackages; [
    lsp-ui
    futhark-mode
    ])
  )
