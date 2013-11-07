;;
;;  emacs init
;;
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

;; Perhaps use KeyChord library for this
;;   http://stackoverflow.com/questions/10569165/how-to-map-jj-to-esc-in-emacs-evil-mode
;;
;; map jk to exit insert mode
(define-key evil-insert-state-map "j" #'cofi/maybe-exit)
(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?k)
               nil 0.2)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?k))
    (delete-char -1)
    (set-buffer-modified-p modified)
    (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))

;;
(define-key evil-normal-state-map (kbd "C-j") 'jaburns-ctrl-j)
(define-key evil-visual-state-map (kbd "C-j") 'jaburns-ctrl-j)
(evil-define-command jaburns-ctrl-j () (evil-next-line 15))

(define-key evil-normal-state-map (kbd "C-k") 'jaburns-ctrl-k)
(define-key evil-visual-state-map (kbd "C-k") 'jaburns-ctrl-k)
(evil-define-command jaburns-ctrl-k () (evil-previous-line 15))

(define-key evil-insert-state-map (kbd "C-v") 'evil-paste-after)


