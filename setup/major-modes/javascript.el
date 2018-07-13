(use-package js2-mode
  :straight t
  :mode "\\.js\\'"
  :interpreter "node"
  :init
  (with-eval-after-load 'restclient
    (add-to-list 'restclient-content-type-modes '("application/js" . js2-mode))))

(use-package json-mode
  :straight (json-mode :type git :host github :repo "MetaDark/json-mode"
                       :upstream (:host github :repo "joshwnj/json-mode"))
  :defer t
  :init
  (with-eval-after-load 'restclient
    (add-to-list 'restclient-content-type-modes '("application/json" . json-mode))))

(use-package tern
  :straight t
  :ensure-system-package (tern . "npm i -g tern")
  :after js2-mode
  :diminish " ◎"
  :hook (js2-mode . tern-mode)
  :config
  (defun tern-setup-project-browser ()
    "Setup a new browser tern project"
    (interactive)
    (let ((source (concat dir/conf "browser.tern-project"))
          (dest (concat default-directory ".tern-project")))
      (copy-file source dest)
      (find-file dest)))

  (defun tern-setup-project-node ()
    "Setup a new node.js tern project"
    (interactive)
    (let ((source (concat dir/conf "node.tern-project"))
          (dest (concat default-directory ".tern-project")))
      (copy-file source dest)
      (find-file dest))))

(use-package company-tern
  :straight t
  :after (company tern)
  :defer t
  :init
  (add-to-list 'company-backends 'company-tern))
