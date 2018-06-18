(prelude-require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(defun mw-wveb-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook  'mw-web-mode-hook)
