;; NOTE: I never actually use this, is it worth keeping?
(straight-use-package 'helm)
(straight-use-package 'helm-dash)

(require 'helm-config)

(global-set-key (kbd "s-.") 'helm-dash-at-point)
