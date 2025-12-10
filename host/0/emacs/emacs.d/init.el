;; ~/.emacs.d/init.el

;; ================================================================================
;;     Setup primary configuration
;; ================================================================================

;; Added by Package.el.  This must come before configurations of installed packages.
(package-initialize)

;setup initial environment
(setq inhibit-startup-message t)

;; Show line and column numbers
(setq line-number-mode t)
(column-number-mode t)

;set default mode for new files of unknown types to text
(setq major-mode 'text-mode)

;;; .emacs initialization file for using emacs with lisp
(setq inferior-lisp-program "gcl")

;; Don't make me type out 'yes' and 'no'
(fset 'yes-or-no-p 'y-or-n-p)

;; macro to insert comment line
(global-set-key (kbd "C-x C-t")
  (lambda ()
    (interactive)
    (insert (format-time-string "## %Y-%m-%d : tkooda : \n"))))

;; macro to insert date
(global-set-key (kbd "C-x t")
  (lambda ()
    (interactive)
    (insert (format-time-string "%Y-%m-%d"))))

;; tkooda : 2008-10-23 : spellcheck macro
(global-set-key (kbd "C-x p")
  (lambda ()
    (interactive)   
    (aspell)))

;; Change default backup behavior to save in a directory, not in a miscellany of files all over the place.
(setq
    backup-by-copying t      ; don't clobber symlinks
    backup-directory-alist
    '(("." . "~/.emacs-backups"))    ; don't litter my fs tree
    delete-old-versions t
    kept-new-versions 6
    kept-old-versions 2
    version-control t)       ; use versioned backups

;; Make sure that .emacs file is edited in lisp mode:
(setq auto-mode-alist (cons '("\.emacs" . lisp-mode) auto-mode-alist))

;; 2017-04-10 : tkooda : disable "Symbolic link to Git-controlled source file; follow link? (y or n)"
;;(setq vc-follow-symlinks 'nil)  ;; off
(setq vc-follow-symlinks 't)  ;; on

;; 2019-09-17 : tkooda : https://web-mode.org for editing JavaScript within HTML
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; =============================================================================
;;     Indentation defaults
;; =============================================================================

;; set default tab with and use tab indentation instead of spaces..  (must also be specified in any add-hook's below)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)


;; =============================================================================
;;     Scroll on  mouse wheel
;; =============================================================================

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


;; ================================================================================
;;     Make SmartTabs available.
;;     Load for: 'c 'c++ 'java 'javascript 'cperl 'python 'ruby 'nxml
;;     From: https://www.emacswiki.org/emacs/SmartTabs , https://github.com/jcsalomon/smarttabs
;; ================================================================================
;; 2020-11-06 : tkooda : not nessicary on Ubuntu 20.04 and above?
;;(autoload 'smart-tabs-mode "smart-tabs-mode" "Intelligently indent with tabs, align with spaces!")
;;(autoload 'smart-tabs-mode-enable "smart-tabs-mode")
;;(autoload 'smart-tabs-advice "smart-tabs-mode")
;;(autoload 'smart-tabs-insinuate "smart-tabs-mode")


;; ================================================================================
;;     Python configuration
;; ================================================================================

;; tkooda : 2007-03-13 : force python-mode for specific versions of python
(setq interpreter-mode-alist (cons '("python"    . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist (cons '("python2.2" . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist (cons '("python2.3" . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist (cons '("python2.4" . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist (cons '("python2.5" . python-mode) interpreter-mode-alist))
(setq interpreter-mode-alist (cons '("python3"   . python-mode) interpreter-mode-alist))

;;(smart-tabs-insinuate 'javascript 'python) ;; NO, do individually


;; 2017-01-04 : tkooda : force tab indentation for python-mode: https://stackoverflow.com/questions/6679625/how-to-make-emacs-python-mode-generate-tabs-for-indent
(add-hook 'python-mode-hook
	  (lambda ()	
	    (setq indent-tabs-mode t)
	    (setq tab-width 4)
	    (setq python-indent 4)
	    ;; enable SmartTabs for python..  (not needed with recent python-mode.el)
;;	    (indent-tabs-mode nil)   ;; required to enable SmartTabs, since is set in global
;;	    (smart-tabs-mode-enable)
;;	    (smart-tabs-advice python-indent-line-1 python-indent)
	    ))


;; ================================================================================
;;     PHP configuration
;; ================================================================================

;; php-mode overrides the default indent-tabs-mode/tab-width set globally above

;; 2019-09-16 : tkooda : https://stackoverflow.com/questions/6679625/how-to-make-emacs-python-mode-generate-tabs-for-indent
(add-hook 'php-mode-hook
	(lambda ()
	  (setq indent-tabs-mode t)
	  (setq tab-width 4)
	  (setq php-indent 4)
	  ))


;; ================================================================================
;;     bash configuration
;; ================================================================================
;;(setq sh-make-vars-local nil)
;;(add-hook 'sh-mode-hook
;;	  (lambda ()
;;;;	    (setq indent-tabs-mode t)
;;;;	    (setq tab-width 4)
;;	    (setq sh-indent 4)
;;;; 2020-11-06 : tkooda : don't like SmartTabs for shellscripts?
;;;;        (smart-tabs-mode-enable) ;; enable smarttabs for shellscripts
;;;;        (smart-tabs-advice sh-indent-line sh-basic-offset) ;; enable smartabs for shellscripts
;;	    ))



;; ================================================================================
;;     HTML configuration
;; ================================================================================

;;(load "web-mode")
;;(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))


;; ================================================================================
;;     JavaScript configuration
;; ================================================================================
;;(smart-tabs-advice js2-indent-line js2-basic-offset)
;(add-hook 'js2-mode-hook
;	  (lambda ()
;;	    (setq indent-tabs-mode t)
;;	    (setq tab-width 4)
;;	    (setq js2-indent 4)
;	    ))






;; END


;; ================================================================================
;;    Legacy / Unused??
;; ================================================================================





;; 2020-11-06 : tkooda : TEST, unused?
;;(custom-set-variables
;;  ;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
;;  ;; Your init file should contain only one such instance.
;; '(case-fold-search t)
;; '(current-language-environment "ASCII")
;; '(global-font-lock-mode t nil (font-lock))
;; '(show-paren-mode t nil (paren)))
;;  ;; tkooda : 2005-04-11 : test
;; '(save-place t nil (saveplace))
;;(custom-set-faces
;;  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
;;  ;; Your init file should contain only one such instance.
;; )


;; ================================================================================
;;     Adjust emacs' default indentation behavior
;; ================================================================================


;; Fix the worse part about emacs: indentation craziness
;;   1. When I hit the TAB key, I always want a TAB character inserted
;;   2. Don't automatically indent the line I am editing.
;;   3. When I hit C-j, I always want a newline, plus enough tabs to put me on
;;      the same column I was at before.
;;   4. When I hit the BACKSPACE key to the right of a TAB character, I want the
;;      TAB character deleted-- not replaced with tabwidth-1 spaces.


;;(defun newline-and-indent-relative ()
;;  "Insert a newline, then indent relative to the previous line."
;;  (interactive "*") (newline) (indent-relative))
;;(defun indent-according-to-mode () ())
;;(defalias 'newline-and-indent 'newline-and-indent-relative)
;;(defun my-c-hook ()
;;  (defalias 'c-electric-backspace 'delete-backward-char)
;;  (defun c-indent-command () (interactive "*") (self-insert-command 1)))
;;(add-hook 'c-mode-common-hook 'my-c-hook)
;;(defun indent-region-with-tab ()
;;  (interactive)
;;  (save-excursion
;;  (if (< (point) (mark)) (exchange-point-and-mark))
;;  (let ((save-mark (mark)))
;;    (if (= (point) (line-beginning-position)) (previous-line 1))
;;      (goto-char (line-beginning-position))
;;        (while (>= (point) save-mark)
;;	       (goto-char (line-beginning-position))
;;			  (insert "\t")
;;				  (previous-line 1)))))
;;  ;;(global-set-key [f4] 'indent-region-with-tab)
;;(global-set-key [?\C-x tab] 'indent-region-with-tab)
;;(defun unindent-region-with-tab ()
;;  (interactive)
;;  (save-excursion
;;  (if (< (point) (mark)) (exchange-point-and-mark))
;;  (let ((save-mark (mark)))
;;    (if (= (point) (line-beginning-position)) (previous-line 1))
;;      (goto-char (line-beginning-position))
;;        (while (>= (point) save-mark)
;;	       (goto-char (line-beginning-position))
;;			  (if (= (string-to-char "\t") (char-after (point))) (delete-char 1))
;;			      (previous-line 1)))))


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



;; 2023-02-06 : tkooda : workaround "Wrong type argument: char-or-string-p" error when pasting (unicode?) characters, like dashes or left/right-quotes?:  https://discourse.julialang.org/t/terminal-emacs-woes-paste-julia-output-gives-char-or-string-p-error-u2502-displays-etc/8981/6
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(define-coding-system-alias 'UTF-8 'utf-8)


