;;; build-site.el -- Summary
;;;
;;; Commentary:
;;;
;;; Code:

;; Set the package installation directory so that packages are not stored in the
;; default directory
(require 'package)
(setq package-user-dir (expand-file-name "./.packages")
      package-archive '(("melpa" . "https://melpa.org/packages/")
                        ("elpa"  . "https://elpa.gnu.org/packages/")))

;; Initialize the package
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Load the publishing project
(require 'ox-publish)

;; Customize HTML output
(setq
 org-html-validation-link            nil
 org-html-head-include-scripts       nil
 org-html-head-include-default-style nil
 org-html-head                       "<link rel=\"stylesheet\" type=\"text/css\" href=\" ./style.css\" />")

;; Define the publishing project
(setq org-publish-project-alist
      (list                             ; List for all projects
       (list "wiki"                     ; List for `notes' project
             :author               "Alexander Brown"
             :publishing-directory "docs"
             :base-directory       "./content"
             :recursive            nil
             :with-author          t
             :with-toc             t
             :section-numbers      t
             :time-stamp-file      t
             :publishing-function  'org-html-publish-to-html)))

;; Generate the site output
(org-publish-all t)

(message "Build complete!")

;;; build-site.el ends here.
