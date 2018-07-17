;;----------------------------------------------------------------------------
;; theme
;;----------------------------------------------------------------------------

(when (display-graphic-p)
  (prelude-require-package 'snazzy-theme)
  (setq prelude-theme 'snazzy)
  (load-theme 'snazzy))

;;----------------------------------------------------------------------------
;; friendly scratch message
;;----------------------------------------------------------------------------

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

;;----------------------------------------------------------------------------
;; friendly title
;;----------------------------------------------------------------------------

(setq frame-title-format '((:eval (projectile-project-name))))

;;----------------------------------------------------------------------------
;; suppress GUI features
;;----------------------------------------------------------------------------

(setq use-file-dialog nil)
(setq use-dialog-box nil)
(setq inhibit-startup-screen t)

;;----------------------------------------------------------------------------
;; minimal ui
;;----------------------------------------------------------------------------

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'set-scroll-bar-mode)
  (set-scroll-bar-mode nil))
(when (eq system-type 'darwin)
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (set-frame-parameter frame 'menu-bar-lines
                                   (if (display-graphic-p frame)
                                       1 0))))
  (when (fboundp 'menu-bar-mode)
    (menu-bar-mode -1)))
(when (fboundp 'pixel-scroll-mode)
  (pixel-scroll-mode 1))

;;----------------------------------------------------------------------------
;; dimmer mode
;;----------------------------------------------------------------------------

(prelude-require-package 'dimmer)
(setq-default dimmer-fraction 0.1)
(add-hook 'after-init-hook 'dimmer-mode)
