(package! evil-tutor)
(package! page-break-lines)
(package! projectile)
(package! all-the-icons)
(package! dashboard)

(package! yasnippet)

(package! org-bullets)
(package! org-superstar)

(package! auctex)

(package! texfrag)
(package! latex-math-preview)

(package! org-roam)

(package! org-fragtog)

(package! calctex :recipe (:host github :repo "johnbcoughlin/calctex"
                           :files ("*.el" "calctex/*.el" "calctex-contrib/*.el" "org-calctex/*.el" "vendor"))
  :pin "67a2e76847a9ea9eff1f8e4eb37607f84b380ebb")
