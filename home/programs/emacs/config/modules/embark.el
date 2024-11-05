(use-package embark
  :bind*
  (("C-." . embark-act)
   ("C-," . embark-dwim)
   ("C-h B" . embark-bindings)

   :map embark-file-map
   ("s" . sudo-edit-find-file)

   :map embark-identifier-map
   ("RET" . embark-find-definition)
   ("d" . embark-find-definition)
   ("h" . embark-show-documentation)
   ("r" . embark-rename)
   ("s" . embark-find-references)
   ("x" . embark-execute)
   ("I" . info-lookup-symbol)

   :map embark-symbol-map
   ("s" . embark-find-references)
   ("I" . embark-info-lookup-symbol))

  :config
  (defun embark-find-definition (thing)
    (cond
     ((bound-and-true-p lsp-bridge-mode) (lsp-bridge-find-def))
     (t (xref-find-definitions thing))))

  (defun embark-show-documentation (thing)
    (cond
     ((bound-and-true-p lsp-bridge-mode) (lsp-bridge-show-documentation))
     (t (display-local-help))))

  (defun embark-rename (thing)
    (cond
     ((bound-and-true-p lsp-bridge-mode) (lsp-bridge-rename))
     (t (call-interactively #'vr/query-replace))))

  (defun embark-find-references (thing)
    (cond
     ((bound-and-true-p emacs-lisp-mode) (project-consult-ripgrep nil thing))
     ((bound-and-true-p lsp-bridge-mode) (lsp-bridge-find-references))
     (t (project-consult-ripgrep nil thing))))

  (defun embark-execute (thing)
    (cond
     ((bound-and-true-p lsp-bridge-mode) (lsp-bridge-code-action))))

  (add-to-list 'embark-pre-action-hooks
   '(embark-find-definition embark-evil-set-jump))

  (cl-defun embark-evil-set-jump (&key bounds &allow-other-keys)
    (evil-set-jump)))
