;;; export-org-to-hugo.el --- Export Org files to Hugo-compatible Markdown

;; Set a temporary emacs directory for CI
(setq user-emacs-directory (expand-file-name ".emacs.d/" default-directory))

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 7))  ; Current version is 7
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Install ox-hugo and its dependencies via straight
(straight-use-package 'ox-hugo)

;; Configure ox-hugo
(require 'ox-hugo)
(setq org-hugo-base-dir "./"
      org-hugo-section "posts"
      make-backup-files nil)

;; Export all posts
(find-file "content-org/blog.org")
(org-hugo-export-wim-to-md :all-subtrees)

(message "Export complete!") export-org-to-hugo.el --- Description -*- lexical-binding: t; -*-
