(use-package rg
  :straight t
  :ensure-system-package (rg . ripgrep)
  :bind-keymap ("M-s" . rg-global-map)
  :bind (:map rg-global-map
              ("b" . rg-buffer-name-project-dir))
  :config
  (setq rg-group-result t)
  (setq rg-show-columns t)

  (rg-define-search rg-buffer-name-project-dir
    "Search for buffer name (without extension) under the project
root directory."
    :query (file-name-sans-extension (buffer-name))
    :format literal
    :dir project))
