;load-path
(add-to-list 'load-path "/usr/local/Cellar/emacs/26.1_1/share/emacs/26.1/lisp/")
(add-to-list 'load-path "/usr/local/Cellar/global/6.6.3/share/gtags/") ;;gtags
(add-to-list 'load-path "/usr/local/bin/global")
(add-to-list 'load-path "/Users/Toshi/.emacs.d/elpa/async-20181224.454")
(add-to-list 'load-path "/Users/Toshi/.emacs.d/elpa/helm-core-20190406.1826/")
(add-to-list 'load-path "/Users/Toshi/.emacs.d/elpa/helm-20190405.1842/")

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
(show-paren-mode t)       ;;bliking kakko
	
;;Line highlight settings
;(global-hl-line-mode t)

;;Key settings
(define-key global-map [?\M-¥] "\\")		            ;;Command "option+¥" is "\".
(global-set-key "\C-h" 'backward-delete-char)	            ;;Command "control + h" is "BS".
(keyboard-translate ?\C-h ?\C-?)                            ;;Command "control + h" is "BS".
(define-key key-translation-map (kbd "C-h") (kbd "<DEL>"))  ;;Command "control + h" is "BS".

;;Tab settings
(setq-default tab-width 4)
(setq-default indent-tabs-mode t)
(setq indent-tabs-mode t)
(global-set-key "\C-i"
		'(lambda ()
		   (interactive)
		   (insert "\t")))

;;Cmode & C++mode Settings;
(setq c-basic-offset 4)


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
(setq recentf-max-saved-items 2000) ;; 2000ファイルまで履歴保存する
(setq recentf-auto-cleanup 'never)  ;; 存在しないファイルは消さない
(setq recentf-exclude '("/recentf" "COMMIT_EDITMSG" "/.?TAGS" "^/sudo:" "/\\.emacs\\.d/games/*-scores" "/\\.emacs\\.d/\\.cask/"))
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
(recentf-mode 1)
;(bind-key "C-c t" 'recentf-open-files)


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


(when (eq system-type 'darwin)
  (setq ns-command-modifier (quote meta)))

(setq mac-pass-control-to-system nil)
(setq mac-pass-command-to-system nil)
(setq mac-pass-option-to-system nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (helm undo-tree vdiff flymake))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
