(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

(add-to-list 'load-path "/Users/mburge/repos/julia-emacs")
(require 'julia-mode)

(use-package vterm
  :ensure t)
(use-package julia-repl
  :ensure t)
(require 'julia-repl)
(add-hook 'julia-mode-hook 'julia-repl-mode)
;; (setq python-shell-interpreter "/opt/local/bin/python3.9")

(load-file "/Users/mburge/.emacs.d/leafy.el")
(add-to-list 'load-path "/Users/mburge/repos/leafy")
(require 'leafy)

;; (load-file "/Users/mburge/repos/leafy/leafy.el")

;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'leafy-mode-hook #'leafy-enable-mode-line)
(add-hook 'org-mode-hook #'leafy-mode)

;; https://github.com/susam/emacs4cl
(when (display-graphic-p)
  (tool-bar-mode 0)
  (scroll-bar-mode 0))
(setq inhibit-startup-screen t)
(load-theme 'wombat)
(set-face-background 'default "#111")
(setq-default indent-tabs-mode nil)
(setq show-paren-delay 0)
(show-paren-mode)
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file t)
(dolist (package '(sly paredit rainbow-delimiters))
  (unless (package-installed-p package)
    (package-install package)))
(add-to-list 'exec-path "/usr/local/bin")
(setq inferior-lisp-program "sbcl")
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook 'enable-paredit-mode)
(add-hook 'ielm-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
;; (add-hook 'slime-repl-mode-hook 'enable-paredit-mode)
;; (add-hook 'sly-repl-mode-hook 'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'ielm-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-interaction-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'slime-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'sly-repl-mode-hook 'rainbow-delimiters-mode)
(require 'rainbow-delimiters)
(set-face-foreground 'rainbow-delimiters-depth-1-face "#c66")  ; red
(set-face-foreground 'rainbow-delimiters-depth-2-face "#6c6")  ; green
(set-face-foreground 'rainbow-delimiters-depth-3-face "#69f")  ; blue
(set-face-foreground 'rainbow-delimiters-depth-4-face "#cc6")  ; yellow
(set-face-foreground 'rainbow-delimiters-depth-5-face "#6cc")  ; cyan
(set-face-foreground 'rainbow-delimiters-depth-6-face "#c6c")  ; magenta
(set-face-foreground 'rainbow-delimiters-depth-7-face "#ccc")  ; light gray
(set-face-foreground 'rainbow-delimiters-depth-8-face "#999")  ; medium gray
(set-face-foreground 'rainbow-delimiters-depth-9-face "#666")  ; dark gray
