(when (display-graphic-p)
  (prelude-require-package 'snazzy-theme)
  (setq prelude-theme 'snazzy)
  (load-theme 'snazzy))

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))
