{ pkgs ? import <nixpkgs> {} }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    nix-mode
    go-mode
    rust-mode
    lsp-mode
    bazel-mode
    company-lsp
    gruvbox-theme
    use-package
    tide
    toml-mode
    tuareg
    typescript-mode
    web-mode
    yaml-mode
    direnv
    dante
    haskell-mode
    erlang
    yasnippet
    reason-mode
    emojify
    ]) ++ (with epkgs.melpaPackages; [
    lsp-ui
    futhark-mode
    dhall-mode
    ])
  )
