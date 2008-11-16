; Bind file suffixes to xml-mode
;
(setq auto-mode-alist
      (append '(
		("\\.html\\.php$" . sgml-mode)
		)
	      auto-mode-alist))


(defconst gallery-sgml-style
  '(
    (c-echo-syntactic-information-p . t)     ; turn this on to get debug info
    )
  "XML Style for the Gallery Project")

(defun my-sgml-mode-hook ()
  "Gallery SGML Mode Hook"
  (message "Setting Gallery SGML Mode")
  (define-key sgml-mode-map "\C-m" 'newline-and-indent)
  (define-key sgml-mode-map "\C-c\C-f" 'smarter-find-file)
  (setq indent-tabs-mode nil))
(add-hook 'sgml-mode-hook 'my-sgml-mode-hook)
