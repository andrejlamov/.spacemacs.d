(advice-add 'cider-refresh--handle-response :after #'my-clojure/test-or-show-refresh-log)
(advice-add 'cider-refresh :before #'my-clojure/save-if-file-buffer)
