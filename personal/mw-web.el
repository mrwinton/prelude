;;----------------------------------------------------------------------------
;; web-mode
;;----------------------------------------------------------------------------

(prelude-require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(defun mw-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook  'mw-web-mode-hook)

;;----------------------------------------------------------------------------
;; js2-mode
;;----------------------------------------------------------------------------

(prelude-require-package 'js2-mode)

(defun mw-js2-mode-hook ()
  "Hooks for js2-mode."
  (setq js2-basic-offset 2))

(add-hook 'js2-mode-hook 'mw-js2-mode-hook)
