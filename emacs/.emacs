;;load-path
(add-to-list 'load-path "/usr/local/Cellar/emacs/26.1_1/share/emacs/26.1/lisp/")
(add-to-list 'load-path "/usr/local/Cellar/global/6.6.3/share/gtags/") ;;gtags
(add-to-list 'load-path "/usr/local/bin/global")
(add-to-list 'load-path "/Users/Toshi/.emacs.d/elpa/async-20181224.454")
(add-to-list 'load-path "/Users/Toshi/.emacs.d/elpa/helm-core-20190406.1826/")
(add-to-list 'load-path "/Users/Toshi/.emacs.d/elpa/helm-20190405.1842/")
(add-to-list 'load-path "/Users/Toshi/.emacs.d/elisp/")

;;Region overwrite mode
(delete-selection-mode t)
;;
(defun highlight-current-word()
  "highlight the word under cursor"
  (interactive)
  (let (head-point tail-point word)
    (skip-chars-forward "-_A-Za-z0-9")
    (setq tail-point (point))
    (skip-chars-backward "-_A-Za-z0-9")
    (setq head-point (point))
    (setq word (buffer-substring-no-properties head-point tail-point))
    (setq isearch-string word)
    (isearch-search-and-update)))

(add-hook 'isearch-mode-hook 'highlight-current-word)

;;Whole line delete
(global-set-key (kbd "M-k") 'kill-whole-line)

;;Scroll setting
(setq scroll-conservatively 1)

;;auto-install
;(add-to-list 'load-path "~/.emacs.d/auto-install/")
;(require 'auto-install)
;(auto-install-update-emacswiki-package-name t)
;(auto-install-compatibility-setup)
;(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;(require 'open-junk-file)
;(require 'lispcmp)

;;redo+
(require 'redo+)
(global-set-key (kbd "M-_") 'redo)

;; doxymacs mode
(require 'doxymacs)

;; custom c-mode hook for doxymacs
(defun doxy-custom-c-mode-hook ()
  (doxymacs-mode 1)
  (setq doxymacs-doxygen-style "JavaDoc")
  (setq doxymacs-command-character "@")
  )

(add-hook 'c-mode-common-hook 'doxy-custom-c-mode-hook)

;helm
(require 'helm)

;Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;(require 'melpa)

;;Normal Settingsp
;(package-initialize)
;;(require 'install-elisp)
;;(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;;Line number settings
(require 'linum) ;;include linum
(global-linum-mode t)					;;row number display
(setq linum-format "%4d ")

;;Column number Settings
(column-number-mode t)

;;Cursor blinking
(blink-cursor-mode t)
(show-paren-mode t)       ;;bliking kakkon
(setq cursor-type 'box)
;(set-cursor-color "#00FF00")

;;Line highlight settings
(global-hl-line-mode t)

;;Face settings
(progn
	(set-face-foreground 'hl-line  "white")	
	(set-face-background 'hl-line "color-236")
	(set-face-foreground 'region "RoyalBlue")
	(set-face-background 'region "white")
	(set-face-background 'show-paren-match "SandyBrown")
	(set-face-foreground 'show-paren-match "navy blue")
	)

;;Key settings
(define-key global-map [?\M-¥] "\\")		            ;;Command "option+¥" is "\".
(global-set-key "\C-h" 'backward-delete-char)	            ;;Command "control + h" is "BS".
(keyboard-translate ?\C-h ?\C-?)                            ;;Command "control + h" is "BS".
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))  ;;Command "control + h" is "BS".


;;Tab settings
(setq default-tab-width 4)	;default-tab
(setq-default tab-width 4)  ;global-tab-width
(setq-default indent-tabs-mode t)
(setq indent-tabs-mode t)
(setq tab-always-indent nil)
(global-set-key "\C-i"
		'(lambda ()
		   (interactive)
		   (insert "\t")))

;;Cmode & C++mode Settings;
(setq c-basic-offset 4)
(setq c-tab-always-indent t)
(defun my-c-c++-mode-init ()
  (setq c-basic-offset 4)
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent nil)
  )
(add-hook 'c-mode-Hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

;;Python settings
(add-hook 'python-mode-hook
		  '(lambda()
			 (setq indent-tabs-mode t)
			 (setq indent-level 4)
			 (setq python-indent 4)
			 (setq tab-width 4)))

;;Backup file disable
(setq make-backup-files nil)
(setq auto-save-default nil)

;gtags settings
(require 'gtags)
(global-set-key "\C-t" 'gtags-find-tag-from-here)
(global-set-key "\M-r" 'gtags-find-rtag)
(global-set-key "\M-s" 'gtags-find-symbol)
(global-set-key "\M-t" 'gtags-pop-stack)

;;Finding settings
(setq completion-ignore-case t)

(require 'undo-tree)
(global-undo-tree-mode)

;Recent file
(require 'recentf)
(require 'recentf-ext)
(setq recentf-max-saved-items 2000) ;; 2000ファイルまで履歴保存する
(setq recentf-auto-cleanup 'never)  ;; 存在しないファイルは消さない
(setq recentf-exclude '("/recentf" "COMMIT_EDITMSG" "/.?TAGS" "^/sudo:" "/\\.emacs\\.d/games/*-scores" "/\\.emacs\\.d/\\.cask/"))
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
;(bind-key "C-c t" 'recentf-open-files)

(require 'cl-lib)
(cl-dolist (hook (list
				  'c-mode-hook
				  'c++mode-mode-hook
				  'objc-mode-hook
				  'emacs-lisp-mode-hook))
  (add-hook hook (lambda ()
				   ;;auto-complete
				   ;(require 'auto-complete-config)
				   ;(ac-config-default)
				   ;(ac-set-trigger-key "TAB")
				   ;(global-auto-complete-mode t)
				   ;(require 'auto-complete-c-headers)
				   ;(add-to-list 'ac-sources 'ac-source-c-headers)

				   ;;company
				   (require 'company)
				   (global-company-mode)
				   (setq company-idle-delay 0)
				   (setq company-minimum-prefix-length 2)
				   (setq company-selection-wrap-around t))))


;;irony
(require 'irony)
(require 'company)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++mode-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'emacs-lisp-mood-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-to-list 'company-backends 'company-irony) ;backend
(add-to-list 'company-backends 'company-dabbrev-code)

;;window moving settings
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <right>") 'windmove-right)

;Show TAB & SPACE
;(require 'whitespace)
;(setq whitespace-style '(face           ; faceで可視化
;                         trailing       ; 行末
;                         tabs           ; タブ
;;                         empty          ; 先頭/末尾の空行
;                         space-mark     ; 表示のマッピング
;                         tab-mark
;                         ))
;(setq whitespace-display-mappings
;      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
;(global-whitespace-mode 1)

;;-----------------------------------------------------------------

(put 'set-goal-column 'disabled nil)
;;custom setting
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
(when (fboundp 'mac-add-ignore-shortcut) (mac-add-ignore-shortcut'(control?)))
(column-number-mode t)



(put 'upcase-region 'disabled nil)

;;For mac settings
(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))

;(setq ns-command-modifier (quote meta))
;(setq ns-alternate-modifier (quote meta))

;(setq mac-command-modifier 'meta)
;(setq mac-option-modifier 'alt)

(setq mac-pass-control-to-system nil)
(setq mac-pass-command-to-system nil)
(setq mac-pass-option-to-system nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (manoj-dark)))
 '(package-selected-packages
   (quote
	(company-irony irony ggtags auto-complete-clang auto-complete-c-headers auto-complete helm undo-tree vdiff flymake))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
