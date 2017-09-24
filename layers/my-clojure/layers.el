(configuration-layer/declare-layer
 '(clojure :variables
           cider-cljs-lein-repl "(do (require 'figwheel-sidecar.repl-api)
                                     (figwheel-sidecar.repl-api/start-figwheel!)
                                     (figwheel-sidecar.repl-api/cljs-repl))"
           clojure-enable-fancify-symbols t))
