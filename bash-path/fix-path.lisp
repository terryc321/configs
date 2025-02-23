

(defpackage #:clean
  (:use #:cl))

(in-package #:clean)

(ql:quickload :uiop)
(uiop:getenv "HOME")
(uiop:getenv "PATH")
;; split on : character



;; adapted from https://lispcookbook.github.io/cl-cookbook/strings.html
;; split-by-one-space to split-by-one-colon
(defun split-by-one-colon (string)
    "Returns a list of substrings of string
    divided by ONE space each.
    Note: Two consecutive spaces will be seen as
    if there were an empty string between them."
    (loop for i = 0 then (1+ j)
          as j = (position #\: string :start i)
          collect (subseq string i j)
          while j))

(defun my-remove-duplicates (xs)  
  (cond
    ((null xs) xs)
    (t (let ((x (car xs))
	     (y (cdr xs)))
	 (cond
	   ((member x y :test #'string-equal) (my-remove-duplicates y))
	   (t (cons x (my-remove-duplicates y))))))))


(defun clean-path-variable ()
  (let ((paths (split-by-one-colon (uiop:getenv "PATH"))))
    (my-remove-duplicates paths)))

#|
CL-USER> (clean::clean-path-variable)
(                                          "/opt/sbcl-2.5.1/bin"

 "/home/terry/src/smlnj2/bin"
 "/opt/java-17/openlogic-openjdk-jre-17.0.11+9-linux-x64/bin"
"~/bin/idea-IC-241.17890.1/bin"
"/opt/racket/bin"
                                              "/opt/emacs-29.3/bin"
"/opt/guile-3.0.10/bin"
 "/usr/local/sbcl-2.4.3/bin"
"/home/terry/bin/java-suite/apache-maven-3.9.6/bin"
 "/home/terry/code/lem"
"/home/terry/.qlot/bin"
"/home/terry/.cabal/bin"
 "/home/terry/.ghcup/bin"
"/home/terry/.cargo/bin"
 "/home/terry/.opam/default/bin"
"/home/terry/.local/bin"
"/home/terry/bin"
 "/home/terry/.guix-profile/bin"
"/home/terry/.config/guix/current/bin"
                                                   "/usr/local/bin"
                                                     "/usr/bin"
                                                       "/bin"
"/usr/local/games"
"/usr/games"
 "/home/terry/.local/share/coursier/bin"
"/opt/node-v22.3.0-linux-x64/bin"
 "/home/terry/bin/dot-net-6/.dotnet"
"/opt/gradle/gradle-8.8/bin"
 "/home/terry/src/dafny/dafny/Scripts"
"/usr/local/Gambit/bin"
 "/home/terry/src/nim/nim-2.0.8/bin"
"/usr/local/plan9/bin"
"/home/terry/.elan/bin"
 "/home/terry/.idris2/bin"
 "/home/terry/src/smlnj/bin"
 "/home/terry/src/squeak/Squeak6.0-22148-64bit-202312181441-Linux-x64/bin"
 "/home/terry/bin/glamorous-toolkit/bin")
|#

(defun join-paths (xs)
  (cond
    ((null xs) "")
    (t (let ((a (car xs))
	     (b (cdr xs)))
	 (cond
	   ((null b) a)
	   (t (concatenate 'string a ":" (join-paths b))))))))

(defparameter result
  (join-paths (list 
	       "/opt/sbcl-2.5.1/bin"
	       "/opt/emacs-29.3/bin"
	       "/usr/local/bin"
	       "/usr/bin"
	       "/bin")))







