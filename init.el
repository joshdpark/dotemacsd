(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)        ; Unless "use-package" is installed, install "use-package"
  (package-install 'use-package))
(require' use-package)
;; Make sure packages are downloaded and installed before they are run
;; also frees you from having to put :ensure t after installing EVERY PACKAGE.
(setq use-package-always-ensure t)

;; figure out a way to use 'buffer-read-only as a hook
;; also don't want it in a 'comint-mode like a shell
(use-package ido
  :init
  (ido-mode))
(use-package corfu
  :init
  (global-corfu-mode))
(use-package cape
    :bind (("C-c p p" . completion-at-point) ;; capf
         ("C-c p t" . complete-tag)        ;; etags
         ("C-c p d" . cape-dabbrev)        ;; or dabbrev-completion
         ("C-c p h" . cape-history)
         ("C-c p f" . cape-file)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-elisp-symbol)
         ("C-c p e" . cape-elisp-block)
         ("C-c p a" . cape-abbrev)
         ("C-c p l" . cape-line))
    :init
    (add-to-list 'completion-at-point-functions #'cape-dabbrev)
    (add-to-list 'completion-at-point-functions #'cape-file))
(use-package vertico
  :config
  (vertico-mode))
(use-package magit)
(use-package pyvenv
  :init
  (pyvenv-mode))
(use-package flymake
  :bind
  (:map flymake-mode-map
        (("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error))))
(use-package zig-mode)

;; cc-mode
(add-hook 'c-mode-common-hook
          (lambda ()
            (setq-default c-basic-offset 4)
            (setq-default c-default-style '(other. "stroustrup"))
            (setq show-trailing-whitespace t)
            ))

;;; Global settings
(tool-bar-mode -1)                            ; remove the tool bar
(add-hook 'text-mode-hook 'turn-on-auto-fill) ; automatic line breaks
(repeat-mode 1)                     ; allow for repeats certain commands
(column-number-mode 1)              ; add column line to bottom of frame
(global-auto-revert-mode 1)         ; auto-revert files to saved
(setq backup-by-copying t)          ; backup by moving actual file
(setq-default fill-column 80)       ; automatically break lines after 80 columns
(setq-default indent-tabs-mode nil) ; spaces for tabs
(setq-default pixel-scroll-precision-mode t) ; better scrolling
(setq inhibit-startup-screen 1)              ; disable startup creen
(setq confirm-kill-processes nil)            ; don't confirm kill process
(setq use-short-answers 1)                   ; use y/n/p for answering questions
(setq tab-always-indent 'complete)           ; tab for indent and completion
(setq sentence-end-double-space nil)         ; sentence ends with one space
(setq backup-directory-alist
      '(("." . "~/.emacs.d/backup")))   ; set backup dir
(setq backup-by-copying t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; macos modifiers
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
;; set for lsp performance
(setq read-process-output-max (expt 2 20))
(setq gc-cons-threshold (expt 2 24))
;; set PATH to shell PATH
(use-package exec-path-from-shell
  :config
  (setq exec-path-from-shell-arguments nil)
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))) 

(global-set-key (kbd "M-o") 'other-window)         ; keymap for 'other-window
(global-set-key (kbd "C-S-j") 'set-mark-command)   ; easier way to set mark
(global-set-key (kbd "C-S-h") 'help-command)       ; remap help prefix

;; use modus themes
(setq modus-themes-bold-constructs t
      modus-themes-italic-constructs t)
(require-theme 'modus-themes)
(load-theme 'modus-operandi)

;; set custom-file
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
;; disabling advanced features
(put 'upcase-region 'disabled nil)

