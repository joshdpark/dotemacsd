(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(menu-bar-mode -1)
(tool-bar-mode -1)
(repeat-mode 1)
(electric-pair-mode 1)
(require 'ess-r-mode)
;; LSP
(setq read-process-output-max (expt 2 20)) ;; 1mb
(setq gc-cons-threshold (expt 2 24))
(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap
  (setq lsp-keymap-prefix "C-c l")
  :hook ((haskell-mode haskell-literate-mode) . lsp)
  :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(monstera))
 '(custom-safe-themes
   '("d652cb8c095485bee329ee0a34e4a28de77f7bfdd192b8934685dffa477c16fc" default))
 '(package-selected-packages '(company lsp-haskell lsp-ui lsp-mode flycheck slime ess)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
