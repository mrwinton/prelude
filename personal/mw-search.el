;;----------------------------------------------------------------------------
;; grep preferences
;;----------------------------------------------------------------------------

(setq-default grep-highlight-matches t
              grep-scroll-output t)

;;----------------------------------------------------------------------------
;; silver searcher preferences
;;----------------------------------------------------------------------------

(prelude-require-package 'ag)

;; highlight search output
(setq-default ag-highlight-search t)

;; shortcut for searching projects
(define-key smartparens-mode-map (kbd "M-?") nil)
(global-set-key (kbd "M-?") 'ag-project)

;;----------------------------------------------------------------------------
;; writable results buffer
;;----------------------------------------------------------------------------

(prelude-require-package 'wgrep-ag)