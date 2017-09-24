(defun my-java/maven-test-class ()
  (interactive)
  (eclim-maven-run (concat "-q clean test -DtrimStackTrace=false -Dtest=" (file-name-base) "*")))

(defun my-java/add-keys ()
    (spacemacs/set-leader-keys-for-major-mode 'java-mode
      "mc" 'my-java/maven-test-class))
