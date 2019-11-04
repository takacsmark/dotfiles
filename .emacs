;;;; General workspace and environment
;; Disables the startup message
(setq inhibit-startup-message t)

;; Sets up package archives and use-package for general purposes
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Window settings 
(global-display-line-numbers-mode)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(window-divider-mode -1)
(set-face-attribute 'default nil :height 180)
(global-visual-line-mode)
(global-auto-revert-mode t)

;; Key bindings to move between windows with Vim keys
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-down)

;; Stores all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Use path from shell (won't work on Windows)
(use-package exec-path-from-shell
  :ensure t :config (exec-path-from-shell-initialize))

;; Breaks long lines
(global-visual-line-mode t)

;; Spell Check
(setq ispell-program-name "/usr/local/Cellar/ispell/3.4.00/bin/ispell")


;;;; Evil mode
(use-package evil
  :ensure t
  :config

  (evil-mode 1)

  ;; Fix Vim up and down bindings in visual line mode
  (evil-define-minor-mode-key 'motion 'visual-line-mode "j" 'evil-next-visual-line)
  (evil-define-minor-mode-key 'motion 'visual-line-mode "k" 'evil-previous-visual-line)

  (use-package evil-org
    :ensure t
    :config

    (evil-org-set-key-theme
     '(textobjects insert navigation additional shift todo heading))

    (add-hook 'org-mode-hook (lambda () (evil-org-mode))))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1)))

(setq org-todo-keywords
    '((sequence "TODO" "STARTED" "|" "DONE")))
(setq org-todo-keyword-faces
    '(("STARTED" . "cornflower blue")))

(setq org-babel-python-command "python3")
(setq org-confirm-babel-evaluate nil)

;; iPython
;;(use-package ob-ipython
;;  :ensure t
;;  :config
;;  (setq ob-ipython-command "/usr/local/anaconda3/bin/jupyter"))

;; Emacs Speaks Statistics (ess) used for R
(use-package ess
  :ensure t)
;; Languages for Orgmode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)
   (R . t)
   (shell . t)
   (plantuml . t)
   ))

(setq org-plantuml-jar-path
      (expand-file-name "~/development/plantuml.jar"))

;;;; Export settings
(setq org-export-coding-system 'utf-8)
(setq org-export-allow-bind-keywords t)
(add-to-list 'org-latex-packages-alist '("" "listingsutf8"))

(use-package ox-pandoc
  :ensure t
  :after org
  :defer t
  :config
  (setq org-pandoc-options '((standalone . t)))
  (setq org-pandoc-options-for-latex-pdf '((pdf-engine . "pdflatex"))))

(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)


;;;; PDF preview
(setenv "PKG_CONFIG_PATH" "/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig")

(use-package pdf-tools
  :ensure t)

(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)

;;;; PROGRAMMING
;;; Python editing
(use-package elpy
  :ensure t
  :config
  (elpy-enable))


;;;; Custom variables set in EMACS
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (adwaita)))
 '(custom-safe-themes
   (quote
    ("274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(display-line-numbers-type (quote relative))
 '(global-visual-line-mode t)
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(org-agenda-files (quote ("~/org/index.org")))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (ox-org ox-pandoc pdf-tools ox-latex ob-shell ob-sh ess elpy multi-term wind-move ob-ipython sml-modline sml-modeline sml-mode docker-compose-mode yaml-mode dockerfile-mode magit which-key try all-the-icons exec-path-from-shell emmet-mode evil-surround org-bullets ein markdown-mode+ markdown-mode org-link-minor-mode helm evil-visual-mark-mode)))
 '(safe-local-variable-values
   (quote
    ((eval add-hook
	   (quote TeX-after-compilation-finished-functions)
	   (function TeX-revert-document-buffer))
     (eval add-hook
	   (quote after-save-hook)
	   (quote org-publish-current-file)
	   t t)
     (eval add-hook
	   (quote after-save-hook)
	   (quote org-latex-publish-to-pdf)
	   t t))))
 '(show-paren-mode t)
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify))
 '(visible-bell nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(set-keyboard-coding-system nil)

