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
