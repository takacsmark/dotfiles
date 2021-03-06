;; Package management
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(setq package-archive-priorities
  '(("melpa-stable" . 1)
    ("melpa" . 0)))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Use shell path
(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize)))

;; IDE settings
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(window-divider-mode -1)
(setq pop-up-windows nil)

;; Buffer editor settings
(global-display-line-numbers-mode)
(setq display-line-numbers-type "relative")
(global-visual-line-mode t)
(global-auto-revert-mode t) ; reverts files when they change on disk
(show-paren-mode t) ; show matching parenthesis
(setq uniquify-buffer-name-style 'post-forward)

;; Productivity tweaks
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Store backup and autosave files in the tmp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Spell Check
(setq ispell-program-name "/usr/local/Cellar/ispell/3.4.01/bin/ispell")


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


;;;; Orgmode
(setq org-todo-keywords
	'((sequence "TODO" "STARTED" "|" "DONE")))    

(setq org-babel-python-command "python3")
(setq org-confirm-babel-evaluate nil)
(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

;; Language settings
(setq org-plantuml-jar-path
    (expand-file-name "~/development/plantuml.jar"))

(org-babel-do-load-languages
    'org-babel-load-languages
    '((python . t)
    (R . t)
    (shell . t)
    (plantuml . t)
))

;; Export settings
(setq org-export-coding-system 'utf-8)
(setq org-export-allow-bind-keywords t)
(add-to-list 'org-latex-packages-alist '("" "listingsutf8"))

;; Pandoc pre-requisites and ox-pandoc for epub publishing
(use-package dash
  :ensure t)

(use-package ht
  :ensure t)

(use-package ox-pandoc
  :load-path "~/.emacs.d/contrib/ox-pandoc/"
  :after (dash ht)
  :ensure t
  :defer t)

;;;; Document editing
;; Markdown mode
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown")
  :config
  (custom-set-variables
   '(markdown-command "/usr/local/bin/pandoc")))


;; PDF tools
(setenv "PKG_CONFIG_PATH" "/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig")

(use-package pdf-tools
  :ensure t
  :config
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer))

;;;; Programming
;; Python editing
(use-package elpy
  :ensure t
  :config
  (elpy-enable))

;; Emacs Speaks Statistics (ess) used for R
(use-package ess
  :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   '("0511293cecfff89edd24781b0c31b42ee8017ae3a53c292befd51ac94a63c031" "197cefea731181f7be51e9d498b29fb44b51be33484b17416b9855a2c4243cb1" default))
 '(fci-rule-color "#4C566A")
 '(markdown-command "/usr/local/bin/pandoc")
 '(org-pandoc-options '((standalone . t) (mathjax . t)))
 '(package-selected-packages
   '(nordless-theme nord-theme markdown-mode ox-pandoc ess pdf-tools ob-ipython elpy evil-surround evil-org evil))
 '(safe-local-variable-values
   '((eval add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
     (eval add-hook 'after-save-hook 'org-publish-current-file t t))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
