(setq inhibit-startup-message t)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(use-package which-key
  :ensure t
  :config (which-key-mode))

;; General workspace and environment 
(global-display-line-numbers-mode)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(window-divider-mode -1)
(set-face-attribute 'default nil :height 180)
(global-visual-line-mode)

(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-j") 'windmove-down)

;; Terminal 
(setq explicit-shell-file-name "/usr/local/bin/bash")
(add-hook 'term-mode-hook (lambda () (display-line-numbers-mode -1)))


;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; smart mode line
;; (use-package sml-modeline
;; 	     :ensure t
;; 	     :config
;; (sml-modeline-mode))

;; use path from shell
(use-package exec-path-from-shell
  :ensure t :config (exec-path-from-shell-initialize))

(global-visual-line-mode t)
;; Evil mode
(use-package evil
  :ensure t
  :config

  (evil-mode 1)

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


;; Org mode 
;; (require 'org)
;; (require 'org-bullets)
;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-todo-keywords
      '((sequence "TODO" "STARTED" "|" "DONE")))
(setq org-todo-keyword-faces
      '(("STARTED" . "cornflower blue")))

(setq org-babel-python-command "python3")
(setq org-confirm-babel-evaluate nil)

(use-package ob-ipython
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ipython . t)
   ))

;; export settings
;;define-key global-map "\C-cc" 'org-capture)
(setq org-export-coding-system 'utf-8)
(setq org-export-allow-bind-keywords t)

(use-package ox-pandoc
  :ensure t)

(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

;; Neotree
;; Initial config based on https://github.com/anmonteiro/dotfiles/blob/master/.emacs.d/customizations/setup-neotree.el
(use-package neotree
  :ensure t
  :config
  
  (global-set-key [f8] 'neotree-toggle)

  ;; (use-package all-the-icons
  ;;   :ensure t)

  (setq neo-theme (if window-system 'ascii 'arrow))

  ;; every time when the neotree window is  opened, it will try to find current
  ;; file and jump to node.
  (setq-default neo-smart-open nil)

  ;; change root automatically when running `projectile-switch-project`
  ;;(setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-vc-integration '(face char))

  (setq neo-show-hidden-files t)
  (setq neo-toggle-window-keep-p t)
  (setq neo-force-change-root t)
 
  (add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

  (add-hook 'neo-after-create-hook
	    (lambda (&rest _) (display-line-numbers-mode -1)))

  (set-face-attribute 'neo-vc-added-face nil
                    :foreground "green4"))

;; Spell Check
(setq ispell-program-name "/usr/local/Cellar/ispell/3.4.00/bin/ispell")

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
 '(ido-enable-flex-matching t)
 '(ido-mode (quote both) nil (ido))
 '(org-agenda-files (quote ("~/org/index.org")))
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(package-selected-packages
   (quote
    (multi-term wind-move ox-pandoc ob-ipython sml-modline sml-modeline sml-mode docker-compose-mode yaml-mode dockerfile-mode magit which-key try all-the-icons exec-path-from-shell emmet-mode neotree evil-surround org-bullets ein markdown-mode+ markdown-mode org-link-minor-mode dracula-theme helm evil-visual-mark-mode)))
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

