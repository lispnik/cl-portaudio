(defsystem "cl-portaudio"
  :licence "MIT"
  :version "1.0.0"
  :author "Michael Filonenko <filonenko.mikhail@gmail.com>"
  :depends-on ("cffi" "ffa")
  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "portaudio"))))
  :description "This package contains bindings to @a[http://portaudio.com/]{PortAudio}. PortAudio is a free, cross-platform, open-source, audio I/O library."
  :in-order-to ((test-op (test-op "cl-portaudio/tests"))))

(defsystem cl-portaudio/tests
  :depends-on ("cl-portaudio")
  :components ((:module "t"
                :serial t
                :components ((:file "package")
                             (:file "tests"))))
  :description "This package contains test/examples for cl-portaudio."
  :perform (test-op (o c)
             (symbol-call :portaudio-tests :test-read-write-echo)
             (symbol-call :portaudio-tests :test-read-write-converted-echo)))

(defsystem "cl-portaudio/doc"
  :depends-on ("cl-portaudio" "atdoc")
  :components ((:module "doc"
                :serial t
                :components ((:file "generate-doc"))))
  :description "Generate documentation using atdoc")

