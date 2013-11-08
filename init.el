;;
;;  emacs init
;;

;(require 'key-chord)
(require 'package)
;(require 'evil)

(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))

(package-initialize)

;; hhhehehe
(evil-mode 1)

;; Set font on windows
(if (eq window-system 'mswindows)
    (set-face-attribute 'default nil :font "Consolas-11"))

;; If we're in a gui window, set the cursor color. Evil default is black.
(when window-system
    (load-theme 'solarized-dark t)
    (setq evil-default-cursor (quote (t "white"))))

;; Get rid of the chrome
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Open an empty buffer instead of the welcome to emacs page
(setq inhibit-startup-message t)
(insert " ")

;;   http://bbbscarter.wordpress.com/2012/09/13/emacs-bits-and-bobs/
;;
;; Map jk to exit insert mode (broken)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map  "jk" 'evil-normal-state)
(key-chord-mode 1)
