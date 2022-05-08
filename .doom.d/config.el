(setq user-full-name "Augusto Riedinger"
      user-mail-address "riedinger.augusto@gmail.com")

(setq doom-theme 'doom-molokai)

(use-package all-the-icons)

(display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

(setq x-select-enable-clipboard t)

(setq Tex-auto-save t)
(setq Tex-parse-self t)
(setq-default Tex-master nil)

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

(use-package! calctex
  :commands calctex-mode
  :init
  (add-hook 'calc-mode-hook #'calctex-mode)
  :config
  (setq calctex-additional-latex-packages "
\\usepackage[usenames]{xcolor}
\\usepackage{soul}
\\usepackage{adjustbox}
\\usepackage{amsmath}
\\usepackage{amssymb}
\\usepackage{siunitx}
\\usepackage{cancel}
\\usepackage{mathtools}
\\usepackage{mathalpha}
\\usepackage{xparse}
\\usepackage{arevmath}"
        calctex-additional-latex-macros
        (concat calctex-additional-latex-macros
                "\n\\let\\evalto\\Rightarrow"))
  (defadvice! no-messaging-a (orig-fn &rest args)
    :around #'calctex-default-dispatching-render-process
    (let ((inhibit-message t) message-log-max)
      (apply orig-fn args)))
  ;; Fix hardcoded dvichop path (whyyyyyyy)
  (let ((vendor-folder (concat (file-truename doom-local-dir)
                               "straight/"
                               (format "build-%s" emacs-version)
                               "/calctex/vendor/")))
    (setq calctex-dvichop-sty (concat vendor-folder "texd/dvichop")
          calctex-dvichop-bin (concat vendor-folder "texd/dvichop")))
  (unless (file-exists-p calctex-dvichop-bin)
    (message "CalcTeX: Building dvichop binary")
    (let ((default-directory (file-name-directory calctex-dvichop-bin)))
      (call-process "make" nil nil nil))))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(require 'latex-preview-pane)
(latex-preview-pane-enable)
