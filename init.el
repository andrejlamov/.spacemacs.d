(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; Extended layers
     my-clojure
     my-java

     ;; New layers
     evil-goggles

     ;; Layers
     parinfer
     html
     (helm :variables
           ace-jump-helm-line-autoshow-use-linum t
           ace-jump-helm-line-default-action 'select
           ace-jump-helm-line-style 'pre)
     emacs-lisp
     git
     scala
     auto-completion
     org
     (shell :variables
            shell-protext-eshell-prompt nil
            shell-defaul-shell 'eshell)
     yaml
     typescript
     (gtags :variables gtags-enable-by-default t)
     markdown
     python
     (javascript :variables
                 js-indent-level 2)
     treemacs
     docker
     react
     )
   dotspacemacs-additional-packages '()
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-use-spacelpa t
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory 'emacs-version
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-auto-generate-layout-names nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-frame-title-format "%I@%S"
   dotspacemacs-icon-title-format nil
   dotspacemacs-whitespace-cleanup nil
   dotspacemacs-zone-out-when-idle (* 2 60)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  ;; (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(ensime . "melpa-stable") package-pinned-packages)
  )

(defun dotspacemacs/user-config ()
  ;; nxml
  (setq
   nxml-child-indent 4
   nxml-attribute-indent 4)

  ;; evil lisp
  (define-key evil-insert-state-map  (kbd "C-o") #'evil-lisp-state)

  ;; parinfer
  (with-eval-after-load 'parinfer
    (define-key parinfer-mode-map (kbd "<tab>")
      (lambda ()
        (interactive)
        (parinfer-smart-tab:dwim-right)
        (parinfer-indent-instantly))))
  ;; org setup
  (with-eval-after-load 'org
    (setq org-default-notes-file (concat org-directory "/todo.org")))

  ;; spaceline
  (setq powerline-default-separator nil)

  ;; adaptive wrap
  (with-eval-after-load 'adaptive-wrap
    (setq-default adaptive-wrap-extra-indent 2))

  (add-hook 'visual-line-mode-hook
            (lambda ()
              (adaptive-wrap-prefix-mode +1)
              (diminish 'visual-line-mode)))

  (global-visual-line-mode +1)
  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
