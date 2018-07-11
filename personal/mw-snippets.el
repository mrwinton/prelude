;;----------------------------------------------------------------------------
;; snippet preferences
;;----------------------------------------------------------------------------

(prelude-require-package 'yasnippet)
(require 'yasnippet)

(setq yas-snippet-dirs '("~/.emacs.d/snippets"
                         "~/.emacs.d/snippets/yasnippet-snippets"
                         "~/.emacs.d/snippets/custom"))

(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

(yas-global-mode 1)