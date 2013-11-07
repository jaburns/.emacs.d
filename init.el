;;
;;  emacs init - jaburns
;;
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(evil-mode 1)

(set-face-attribute 'default nil :font "Consolas-11")
(load-theme 'solarized-dark t)
(setq evil-default-cursor (quote (t "white")))
(menu-bar-mode -1)
(tool-bar-mode -1)

(setq inhibit-startup-message t)
(insert " ")
