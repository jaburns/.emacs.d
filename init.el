;;
;;  emacs init
;;

;; Init marmalade package repo
(require 'package)
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; hhhehehe
(evil-mode 1)

;; Set font on windows to consolas
(if (eq system-type 'windows-nt)
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
;; Map jk to exit insert mode
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map  "jk" 'evil-normal-state)
(key-chord-mode 1)

(define-key evil-normal-state-map (kbd "C-j") 'jaburns-ctrl-j)
(define-key evil-visual-state-map (kbd "C-j") 'jaburns-ctrl-j)
(evil-define-command jaburns-ctrl-j () (evil-next-line 15))

(define-key evil-normal-state-map (kbd "C-k") 'jaburns-ctrl-k)
(define-key evil-visual-state-map (kbd "C-k") 'jaburns-ctrl-k)
(evil-define-command jaburns-ctrl-k () (evil-previous-line 15))

(define-key evil-insert-state-map (kbd "C-v") 'evil-paste-after)
