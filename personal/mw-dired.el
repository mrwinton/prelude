;; refresh dired buffers when revisited
(setq dired-auto-revert-buffer t)

(prelude-require-package 'diredfl)
(diredfl-global-mode)

(prelude-require-package 'diff-hl)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)
