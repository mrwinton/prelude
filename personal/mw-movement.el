(global-set-key [(shift return)] 'smart-open-line)
(global-set-key (kbd "M-o") 'smart-open-line)
(global-set-key [(control shift return)] 'smart-open-line-above)
(global-set-key (kbd "M-O") 'smart-open-line-above)
(global-set-key (kbd "C-x C-y") 'show-buffer-file-name)

(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(defun smart-open-line-above ()
  "Insert an empty line above the current line.
Position the cursor at it's beginning, according to the current mode."
  (interactive)
  (move-beginning-of-line nil)
  (newline-and-indent)
  (forward-line -1)
  (indent-according-to-mode))

(defun show-buffer-file-name ()
  "Show the full path to the current file in the minibuffer."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (progn
          (message file-name)
          (kill-new file-name))
      (error "Buffer not visiting a file"))))
