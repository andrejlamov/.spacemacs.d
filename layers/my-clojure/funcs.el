(defvar my-clojure/cljs-expr "")

(defun my-clojure/test-or-show-refresh-log (response _log-buffer)
  (let ((status (nrepl-dbind-response response
                    (out err reloading status error error-ns after before)
                  status)))
    (pcase status
      ('("ok")    (progn
                      (cider-test-run-project-tests)
                      (when (not (string= "" my-clojure/cljs-expr))
                        (my-clojure/eval-in-cljs-repl my-clojure/cljs-expr))))
      ('("error") (popwin:popup-buffer "*cider-refresh-log*"))
      (other nil))))

(defun my-clojure/save-if-file-buffer (&optional args)
  (when (buffer-file-name)
    (save-buffer)))

(defun my-clojure/set-cljs-expr (expr)
  (interactive "Mcljs expr: ")
  (setq my-clojure/cljs-expr expr)
  (my-clojure/eval-in-cljs-repl expr))

(defun my-clojure/eval-in-cljs-repl (expr)
  (with-current-buffer (cider-current-repl-buffer "cljs")
    (end-of-buffer)
    (insert expr)
    (cider-repl-return)))
