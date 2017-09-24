(spacemacs|use-package-add-hook eclim
  :post-config
  (progn
    (spacemacs/set-leader-keys-for-major-mode 'java-mode
      "mc" 'my-java/maven-test-class)))
