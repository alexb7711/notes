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
(package-install 'org-ref)

;; Load the publishing project
(require 'ox-publish)
(require 'org-ref)

;; Customize HTML output
(setq
 org-html-validation-link            nil
 org-html-head-include-scripts       nil
 org-html-head-include-default-style nil
 org-html-preamble                   t
 org-html-head                       "<link rel=\"stylesheet\" type=\"text/css\" href=\" ./style.css\" />")
 ;; org-html-head                       "<include src=\"./template.html\"></include>")

;; Define publishing project
(setq org-publish-project-alist
      (list                             ; List for all projects
       (list "notes"                    ; List for `notes' project
             :author               "Alexander Brown"
             :publishing-directory "docs"
             :base-directory       "content"
             :recursive            nil
             :with-author          t
             :with-toc             t
             :html-preamble        "<a href=\"index.html\">Home</a> | <a href=\"blog.html\">Blog</a> | <a href=\"notes.html\">Notes</a> | <a href=\"classes.html\">Classes</a> | <a href=\"projects.html\">Projects</a> | <a href=\"todo.html\">Todo</a> | <a href=\"error.html\">About</a>"
             :section-numbers      t
             :time-stamp-file      t
             :publishing-function  'org-html-publish-to-html)))

;; Generate the site output
(org-publish-all)

(message "Build complete!")

;;; build-site.el ends here.
