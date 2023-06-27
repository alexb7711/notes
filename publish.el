;;; build-site.el -- Summary
;;;
;;; Commentary:
;;;
;;; Code:

;; Set the package installation directory so that packages are not stored in the
;; default directory
(require 'package)

;;==============================================================================
;; Functions
(defun my/org-sitemap-date-entry-format (entry style project)
  "Format ENTRY in org-publish PROJECT Sitemap format ENTRY ENTRY STYLE format that includes date."
  (let ((filename (org-publish-find-title entry project)))
    (if (= (length filename) 0)
        (format "*%s*" entry)
      (format "{{{timestamp(%s)}}} [[file:%s][%s]]"
              (format-time-string "%Y-%m-%d"
                                  (org-publish-find-date entry project))
              entry
              filename))))

;;==============================================================================
;; Script

;;------------------------------------------------------------------------------
;; Packages
(setq package-user-dir (expand-file-name "./.packages")
      package-archives '(("melpa" . "https://melpa.org/packages/")
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

;;------------------------------------------------------------------------------
;; HTML output

;; Customize HTML output
(setq
 org-export-global-macros            '(("timestamp" . "@@html:<span class=\"timestamp\">[$1]</span>@@"))
 org-html-validation-link            nil
 org-html-head-include-scripts       nil
 org-html-head-include-default-style t
 org-html-preamble                   t
 org-html-head                       "<link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />"
 org-html-preamble-format            '(("en" "<nav><a href=\"index.html\">Home</a> | <a href=\"blog.html\">Blog</a> | <a href=\"notes.html\">Notes</a> | <a href=\"class.html\">Classes</a> | <a href=\"projects.html\">Projects</a> | <a href=\"todo.html\">Todo</a> | <a href=\"error.html\">About</a></nav>")))

;; Define publishing project
(setq org-publish-project-alist
      (list (list "pages"                                                       ; List for `pages' (org files)
             :author               "Alexander Brown"
             :base-directory       "content"
             :base-extension       "org"
             :html-doctype         "html5"
             :html-head-include-default-style nil
             :html-head-include-scripts nil
             :html-html5-fancy     t
             :publishing-directory "docs"
             :publishing-function  'org-html-publish-to-html
             :recursive            nil
             :section-numbers      t
             :sitemap-format-entry 'my/org-sitemap-date-entry-format
             :time-stamp-file      t
             :with-author          t
             :with-toc             t)
            (list "blog"                                                        ; List for `blog' (org files)
             :author               "Alexander Brown"
             :auto-sitemap         t
             :base-directory       "content/blog"
             :base-extension       "org"
             :html-doctype         "html5"
             :html-head-include-default-style nil
             :html-head-include-scripts nil
             :html-html5-fancy     t
             :publishing-directory "docs"
             :publishing-function  'org-html-publish-to-html
             :recursive            t
             :section-numbers      t
             :sitemap-filename     "blog.org"
             :sitemap-format-entry 'my/org-sitemap-date-entry-format
             :time-stamp-file      t
             :with-author          t
             :with-toc             t)
            (list "document-notes"                                              ; List for `document-notes' (org files)
             :author               "Alexander Brown"
             :auto-sitemap         t
             :base-directory       "content/doc-notes"
             :base-extension       "org"
             :html-doctype         "html5"
             :html-head-include-default-style nil
             :html-head-include-scripts nil
             :html-html5-fancy     t
             :publishing-directory "docs"
             :publishing-function  'org-html-publish-to-html
             :recursive            t
             :section-numbers      t
             :sitemap-filename     "doc-notes.org"
             :time-stamp-file      t
             :with-author          t
             :with-toc             t)
            (list "notes"                                                       ; List for `notes' (org files)
             :author               "Alexander Brown"
             :auto-sitemap         t
             :base-directory       "content/notes"
             :base-extension       "org"
             :html-doctype         "html5"
             :html-head-include-default-style nil
             :html-head-include-scripts nil
             :html-html5-fancy     t
             :publishing-directory "docs"
             :publishing-function  'org-html-publish-to-html
             :section-numbers      t
             :sitemap-filename     "notes.org"
             :sitemap-format-entry 'my/org-sitemap-date-entry-format
             :time-stamp-file      t
             :with-author          t
             :with-toc             t)
            (list "classes"                                                     ; List for `notes' (org files)
             :author               "Alexander Brown"
             :auto-sitemap         t
             :base-directory       "content/class-lectures"
             :base-extension       "org"
             :html-doctype         "html5"
             :html-head-include-default-style nil
             :html-head-include-scripts nil
             :html-html5-fancy     t
             :publishing-directory "docs"
             :publishing-function  'org-html-publish-to-html
             :section-numbers      t
             :sitemap-filename     "class.org"
             :sitemap-format-entry 'my/org-sitemap-date-entry-format
             :time-stamp-file      t
             :with-author          t
             :with-toc             t)
       (list "static"                                                           ; List for `static' stuff
             :author               "Alexander Brown"
             :base-directory       "content"
             :base-extension       "css\\|txt\\|jpg\\|gif\\|png|\\pdf"
             :publishing-directory "docs"
             :publishing-function  'org-publish-attachment)))

;; Generate the site output
;; (org-publish "index.org" t)
(org-publish-all t)

(message "Build complete!")

;;; build-site.el ends here.
