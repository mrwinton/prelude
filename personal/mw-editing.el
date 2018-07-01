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

;; aspell settings
(setq tab-width 2)
(setq-default show-trailing-whitespace nil)

;; macos settings
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Cut/copy the current line if no region is active
(prelude-require-package 'whole-line-or-region)
(add-hook 'after-init-hook 'whole-line-or-region-mode)
