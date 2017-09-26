(spacemacs|use-package-add-hook cider
  :post-config
  (progn
    (dolist (m '(clojurec-mode clojure-mode clojurescript-mode))
      (spacemacs/set-leader-keys-for-major-mode m
        "e!" 'my-clojure/set-cljs-expr))

    (advice-add 'cider-refresh--handle-response :after #'my-clojure/test-or-show-refresh-log)
    (advice-add 'cider-refresh :before #'my-clojure/save-if-file-buffer)))
