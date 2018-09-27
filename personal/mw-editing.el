;;----------------------------------------------------------------------------
;; Some basic preferences
;;----------------------------------------------------------------------------

(setq-default
 blink-cursor-interval 0.4
 case-fold-search t
 column-number-mode t
 delete-selection-mode t
 ediff-split-window-function 'split-window-horizontally
 ediff-window-setup-function 'ediff-setup-windows-plain
 indent-tabs-mode nil
 make-backup-files nil
 mouse-yank-at-point t
 save-interprogram-paste-before-kill t
 scroll-preserve-screen-position 'always
 set-mark-command-repeat-pop t
 tooltip-delay 1.5
 truncate-lines nil
 truncate-partial-width-windows nil)

;; Cut/copy the current line if no region is active
(prelude-require-package 'whole-line-or-region)
(add-hook 'after-init-hook 'whole-line-or-region-mode)

;; Unmap prelude's "text-scale-decrease"
(define-key global-map (kbd "C--") nil)

;;----------------------------------------------------------------------------
;; aspell preferences
;;----------------------------------------------------------------------------

(setq tab-width 2)
(setq-default show-trailing-whitespace nil)

;;----------------------------------------------------------------------------
;; macos key preferences
;;----------------------------------------------------------------------------

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;;----------------------------------------------------------------------------
;; quick font options
;;----------------------------------------------------------------------------

(defun set-font-bau ()
  (interactive)
  (set-font-size 120))

(defun set-font-pairing ()
  (interactive)
  (set-font-size 160))

(defun set-font-presentation ()
  (interactive)
  (set-font-size 220))

(defun set-font-size (font-height)
  (custom-set-faces `(default ((t (:height ,font-height :family "menlo"))))))

;;----------------------------------------------------------------------------
;; multiple cursors preferences
;;----------------------------------------------------------------------------

(prelude-require-package 'multiple-cursors)

;; freindly shortcuts
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-+") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m c") 'mc/edit-lines)
(global-set-key (kbd "C-c m e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c m a") 'mc/edit-beginnings-of-lines)

;;----------------------------------------------------------------------------
;; windows preferences
;;----------------------------------------------------------------------------

;; make "C-x o" prompt for a target window when there are more than 2
(prelude-require-package 'switch-window)
(setq-default switch-window-shortcut-style 'alphabet)
(setq-default switch-window-timeout nil)
(global-set-key (kbd "C-x o") 'switch-window)

;; pin the current buffer to its window
(defun sanityinc/toggle-current-window-dedication ()
  "Toggle whether the current window is dedicated to its current buffer."
  (interactive)
  (let* ((window (selected-window))
         (was-dedicated (window-dedicated-p window)))
    (set-window-dedicated-p window (not was-dedicated))
    (message "Window %sdedicated to %s"
             (if was-dedicated "no longer " "")
             (buffer-name))))

(global-set-key (kbd "C-c <down>") 'sanityinc/toggle-current-window-dedication)

;; split and move focus to new window
(global-set-key (kbd "C-x 2") (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key (kbd "C-x 3") (lambda () (interactive)(split-window-horizontally) (other-window 1)))


;;----------------------------------------------------------------------------
;; prose preferences
;;----------------------------------------------------------------------------

(require 'flycheck)

(flycheck-define-checker proselint
  "A linter for prose."
  :command ("proselint" source-inplace)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ": "
            (id (one-or-more (not (any " "))))
            (message (one-or-more not-newline)
                     (zero-or-more "\n" (any " ") (one-or-more not-newline)))
            line-end))
  :modes (text-mode markdown-mode gfm-mode org-mode))

(add-to-list 'flycheck-checkers 'proselint)

(add-hook 'markdown-mode-hook #'flycheck-mode)
(add-hook 'gfm-mode-hook #'flycheck-mode)
(add-hook 'text-mode-hook #'flycheck-mode)
(add-hook 'org-mode-hook #'flycheck-mode)
