;;; bibtex-tidy.el --- Utility to sort Python imports -*- lexical-binding: t; -*-

(require 'reformatter)

(defcustom bibtex-tidy-command "bibtex-tidy"
  "Name of the `bibtex-tidy` executable."
  :group 'nasy
  :type 'string)

(defvar bibtex-tidy--base-args '("--curly" "--wrap")
  "Base arguments to pass to bibtex-tidy.")

(defcustom bibtex-tidy-extra-args nil
  "Extra arguments to pass to bibtex-tidy."
  :group 'nasy
  :type '(repeat string))

;;;###autoload (autoload 'bibtex-tidy-buffer "bibtex-tidy" nil t)
;;;###autoload (autoload 'bibtex-tidy-region "bibtex-tidy" nil t)
;;;###autoload (autoload 'bibtex-tidy-on-save-mode "bibtex-tidy" nil t)
(reformatter-define bibtex-tidy
  :program bibtex-tidy-command
  :args (bibtex-tidy--make-args beg end)
  :lighter " b/tidy"
  :group 'bibtex-tidy)

(defun bibtex-tidy--make-args (beg end)
  "Helper to build the argument list for bibtex-tidy for span BEG to END."
  (append bibtex-tidy--base-args
          bibtex-tidy-extra-args
          '("-")))

(provide 'bibtex-tidy)
;;; bibtex-tidy.el ends here
