;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "smo"
      user-mail-address "scottscmo@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq
     doom-font (font-spec :family "Monaco Nerd Font Mono" :size 11)
     ;; doom-font (font-spec :family "Dank Mono" :size 12)
     doom-theme 'doom-one
     display-line-numbers-type t
     global-visual-line-mode t
)

;; autocomplete config
(company-tng-configure-default) ;; autocomplete with tab
(setq company-selection-wrap-around t)

;; custom file type assocation
(setq auto-mode-alist
      (append '(("\\.cmp\\'" . mhtml-mode)
                ("\\.app\\'" . mhtml-mode)
                ("\\.lib\\'" . mhtml-mode)
                ("\\.evt\\'" . mhtml-mode)
                ("\\.txt\\'" . markdown-mode)
                ("\\.jsx\\'" . web-mode)
                ("\\.tsx\\'" . web-mode)
                ("\\.vue\\'" . web-mode)
                )
              auto-mode-alist))

;; markdown
(custom-set-faces
    '(markdown-header-face ((t (:inherit font-lock-function-name-face :weight bold :family "variable-pitch"))))
    '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 2.2))))
    '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.8))))
    '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.4)))))

;; org mode
(setq org-directory "~/org/")
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

;; projectile
(load! "+projectile")
(setq projectile-switch-project-action #'projectile-commander)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(require 'p4)
