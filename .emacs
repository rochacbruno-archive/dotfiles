(add-to-list 'load-path "~/.emacs.d/")

;; Setup the basic font Consolas
;; (set-face-font 'default "-microsoft-Consolas-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;;; TO select another themes
(add-to-list 'load-path "~/.emacs.d/themes/")
(setq load-dangerous-libraries t)
(require 'color-theme)
(require 'color-theme-molokai)
(require 'color-theme-orico-black)
(color-theme-molokai)
(color-theme-initialize)

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
(epy-setup-checker "pyflakes %f")
(epy-django-snippets)
(epy-setup-ipython)

(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)


;;; load git-gutter
;; (add-to-list 'load-path "~/.emacs.d/emacs-git-gutter/")
;; (require 'git-gutter)
;; (add-to-list 'load-path "~/.emacs.d/fringe-helper.el/")
;; (require 'fringe-helper)
;; (add-to-list 'load-path "~/.emacs.d/emacs-git-gutter-fringe/")
;; (require 'git-gutter-fringe)
;; (setq git-gutter-fr:side 'right-fringe)
;; (global-git-gutter-mode +1)
;; (add-hook 'python-mode-hook 'git-gutter-mode)

;;; emacs nav
(add-to-list 'load-path "~/.emacs.d/emacs-nav")
(require 'nav)
(nav-disable-overeager-window-splitting)
(global-set-key [f8] 'nav-toggle)


;;; set line numbers and column number in status bar
(global-linum-mode 1)
(line-number-mode t)
(column-number-mode 1)
(setq line-number-display-limit 1000000)
(setq linum-format "%d ")

;;; disable auto pairing parentesis
(setq skeleton-pair nil)


;;; set 80 limit line marker
(require 'vline)
(require 'fill-column-indicator)
(setq fci-rule-width 1)
(setq fci-rule-color "darkblue")
(setq-default fci-rule-column 80)
(setq fci-handle-truncate-lines nil)
(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
(defun auto-fci-mode (&optional unused)
   (if (> (window-width) fci-rule-column)
      (fci-mode 1)
      (fci-mode 0))
 )
(add-hook 'after-change-major-mode-hook 'auto-fci-mode)
(add-hook 'window-configuration-change-hook 'auto-fci-mode)

;;; clean whitespaces on save
(add-hook 'write-file-hooks 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'whitespace-cleanup)
;;(require-final-newline t)
(iswitchb-mode t)

;; Frame navigation alt + [arrow keys]
(windmove-default-keybindings 'meta)

;; scroll one line at a time (less "jumpy" than defaults)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
;; (setq mouse-wheel-progressive-speed nil)            ;; don't accelerate scrolling
;; (setq mouse-wheel-follow-mouse 't)                  ;; scroll window under mouse
(setq scroll-step 1)                                ;; keyboard scroll one line at a time

;;; enable IDO
(require 'ido)
(ido-mode t)

;;; better shell colors
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; disable backups
(setq make-backup-file nil)
(setq make-backup-files nil)
(setq auto-save-default nil)

;;; disable default startup message
(setq inhibit-startup-message t)

;;; disable menu bar
(menu-bar-mode 0)

;;; change yes-or-no to simply y or n
(fset 'yes-or-no-p 'y-or-n-p)

;;; key bindings

(global-set-key (kbd "C-c u") 'undo)
(global-set-key (kbd "C-c i") 'indent-region)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-q") 'query-replace)
(global-set-key (kbd "C-c q") 'query-replace-regexp)
(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-r") 'isearch-backward)
(global-set-key (kbd "C-c s") 'isearch-forward-regexp)
(global-set-key (kbd "C-c r") 'isearch-backward-regexp)
(global-set-key (kbd "C-c n") 'comment-region)
(global-set-key (kbd "C-c m") 'uncomment-region)
(global-set-key (kbd "C-x C-k") 'kill-buffer)
(global-set-key (kbd "C-c f") 'load-file)
(global-set-key (kbd "C-c C-f") 'load-file)
(global-set-key (kbd "C-c C-v") 'shell)


;; ecb alternative ('C-c s' - to run)
(custom-set-variables
 '(speedbar-mode-specific-contents-flag t)
 '(speedbar-show-unknown-files t)
 '(speedbar-use-images nil))
(require 'sr-speedbar)
(global-set-key (kbd "C-c s") 'sr-speedbar-toggle)

;;; package manager
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
(package-initialize))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))


;;; web mode for templates
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))