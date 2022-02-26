(setq user-full-name "Augusto Riedinger"
      user-mail-address "riedinger.augusto@gmail.com")

(setq doom-theme 'doom-one)

(use-package all-the-icons)

(display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(setq x-select-enable-clipboard t)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

(use-package dashboard
:init
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-center-content t)
(setq dashboard-banner-logo-title "Emacs is more than a text editor!")
(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((recents . 5)
                        (agenda . 5)
                        (bookmarks . 3)))
:config
(dashboard-setup-startup-hook)

(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

(setq tex-dvi-view-command "xdvi")
(global-font-lock-mode t)
(add-hook 'org-mode-hook 'org-fragtog-mode)
(after! org (plist-put org-format-latex-options :scale 0.5))

(with-eval-after-load 'ox-latex
   (add-to-list 'org-latex-classes
                '("IEEEtran" "\\documentclass{IEEEtran}"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

(add-hook 'org-mode-hook 'org-indent-mode))
  (setq org-directory "~/org/"
        org-agenda-files '("~/org/agenda/")
        org-log-done 'time)
  (setq org-todo-keywords '((sequence "TODO(t)" "PROJ(P)" "PAR(p)" "FINAL(f)" "LAB(l)" "EXP(e)" "CANCELLED(c)" "CLASS(C)" "|")))
  (setq org-src-preserve-indentation nil
        org-src-tab-acts-natively t
        org-edit-src-content-indentation 0)

(setq org-highlight-latex-and-related '(latex))

(use-package org-superstar
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/org/roam/")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point)
         :map org-roam-dailies-map
         ("Y" . org-roam-dailies-capture-yesterday)
         ("T" . org-roam-dailies-capture-tomorrow))
  :bind-keymap
  ("C-c n d" . org-roam-dailies-map)
  :config
  (require 'org-roam-dailies) ;; Ensure the keymap is available
  (org-roam-db-autosync-mode))

(use-package yasnippet
  :config
  (add-to-list 'load-path
               "~/.doom.d/snippets/")
  (yas-global-mode 1))
