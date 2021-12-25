;; Identity config:
(setq user-full-name "Augusto Riedinger"
      user-mail-address "riedinger.augusto@gmail.com")

;; Setting themes:
(setq doom-theme 'doom-one)

;; Setting line numbers:
(setq display-line-numbers-type t)

;; Dashboard config:
(use-package dashboard
:init
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-center-content t)
(setq dashboard-banner-logo-title "Emacs is more than a text editor!")
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((recents . 5)
                        (agenda . 5)
                        (bookmarks . 3)
                        (projects . 3)
                        (registers . 3)))
:config
(dashboard-setup-startup-hook)
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; Org mode config:
(add-hook 'org-mode-hook 'org-indent-mode))
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/agenda/")
        org-log-done 'time)
  (setq org-todo-keywords '((sequence "TODO(t)" "PROJ(P)" "PAR(p)" "FINAL(f)" "LAB(l)" "EXP(e)" "CANCELLED(c)" "CLASS(C)" "|")))
  (setq org-src-preserve-indentation nil
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0)

(use-package org-superstar
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

;; yasnippet config:
(use-package yasnippet
  :config
  (add-to-list 'load-path
               "~/.doom.d/snippets/")
  (yas-global-mode 1))
