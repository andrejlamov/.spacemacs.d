(defun spacemacs/java-maven-test-class ()
  (interactive)
  (eclim-maven-run (concat "-q clean test -DtrimStackTrace=false -Dtest=" (file-name-base) "*")))
