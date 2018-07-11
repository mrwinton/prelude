;;----------------------------------------------------------------------------
;; Dash
;;
;; Support for the http://kapeli.com/dash documentation browser
;;----------------------------------------------------------------------------

;; is Dash installed?
(defun mw/dash-installed-p ()
  "Return t if Dash is installed on this machine, or nil otherwise."
  (let ((lsregister "/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister"))
    (and (file-executable-p lsregister)
         (not (string-equal
               ""
               (shell-command-to-string
                (concat lsregister " -dump|grep com.kapeli.dash")))))))

;; when Dash is installed, load package dash-at-point
(when (and (eq system-type 'darwin) (not (package-installed-p 'dash-at-point)))
  (message "Checking whether Dash is installed")
  (when (mw/dash-installed-p)
    (prelude-require-package 'dash-at-point)))

;; friendly key binding for searching Dash
(when (package-installed-p 'dash-at-point)
  (global-set-key (kbd "C-c ?") 'dash-at-point))
