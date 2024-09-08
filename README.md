# Welcome to the Lisp Insult Generator #

This project is a Common Lisp implementation of the classic Shakespearean insult generator from long ago. The
development environment used is Emacs, SBCL, Quicklisp and ASDF. Thus far, the code has only been exercised using SBCL,
although the philosophy is to adhere to the CLtL2 "standard".

## Quick Start ##

First, you'll want to create a custom SBCL core containing, at a minimum, these packages:

- SB-BSD-SOCKETS
- SB-POSIX
- SB-INTROSPECT
- SB-CLTL2
- ASDF

Note that ASDF now includes the UIOP package, which is directly used here for string tokenization. Optionally, you can
load all this stuff manually.

Now, from this repository's root directory, run: `(ql:quickload "FJB")`. Assuming all went well, the FJB package should
be loaded and ready. Now, try insulting yourself: `(fjb:insult-me)`. You should feel humbled and/or entertained by the
response:

```
CL-USER> (fjb:insult-me)
Thou loggerheaded hasty-witted clack-dish!
T
CL-USER>
```

## Creating a Custom SBCL Core ##

For this project, it's much easier to load if you have the proper SBCL core file configured. The easiest way is to
create a load file that contains the following, adjusting pathnames according to your preferences. Past the following
code into a file - call it _frodo.lisp_, and run: `sbcl --load frodo.lisp`. You should now have your custom core ready
to go:

```
(in-package :cl-user)

(require :sb-posix)

(mapc #'require '(:sb-bsd-sockets :sb-posix :sb-introspect :sb-cltl2 :asdf))

#-quicklisp
(let ((quicklisp-main (merge-pathnames "devel/lisp/quicklisp.lisp" (user-homedir-pathname)))
      (quicklisp-init (merge-pathnames "quicklisp/setup.lisp" (user-homedir-pathname))))
  (load quicklisp-main)
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))

(save-lisp-and-die (concatenate 'string (sb-posix:getcwd) "/sbcl/sbcl-bosshog.core"))
```

Now you should have what's needed to load this system: `sbcl --core ~/sbcl/sbcl-bosshog.core`. Of course, using Emacs
SLIME will make things even more pleasant.

## Supported Lisp Implementations ##

- _SBCL_: Version 2.4.8 is the baseline.

## Author ##
- [David E. Young](mailto:sporty-iron883@protonmail.com)
