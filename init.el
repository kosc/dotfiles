
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(show-paren-mode 2)
(custom-set-variables
 '(custom-enabled-themes (quote (wombat)))
 '(package-selected-packages
   (quote
    (github-issues company-anaconda jabber))))

; evil mode
(require 'evil)
(evil-mode 1)

; Python settings
(add-hook 'python-mode-hook 'anaconda-mode)

; Use main GPG key by default
(setq epa-file-select-keys "6163B960A5CC15D0")

; Add IN_PROGRESS status to org-mode TODO
(setq org-todo-keywords
  '((sequence "TODO" "IN_PROGRESS" "|" "DONE")))

; Add my orgfiles to Agenda
(setq org-agenda-files (directory-files-recursively "~/Dropbox/orgfiles" "\.gpg$"))
