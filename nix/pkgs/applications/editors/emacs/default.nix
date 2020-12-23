{ pkgs }:

let
  myEmacs = pkgs.emacs;
  emacsWithPackages = (pkgs.emacsPackagesNgGen myEmacs).emacsWithPackages;
in
  emacsWithPackages (epkgs: (with epkgs.melpaStablePackages; [
    nix-mode
    go-mode
    rust-mode
    company-lsp
    gruvbox-theme
    use-package
    tide
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
    utop
  ]) ++ (with epkgs.melpaPackages; [
    elixir-mode
    lsp-mode
    lsp-ui
    lsp-haskell
    futhark-mode
    dhall-mode
    powershell
    protobuf-mode
    merlin
    ])
  )
