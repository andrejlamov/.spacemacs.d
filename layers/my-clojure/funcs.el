(defun my-clojure/test-or-show-refresh-log (response _log-buffer)
  (let ((status (nrepl-dbind-response response
                    (out err reloading status error error-ns after before)
                  status)))
    (pcase status
      ('("ok")    (cider-test-run-project-tests))
      ('("error") (popwin:popup-buffer "*cider-refresh-log*"))
      (other nil))))

(defun my-clojure/save-if-file-buffer (&optional args)
  (when (buffer-file-name)
    (save-buffer)))
