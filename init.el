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

;; Meow setup
(defun meow-setup ()
  (meow-leader-define-key
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("/" . meow-keypad-describe-key))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("d" . meow-delete)
   '("D" . meow-backward-delete)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("f" . meow-find)
   '("g" . meow-cancel-selection)
   '("G" . meow-grab)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("m" . meow-join)
   '("n" . meow-search)
   '("o" . meow-block)
   '("O" . meow-to-block)
   '("p" . meow-yank)
   '("P" . meow-yank-pop)
   '("q" . meow-quit)
   '("Q" . meow-goto-line)
   '("r" . meow-replace)
   '("R" . meow-swap-grab)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("u" . meow-undo)
   '("U" . meow-undo-in-selection)
   '("v" . meow-visit)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("x" . meow-line)
   '("X" . meow-goto-line)
   '("y" . meow-save)
   '("Y" . meow-sync-grab)
   '("z" . meow-pop-selection)
   '("'" . repeat)
   '("}" . forward-paragraph)
   '("{" . backward-paragraph)
   '(")" . forward-sexp)
   '("(" . backward-sexp)
   ))

;; (use-package meow
;;   :config
;;   (meow-setup)
;;   (meow-global-mode))

;; figure out a way to use 'buffer-read-only as a hook
;; also don't want it in a 'comint-mode like a shell
(use-package ess)
(use-package corfu
  :init
  (global-corfu-mode))
(use-package vertico
  :config
  (vertico-mode))
(use-package magit)
;; (use-package haskell-mode)
(use-package pyvenv
  :init
  (setenv "WORKON_HOME" "~/.pyenv/versions"))
(use-package flymake
  :bind
  (:map flymake-mode-map
        (("M-n" . flymake-goto-next-error)
         ("M-p" . flymake-goto-prev-error))))
;; add ruff-lsp as python lsp server
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs
               '(python-mode
                 . ,(eglot-alternatives
                     '("pylsp" "ruff-lsp")))))

;;; Global settings
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(repeat-mode 1)                         ; allow for repeats certain commands
(auto-fill-mode 1)                      ; automatic line breaks
(column-number-mode 1)                  ; add column line to bottom of frame
(global-auto-revert-mode 1)             ; auto-revert files to saved
(setq-default fill-column 80)           ; automatically break lines after 80 columns
(setq-default indent-tabs-mode nil)     ; spaces for tabs
(setq inhibit-startup-screen 1)         ; disable startup screen
(setq confirm-kill-processes nil)       ; don't confirm kill process
(setq use-short-answers 1)              ; use y/n/p for answering questions
(setq tab-always-indent 'complete)      ; tab for indent and completion
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))) ; set backup dir
(add-to-list 'initial-frame-alist '(fullscreen . maximized)) ; set fullscreen
;; macos modifiers
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
;; set for lsp performance
(setq read-process-output-max (expt 2 20))
(setq gc-cons-threshold (expt 2 24))
;; set PATH to shell PATH
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))
;; set global keymap for 'other-window
(global-set-key (kbd "M-o") 'other-window)
;; set custom-file
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
(put 'upcase-region 'disabled nil)
