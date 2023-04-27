#!/usr/bin/env nix-shell
#! nix-shell -i bash -p nodePackages.node2nix

node2nix \
  --input node-packages.json \
  --output node-packages.nix \
  --composition node-composition.nix \
  --node-env node-env.nix \
  --nodejs-18
