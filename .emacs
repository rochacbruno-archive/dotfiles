(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(load-file "/home/rochacbruno/.emacs.d/emacs-for-python/epy-init.el")
(epy-setup-checker "pyflakes %f")
(epy-django-snippets)
(epy-setup-ipython)
(require 'highlight-indentation)
(add-hook 'python-mode-hook 'highlight-indentation)
(add-to-list 'load-path "/home/rochacbruno/.emacs.d/emacs-nav")
(require 'nav)
(nav-disable-overeager-window-splitting)
(global-set-key [f8] 'nav-toggle)
(global-linum-mode 1)
(column-number-mode 1)
;;; disable auto pairing parentesis
(setq skeleton-pair nil)

(require 'ido)
(ido-mode t)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq make-backup-file nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(menu-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(setq linum-format "%d ")

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

;;; (defun toggle-margin-right ()
;;;   "Toggle the right margin between `fill-column' or window width.
;;; This command is convenient when reading novel, documentation."
;;;  (interactive)
;;;  (if (eq (cdr (window-margins)) nil)
;;;      (set-window-margins nil 0 (- (window-body-width) fill-column))
;;;    (set-window-margins nil 0 0) ) )


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.

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

;; (load-file "~/.emacs.d/themes/zenburn-theme.el")