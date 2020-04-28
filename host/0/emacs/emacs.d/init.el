;set up initial editor frame colors

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(set-background-color "black")
(set-foreground-color "white")
(set-cursor-color "green")

;setup initial environment
(setq inhibit-startup-message t)
(display-time)

;set default mode for new files of unknown types to text
(setq major-mode 'text-mode)

;love the line numbers
(setq line-number-mode t)

;;; .emacs initialization file for using emacs with lisp
(setq inferior-lisp-program "gcl")

;shortcut keys are good
(global-set-key "\C-c\C-m" 'compile)

(global-set-key (kbd "C-x C-t")
  (lambda ()
    (interactive)
    (insert (format-time-string "## %Y-%m-%d : tkooda : \n"))))

;; tkooda : 2008-10-23 : make spellcheck easier
(global-set-key (kbd "C-x p")
  (lambda ()
    (interactive)   
    (ispell)))

;syntax highlighting pretty much rules
;(cond ((fboundp 'global-font-lock-mode)
;       ;; Turn on font-lock in all modes that support it
;       (global-font-lock-mode t)       ;; Maximum colors
;       (setq font-lock-maximum-decoration t)       ;; Customize face attributes
;       (setq font-lock-face-attributes
;             ;; Symbol-for-Face Foreground Background Bold Italic Underline
;             '((font-lock-comment-face       "tomato3")
;               (font-lock-string-face        "grey60")
;               (font-lock-keyword-face       "gold")
;               (font-lock-function-name-face "chartreuse")
;               (font-lock-variable-name-face "lightseagreen")
;               (font-lock-type-face          "khaki")
;               (font-lock-reference-face     "mediumaquamarine")
;               (font-lock-error-face         "cyan")
;               (font-lock-warning-face       "mediumpurple")
;               (font-lock-active-error-face  "deeppink")
;               (font-lock-include-face       "khaki")))
;       ;; Create the faces from the attributes
;;;       (font-lock-make-faces)
;))

(setq auto-mode-alist '(("\\.ad[bs]\\'"   . ada-mode)
                        ("\\.awk\\'"      . awk-mode)
                        ("\\.lex\\'"      . c-mode)
                        ("\\.[cy]\\'"     . c++-mode)
                        ("\\.h\\'"        . c++-mode)
                        ("\\.hxx\\'"      . c++-mode)
                        ("\\.[CH]\\'"     . c++-mode)
                        ("\\.java\\'"     . java-mode)
                        ("\\.cc\\'"       . c++-mode)
                        ("\\.hh\\'"       . c++-mode)
                        ("\\.cxx\\'"      . c++-mode)
                        ("\\.rc\\'"       . c++-mode) ;; resource files
                        ("\\.rcv\\'"      . c++-mode)
                        ("\\.p[lm]\\'"    . perl-mode)
                        ("\\.cgi\\'"      . perl-mode)
                        ("\\.f\\'"      . fortran-mode)
                        ("\\.el\\'"       . emacs-lisp-mode)
                        ("\\.emacs\\'"    . emacs-lisp-mode)
                        ("\\.tex\\'"      . LaTeX-mode)
                        ("\\.bib\\'"      . bibtex-mode)
                        ("[Mm]akefile\\'" . makefile-mode)
                        ("\\.mak\\'"      . makefile-mode)
                        ("\\[Mm]akefile.\\'" . makefile-mode)
                        ("\\.bat\\'"      . shell-script-mode)
                        ("\\.tar\\'"      . tar-mode)
                        ("\\.html\\'"     . html-mode)
                        ("\\.pddl\\'"	  . lisp-mode)
                        ("\\.lisp\\'"	  . lisp-mode)
                        ("\\.xml\\'"      . nxml-mode)
			))


;;=============================================================================
;;                    scroll on  mouse wheel
;;=============================================================================

(defun up-one () (interactive) (scroll-up 1))
(defun down-one () (interactive) (scroll-down 1))
(global-set-key [S-mouse-4] 'down-one)
(global-set-key [S-mouse-5] 'up-one)

(defun up-slightly () (interactive) (scroll-up 5))
(defun down-slightly () (interactive) (scroll-down 5))
(global-set-key [mouse-4] 'down-slightly)
(global-set-key [mouse-5] 'up-slightly)

(defun up-a-lot () (interactive) (scroll-up))
(defun down-a-lot () (interactive) (scroll-down))
(global-set-key [C-mouse-4] 'down-a-lot)
(global-set-key [C-mouse-5] 'up-a-lot)



(custom-set-variables
  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 '(case-fold-search t)
 '(current-language-environment "ASCII")
 '(global-font-lock-mode t nil (font-lock))
 '(show-paren-mode t nil (paren)))
  ;; tkooda : 2005-04-11 : test
 '(save-place t nil (saveplace))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
 )

;; tkooda : 2007-03-13 : force python-mode for specific versions of python
(setq interpreter-mode-alist
    (cons '("python" . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist
    (cons '("python2.2" . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist
    (cons '("python2.3" . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist
    (cons '("python2.4" . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist
    (cons '("python2.5" . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist
    (cons '("python3" . python-mode) interpreter-mode-alist))

;; 2017-01-04 : tkooda : force tab indentation for python-mode
(add-hook 'python-mode-hook
  (lambda () (setq indent-tabs-mode t)))


;; Don't make me type out 'yes' and 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;;;;Change backup behavior to save in a directory, not in a miscellany
;;;;of files all over the place.
(setq
    backup-by-copying t      ; don't clobber symlinks
    backup-directory-alist
    '(("." . "~/.emacs-backups"))    ; don't litter my fs tree
    delete-old-versions t
    kept-new-versions 6
    kept-old-versions 2
    version-control t)       ; use versioned backups

;;;;Make sure that .emacs file is edited in lisp mode:
(setq auto-mode-alist (cons '("\.emacs" . lisp-mode) auto-mode-alist))

(setq tab-width 4)


;; Fix the worse part about emacs: indentation craziness
;;   1. When I hit the TAB key, I always want a TAB character inserted
;;   2. Don't automatically indent the line I am editing.
;;   3. When I hit C-j, I always want a newline, plus enough tabs to put me on
;;      the same column I was at before.
;;   4. When I hit the BACKSPACE key to the right of a TAB character, I want the
;;      TAB character deleted-- not replaced with tabwidth-1 spaces.
(defun newline-and-indent-relative ()
  "Insert a newline, then indent relative to the previous line."
  (interactive "*") (newline) (indent-relative))
(defun indent-according-to-mode () ())
(defalias 'newline-and-indent 'newline-and-indent-relative)
(defun my-c-hook ()
  (defalias 'c-electric-backspace 'delete-backward-char)
  (defun c-indent-command () (interactive "*") (self-insert-command 1)))
(add-hook 'c-mode-common-hook 'my-c-hook)
(defun indent-region-with-tab ()
  (interactive)
  (save-excursion
  (if (< (point) (mark)) (exchange-point-and-mark))
  (let ((save-mark (mark)))
    (if (= (point) (line-beginning-position)) (previous-line 1))
      (goto-char (line-beginning-position))
        (while (>= (point) save-mark)
	       (goto-char (line-beginning-position))
			  (insert "\t")
				  (previous-line 1)))))
;;(global-set-key [f4] 'indent-region-with-tab)
(global-set-key [?\C-x tab] 'indent-region-with-tab)
(defun unindent-region-with-tab ()
  (interactive)
  (save-excursion
  (if (< (point) (mark)) (exchange-point-and-mark))
  (let ((save-mark (mark)))
    (if (= (point) (line-beginning-position)) (previous-line 1))
      (goto-char (line-beginning-position))
        (while (>= (point) save-mark)
	       (goto-char (line-beginning-position))
			  (if (= (string-to-char "\t") (char-after (point))) (delete-char 1))
			      (previous-line 1)))))




; Moxley's php-mode customizations
;; tkooda : 2008-02-25 : disable php-mode, is mising on netboxes
;;(require 'php-mode)
;;(defun my-php-mode-common-hook ()
;;  ;; my customizations for php-mode
;;  (setq tab-width 4)
;;  (setq c-basic-offset 4)
;;  (c-set-offset 'topmost-intro-cont 4)
;;  (c-set-offset 'class-open 0)
;;  (c-set-offset 'inline-open 0)
;;  (c-set-offset 'substatement-open 0)
;;  (c-set-offset 'arglist-intro '+)
;;  )
;;(defun pear-php-mode-hook ()
;;  (setq tab-width 4
;;        c-basic-offset 4
;;        indent-tabs-mode
;;      (string-match "\.php$" (buffer-file-name))))
;;(add-hook 'php-mode-hook 'pear-php-mode-hook)



;;;; Display the time
;;(setq display-time-day-and-date t
;;      display-time-24hr-format t)
;;(display-time)


;; Show the column number
(column-number-mode t)


;;;;"I always compile my .emacs, saves me about two seconds
;;;;startuptime. But that only helps if the .emacs.elc is newer
;;;;than the .emacs. So compile .emacs if it's not."
(defun autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (if (string= (buffer-file-name) (expand-file-name (concat default-directory ".emacs")))
      (byte-compile-file (buffer-file-name))))

(add-hook 'after-save-hook 'autocompile)


;; 2017-04-10 : tkooda : disable "Symbolic link to Git-controlled source file; follow link? (y or n)"
;;(setq vc-follow-symlinks 'nil)
(setq vc-follow-symlinks 't)

;; 2019-09-16 : tkooda : https://stackoverflow.com/questions/6679625/how-to-make-emacs-python-mode-generate-tabs-for-indent
(add-hook 'python-mode-hook
  (lambda ()
    (setq indent-tabs-mode t)
    (setq python-indent 4)
    (setq tab-width 4)))

;; 2019-09-17 : tkooda : https://web-mode.org for editing JavaScript within HTML
(add-to-list 'load-path "~/.emacs.d/lisp/")
(load "web-mode")
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))

