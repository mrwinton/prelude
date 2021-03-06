;;----------------------------------------------------------------------------
;; dired
;;----------------------------------------------------------------------------

;; refresh dired buffers when revisited
(setq dired-auto-revert-buffer t)

;;----------------------------------------------------------------------------
;; diredfl
;;----------------------------------------------------------------------------

(prelude-require-package 'diredfl)

;; pretty font locking in dired mode
(diredfl-global-mode)

;;----------------------------------------------------------------------------
;; diff-hl
;;----------------------------------------------------------------------------

(prelude-require-package 'diff-hl)

;; show version control diffs in dired mode
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)
