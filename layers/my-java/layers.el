(configuration-layer/declare-layer
 '(java :variables
        java-backend 'eclim
        java--ensime-modes '() ; don't mix eclim and ensime
        eclim-eclipse-dirs "~/env/eclipse"
        eclim-executable "~/env/eclipse/eclim"))
