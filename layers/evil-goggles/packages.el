(defconst evil-goggles-packages
  '(evil-goggles))

(defun evil-goggles/init-evil-goggles ()
  (use-package evil-goggles :defer t))

(defun evil-goggles/post-init-evil-goggles ()
  (evil-goggles-mode)
  (evil-goggles-use-diff-faces))
