;;----------------------------------------------------------------------------
;; projectile preferences
;;----------------------------------------------------------------------------

;; show dired project root rather than asking for a specific file
(setq projectile-switch-project-action 'projectile-dired)

;; search even if we're not in a "real" project
(setq projectile-require-project-root nil)

;; set preferred projectile prefix
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

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
