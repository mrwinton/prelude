(setq-default grep-highlight-matches t
              grep-scroll-output t)

(prelude-require-package 'ag)
(prelude-require-package 'wgrep-ag)

(setq-default ag-highlight-search t)

(define-key smartparens-mode-map (kbd "M-?") nil)
(global-set-key (kbd "M-?") 'ag-project)