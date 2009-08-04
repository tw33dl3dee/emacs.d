;;; lojban.el --- regexps, functions, commands to handle lojban text

;; Copyright (c) 2002, 2003 Michele Bini

;; Author: Michele Bini
;; Maintainer: Michele Bini <mibin@libero.it>
;; Created: 21 Nov 2002
;; Version: 0.23
;; Keywords: lojban, i18n

;; This is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

;;; Commentary:

;; This file is a library of functions, variables, regexps and
;; interactive commands for handling lojban text.

;; To enable auto-loading, add the following to your .emacs (and make
;; sure that the lojban.el file is in one of the default load paths
;; (see the load-path variable):
;;     (autoload 'lojban-parse-region "lojban" nil t)

;; You may replace the command above (lojban-parse-region) with any
;; other in this file you find useful.

;;; History:
;; v0.23 - bugfix (lojban-cc-p)
;; v0.22 - new brivla and cmene regexps; lojban-sentence-*
;; functions renamed; bugfixes: lojban-cc-p, lojban-c/cc-p,
;; lojban-brivla-p, lojban-cmene-p.
;; v0.21 - fixed another lojban-parse-region problem (thanks to xavier).
;; v0.20 - fixed problem with lojban-parse-region.

;;; Code:
(defgroup lojban nil
  "The lojban constructed language."
  :group 'languages
  :group 'i18n)

;;;; * Morphology

;;;; lerfu

(defconst lojban-word-letters "abcdefgijklmnoprstuvxyz'.,")

(defconst lojban-letter-set
  (or "a-gi-pr-vxyz'.,"
      "abcdefgijklmnoprstuvxyz'.,")
  "Set of valid letters in a lojban word.")

(defconst lojban-letter-rgx
  (or
   (concat "[" lojban-letter-set "]")
   "\\w" ;; needs a syntax table specifically set for lojban
   )
  "Regexp matching letters that may appear in a lojban word.")

(defconst lojban-non-letter-rgx
  (or
   (concat "[^" lojban-letter-set "]")
   "\\W" ;; needs a syntax table specifically set for lojban
   )
  "Regexp matching any non-lojban letter.")

(defconst lojban-middle-letter-rgx "[a-gi-pr-vxyz',]"
  "Like `lojban-letter-rgx', but excludes \".\".

Regexp matching letters that may appear in the middle of
a valsi (lojban word).")

(defconst lojban-c-letter-set (or "bcdfgj-npr-tvxz"
								  "bcdfgjklmnprstvxz")
  "Lojban consonants, not including the apostrophe.")

(defconst lojban-c-rgx (concat "[" lojban-c-letter-set "]")
  "Regexp matching lojban consonants, not including the apostrophe.")

(defconst lojban-consonants
  (string-to-list "bcdfgjklmnprstvx'")
  "List of lojban consonants.")

(defconst lojban-unvoiced-consonants (string-to-list "ptkfcsx")
  "Unvoiced lojban consonants.")

(defconst lojban-voiced-consonants (string-to-list "bdgvjz")
  "Voiced lojban consonants.")

(defconst lojban-maybe-voiced-consonants (string-to-list "lmnr")
  "Lojban consonants that can be either voiced or unvoiced.")

(defconst lojban-vowels '(?a ?e ?i ?o ?u ?y)
  "Character list of lojban vowels.")

(defconst lojban-v-letter-set "aeiou"
  "Set of lojban vowels, except y.")

(defconst lojban-v-rgx (concat "[" lojban-v-letter-set "]")
  "Regexp matching a lojban vowel, except y.")

(defconst lojban-v+-rgx (concat "[" lojban-v-letter-set "y]")
  "Regexp matching a lojban vowel, including y.")

(defconst lojban-diphthongs (list "ai" "ei" "oi" "au")
  "List of valid lojban diphthongs.")

(defconst lojban-diphthongs+-rgx
  (regexp-opt
   (list "ai" "ei" "oi" "au" "ia" "ie" "ii" "io" "iu" "ua" "ue" "ui"
		 "uo" "uu" "iy" "uy"))
  "Regexp matching valid diphthongs in lojban and lojbanized words.")

(defconst lojban-vv-letters
  (append lojban-diphthongs
		  (list
		   "a'a" "a'e" "a'i" "a'o" "a'u"
		   "e'a" "e'e" "e'i" "e'o" "e'u"
		   "i'a" "i'e" "i'i" "i'o" "i'u"
		   "o'a" "o'e" "o'i" "o'o" "o'u"
		   "u'a" "u'e" "u'i" "u'o" "u'u"))
  "Valid vowel pairs, including diphthongs.")

(defconst lojban-vv-rgx
  (regexp-opt lojban-vv-letters))
;;"[aeiou]'[aeiou]")

(defconst lojban-cc-letters
  '("bl" "br" "cf" "ck" "cl" "cm" "cn" "cp"
    "cr" "ct" "dj" "dr" "dz" "fl" "fr" "gl"
    "gr" "jb" "jd" "jg" "jm" "jv" "kl" "kr"
    "ml" "mr" "pl" "pr" "sf" "sk" "sl" "sm"
    "sn" "sp" "sr" "st" "tc" "tr" "ts" "vl"
    "vr" "xl" "xr" "zb" "zd" "zg" "zm" "zv")
  "Valid initial consonant pairs.")

(defconst lojban-cc-rgx
  (regexp-opt lojban-cc-letters t)
  "Regexp matching valid initial consonant pairs.")

(defun lojban-cc-p (a b)
  "Return true if A and B constitute a valid initial consonant pair."
  (or
   (and (memq a '(?b ?f ?g ?k ?m ?p ?v ?x)) (memq b '(?l ?r)))
   (and (memq a '(?c ?s)) (memq b '(?f ?k ?l ?m ?n ?p ?r ?t)))
   (and (memq a '(?j ?z)) (memq b '(?b ?d ?g ?m ?v)))
   (and (eq a ?d) (memq b '(?j ?r ?z)))
   (and (eq a ?t) (memq b '(?c ?r ?s)))))

(defun lojban-c/c-p (a b)
  "Return true if A and B constitute a valid consonant pair."
  (and
   (not (eq a b))
   (or (memq a lojban-maybe-voiced-consonants)
       (memq b lojban-maybe-voiced-consonants)
       (not
		(or
		 (and (memq a lojban-voiced-consonants)
			  (memq b lojban-unvoiced-consonants))
		 (and (memq a lojban-unvoiced-consonants)
			  (memq b lojban-voiced-consonants)))))
   (not (and (memq a '(?c ?j ?s ?z)) (memq b '(?c ?j ?s ?z))))
   (not (or (and (eq b ?x) (memq a '(?c ?k)))
			(and (eq a ?x) (memq b '(?c ?k)))
			(and (eq a ?m) (eq b ?z))))))

(defconst lojban-c/c-rgx (concat lojban-c-rgx lojban-c-rgx)
  "Regexp matching consonant pairs, with eventual false positives.
Use `lojban-c/c-p' for an exact discrimination.")

(defun lojban-c/cc-p (a b c)
  "Return true if A, B and C constitute a valid consonant triple.
The first two letters should constitute a valid consonant pair, the
last two a valid initial consonant pair."
  (and (lojban-c/c-p a b) (lojban-cc-p b c)
       (not (and (eq a ?n)
				 (or (and (eq b ?d)
						  (memq c '(?j ?z)))
					 (and (eq b ?t)
						  (memq c '(?c ?z))))))))

(defconst lojban-valsi-rgx
  (concat "\\.?" lojban-middle-letter-rgx "+" "\\.?")
  "Regexp matching a lojban word, with eventual false positive.

See also `lojban-brivla-rgx'.")

;;;; cmavo

(defconst lojban-cmavo-rgx
  (concat
   "\\(\\(\\.\\|" lojban-c-rgx "\\|\\<\\)"
   lojban-v+-rgx "\\('?" lojban-v+-rgx "\\)*\\.?\\)")
  "Regexp matching cmavo.
Standard cmavo are of the form VV, CV or CVV.
Cmavo with more than two vowels or with \"y\" are also recognized,
including \"Cy\", \".y.\", \"y'y\".

See also `lojban-compound-cmavo-rgx'.")

(defconst lojban-compound-cmavo-rgx
  (concat lojban-cmavo-rgx "+\\>")
  "Regexp matching a single or compound cmavo.

See also `lojban-cmavo-rgx', `lojban-brivla-rgx'.")

(defconst lojban-compound-cmavo-start-rgx
  (concat lojban-cmavo-rgx "*")
  "Regexp matching zero, single or compound cmavo (without end word marker).

See also `lojban-cmavo-rgx', `lojban-compound-cmavo-rgx'.")

(defconst lojban-compound-cmavo-cont-rgx
  (concat lojban-cmavo-rgx "*\\>")
  "Regexp matching continuation of a compound cmavo (contains end work marker).

See also `lojban-cmavo-rgx', `lojban-compound-cmavo-start-rgx'.")

(defconst lojban-digit-rgx
  (regexp-opt 
   (list  "no"   "pa"   "re"   "ci"   "vo"   "mu"   "xa"   "ze"    "bi"  "so" 					; PA1: numbers
		  "dau"  "fei"  "gai"  "jau"  "rei"  "xei"  "vai"  										; PA2: hex
		  "ce'i" "fi'u" "ki'o" "ma'u" "ni'u" "pi"   "pi'e" "ra'e" 								; PA3: signs
		  "da'a" "du'e" "ji'i" "rau"  "ro"   "so'a" "so'e" "so'i" "so'o" "so'u" "su'e" "su'o"	; PA4: quantities
		  "ci'i" "ka'o" "pai"  "te'o" "tu'o"													; PA5: constants
		  "gei"																					; VUhU2: 10^
		  ;;; excluded: PA3: za'u (greater), me'i (less); PA5: no'o (avg) xo (number question)
		  )
   t))

(defconst lojban-number-rgx
  (concat lojban-digit-rgx "+"))

(defvar lojban-UI-rgx
  (concat "\\(\\.\\|\\<\\)" lojban-v-rgx "'?" lojban-v-rgx
		  "\\(cui\\|nai\\)?")
  "Regexp matching attitudinal indicators.")

(defun lojban-split-compound-cmavo (s)
  "Split the compound cmavo S into individual cmavo."
  (let ((n 0) (r (list)))
    (while (string-match lojban-cmavo-rgx s n)
      (setq r (cons (match-string 0 s) r))
      (setq n (match-end 0)))
    (reverse r)))


(defun lojban-valsi-p (s &optional raise-error)
  "Return t if S is a morphologically valid lojban word.

If RAISE-ERROR is non-nil, signal a specific error rather than just
returning nil if the word is not recognized as valid."
  ;; check consonant clusters
  (when (string-match "[,\\.]" s)
    (when (string-match "^\\.?\\(.*\\)\\.?$" s)
      (setq s (match-string 1 s)))
    (setq s (apply 'string (delq ?, (string-to-list s)))))
  (and
   (or
    (not (string-match lojban-non-letter-rgx s))
    (when raise-error
      (error "Non lojban letter in word: %s" (match-string 0 s))))
   (or
    (not (string-match "\\." s))
    (when raise-error
      (error "Word is split by a pause!")))
   (or
    (not
     (string-match
      (eval-when-compile
		(concat "\\(" lojban-c-rgx "\\)\\1")) s))
    (when raise-error
      (error "Double consonant in word: %s!"
			 (match-string 1 s))))
   (let ((ok t)
		 (p 0))
     ;; consonant clusters
     (while (and ok
				 (string-match
				  (eval-when-compile
					(concat "[bcdfgjkpstvxz][bcdfgjkpstvxz]+"))
				  s p))
       (let ((b (match-beginning 0))
			 (e (match-end 0)))
		 (let ((d (- e b)))
		   (cond
			((= d 2)
			 (let ((x (aref s b))
				   (y (aref s (+ b 1))))
			   (or (if (= b 0) (lojban-cc-p x y)
					 (lojban-c/c-p x y))
				   (when raise-error
					 (error "Invalid consonant pair: %c %c!"
							x y))
				   (setq ok nil))))
			((= d 3)
			 (and
			  (or (> b 0)
				  (when raise-error
					(error
					 "The word starts with a consonant triple!"))
				  (setq ok nil))
			  (let ((x (aref s b))
					(y (aref s (+ b 1)))
					(z (aref s (+ b 2))))
				(or (lojban-c/cc-p x y z)
					(when raise-error
					  (error "Invalid consonant triple: %c %c %c!"
							 x y z))
					(setq ok nil)))))
			(t
			 (when raise-error
			   (error
				"More than 3 consecutive (non-syllabic) consonants!")
			   (setq ok nil))))
		   (setq p e))))
     ok)))

;;;; brivla

(defconst lojban-brivla-rgx
  (concat
   "\\<\\(" lojban-c-rgx "y?" lojban-c-rgx
   "\\|\\(\\.?\\|" lojban-c-rgx "\\)" lojban-v+-rgx
   "\\(" "'?" lojban-v+-rgx "\\)*"
   lojban-c-rgx "y?" lojban-c-rgx "\\)" lojban-middle-letter-rgx "*"
   lojban-v-rgx "\\>")
  "Regexp matching a brivla, with eventual false positives.
Use `lojban-brivla-p' for an exact discrimination.

This regexp, along with `lojban-compound-cmavo-rgx' and
`lojban-cmene-rgx' should suffice to distinguish the three basic
word types in lojban. See also `lojban-compound-brivla-rgx'")

(defconst lojban-compound-brivla-rgx
  (concat "\\<" lojban-valsi-rgx "\\(\\W+zei\\W+" lojban-valsi-rgx "\\)+\\>")

  "Regexp matching a compound brivla (i.e. zei-abstraction whose parts are valsi).

See also `lojban-brivla-rgx' and `lojban-brivla-p'.")

(defun lojban-brivla-p (s &optional raise-error)
  "Return t if S is a morphologically valid brivla.

RAISE-ERROR behaves as in `lojban-valsi-p'.

See also `lojban-brivla-rgx'."
  (and
   (or
    (string-match (eval-when-compile
					(concat
					 "^" lojban-brivla-rgx "$"))
				  s)
    (when raise-error
      ;; try to detect a more specific error
      (lojban-valsi-p s t)
      (error "Valid as a lojban word, but not as a brivla!")))
   (lojban-valsi-p s raise-error)))

;;;; rafsi

;; Group number tag must not be less than group depth.
;; So, we set it to 100 to prevent any further problems.
(defconst lojban-rafsi-3-rgx
  (concat "\\(" "\\(?100:" lojban-cc-rgx lojban-v-rgx "\\)"
		  "\\|" "\\(?100:" lojban-c-rgx lojban-vv-rgx "\\)[rn]?"
		  "\\|" "\\(?100:" lojban-c-rgx lojban-v-rgx lojban-c-rgx "\\)y?" 
		  "\\)"))

(defconst lojban-rafsi-4-no-y-rgx
  (concat "\\(" lojban-cc-rgx lojban-v-rgx lojban-c-rgx
		  "\\|" lojban-c-rgx lojban-v-rgx lojban-c/c-rgx
		  "\\)"))

(defconst lojban-rafsi-4-rgx
  (concat "\\(?100:" lojban-rafsi-4-no-y-rgx "\\)y"))

(defconst lojban-rafsi-5-rgx
  (concat lojban-rafsi-4-no-y-rgx lojban-v-rgx "\\>"))

;;;; lujvo

(defun lojban-split-lujvo ()
  (interactive)
  (and 
   (lojban-brivla-p (current-word))
   (save-excursion
	 (or
	  (looking-at "\\<")
	  (backward-word))
	 (let (rafsi-list)
	   (while
		   (cond
			((looking-at lojban-rafsi-5-rgx)
			 (push (match-string-no-properties 0) rafsi-list))
			((looking-at lojban-rafsi-4-rgx)
			 (push (match-string-no-properties 100) rafsi-list))
			((looking-at lojban-rafsi-3-rgx)
			 (push (match-string-no-properties 100) rafsi-list))
			((looking-at "\\W") nil)
			(t nil))
		 (goto-char (match-end 0)))
	   (message "%s" (reverse rafsi-list))))))

;;;; gismu

(defconst lojban-gismu-rgx
  (concat "\\<" lojban-rafsi-5-rgx)
  "Regexp matching a gismu, with eventual false positives.
Use `lojban-gismu-p' for an exact discrimination.

See also `lojban-brivla-rgx'.")

(defun lojban-gismu-p (string &optional raise-error)
  "Return t if STRING is a morphologically valid gismu.

RAISE-ERROR behaves as in `lojban-valsi-rgx'.

See also `lojban-gismu-p'."
  (and
   (or
    (= (length string) 5)
    (when raise-error
      (if (< (length string) 5)
		  (error "Not a gismu: too short!")
		(error "Not a gismu: too long!"))))
   (or
    (string-match lojban-gismu-rgx string)
    (when raise-error
      (error "Not a gismu: it has neither CVCCV nor CCVCV type!")))
   (or (not (string-match "^.[aeiou]" string 0))
       (lojban-c/c-p (aref string 2) (aref string 3))
       (when raise-error
		 (error "Not a gismu: invalid consonant pair!")))))

;;;; cmene

(defconst lojban-cmene-rgx
  (concat "\\<\\.?" lojban-letter-rgx "+" lojban-c-rgx "\\.?\\>")
  "Regexp matching a cmene, with eventual false positives.
Use `lojban-cmene-p' for an exact discrimination.

See also `lojban-brivla-rgx.'.")

(defconst lojban-cmene-invalid-syllabes "\\(la\\|lai\\|doi\\)"
  "Syllables invalid in a cmene, unless preceded by a consonant.")

(defun lojban-cmene-p (s &optional raise-error)
  "Return t if S if a morphologically valid cmene (lojban name).

RAISE-ERROR behaves as in `lojban-valsi-rgx'.

See also `lojban-cmene-rgx'."
  (let ((l (length s)))
    (and (or (string-match (eval-when-compile
							 (concat
							  "^" lojban-cmene-rgx "$"))
						   s)
			 (when raise-error
			   ;; try to detect a more specific error
			   (lojban-valsi-p s raise-error)
			   (error "Valid as a lojban word, but not as a cmene!")))
		 (lojban-valsi-p s raise-error)
		 (let ((n 0) (p t))
		   (while (string-match lojban-cmene-invalid-syllabes s n)
			 (if (not (or (= n 0) (memq (aref s (- n 1))
										lojban-vowels)))
				 (setq n (match-end 0))
			   (setq n (match-end 0))
			   (unless (and
						(not (= n l))
						(or
						 (memq (aref s n) lojban-vowels)
						 (not
						  (or
						   (= (+ n 1) l)
						   (memq (aref s (+ n 1)) lojban-vowels)))))
				 (when raise-error
				   (error "Invalid syllabe in cmene")
				   (setq p nil)))))
		   p))))

(defun lojban-number-cmavo (n)
  "Return the cmavo for the number N."
  (aref ["no" "pa" "re" "ci" "vo" "mu" "xa" "ze" "bi" "so"
		 "dau" "fei" "gai" "jau" "rei" "vai"] n))

(put 'cmavo-table 'char-table-extra-slots 0)

(defconst lojban-number-char-table
  (let ((table (make-char-table 'cmavo-table)))
    (mapcar
     (lambda (a) (aset table (car a) (cadr a)))
     '((?0 "no") (?1 "pa") (?2 "re") (?3 "ci") (?4 "vo")
       (?5 "mu") (?6 "xa") (?7 "ze") (?8 "bi") (?9 "so")
       (?a "dau") (?b "fei") (?c "gai")
       (?d "jau") (?e "rei") (?f "vai")
       (?A "dau") (?B "fei") (?C "gai")
       (?D "jau") (?E "rei") (?F "vai")))
    table)
  "Table mapping number characters into cmavo.
Mappings for hexadecimal numbers are included.")


(defconst lojban-numerical-char-table
  (let ((table (make-char-table 'cmavo-table)))
    (set-char-table-parent table lojban-number-char-table)
    (mapcar
     (lambda (a) (aset table (car a) (cadr a)))
     '((?+ "ma'u") (?- "ni'u") (?. "pi") (?/ "fi'u")
       ;; (?? ra'e)
       (?% "ce'i") (?, "ki'o") (?e "gei") (?E "gei")
       (?: "pi'e")))
    table)
  "Table mapping numerical characters into cmavo.
It includes mappings from `lojban-number-char-table' and the symbols
\"+\" \"-\" \"*\" \"/\" \"%\" \",\".

Do not use this to map hexadecimal numbers, as the 'e' character is
remapped for exponential notation")

(defconst lojban-char-table
  (let ((table (make-char-table 'cmavo-table)))
    (mapcar
     (lambda (a) (aset table (car a) (cadr a)))
     '((?' ".y'y.") (?a ".abu") (?e ".ebu") (?i ".ibu") (?o ".obu")
       (?u ".ubu") (?b "by.") (?c "cy.") (?d "dy.") (?f "fy.")
       (?g "gy.") (?j "jy.") (?k "ky.") (?l "ly.") (?m "my.")
       (?n "ny.") (?p "py.") (?r "ry.") (?s "sy.") (?t "ty.")
       (?v "vy.") (?x "xy.") (?z "zy.")
       (?. "denpa bu") (?, "slaka bu") (?  "tutra bu")
       (?& "joybu")
       (?h ".y'y.bu") (?q "ky.bu") (?w "vy.bu")
       ))
    table)
  "Table mapping lojban letters and other characters into lerfu.")

(defvar lojban-describe-history nil "Lojban describe functions read history.")

(defun lojban-describe-gismu-by-rafsi (&optional rafsi short)
  (interactive "sRafsi: "))

(defun lojban-describe-gismu (&optional gismu short)
  "Look up GISMU, and return its description line as string.

With optional argument SHORT, just give a short definition.
When called interactively, show that description in the message area."
  (interactive
   (list (let* ((default-entry (current-word))
				(input (read-string
						(format "Gismu%s"
								(if (string= default-entry "")
									": "
								  (format " (default %s): " default-entry)))
						nil 'lojban-describe-history default-entry)))
		   (if (string= input "")
			   (error "No args given")
			 input))))
  (let ((p (lojban-gismu-lookup gismu)))
    (unless p (error "Unrecognized gismu: %s" gismu))
    (save-window-excursion
      (save-excursion
		(lojban-find-gismu-buffer)
		(save-restriction
		  (widen)
		  (goto-char (symbol-value p))
		  (let ((s
				 (if short
					 (let ((p (+ (point) 20)))
					   (buffer-substring
						p
						(save-excursion
						  (goto-char (+ p 42))
						  (if (search-backward-regexp "[^ ]" p t)
							  (match-end 0) p))))
				   (buffer-substring
					(save-excursion (beginning-of-line) (point))
					(save-excursion (end-of-line) (point))))))
			(when (interactive-p) (message s))
			s))))))

(defun lojban-describe-cmavo (&optional cmavo short)
  "Look up CMAVO, and return its description line as string.

With optional argument SHORT, just give a short definition.
When called interactively, show that description in the message area."
  (interactive
   (list (let* ((default-entry (current-word))
				(input (read-string
						(format "Cmavo%s"
								(if (string= default-entry "")
									": "
								  (format " (default %s): " default-entry)))
						nil 'lojban-describe-history default-entry)))
		   (if (string= input "")
			   (error "No args given")
			 input))))
  (let ((p (lojban-cmavo-lookup cmavo)))
    (unless p (error "Unrecognized cmavo: %s" cmavo))
    (save-window-excursion
      (save-excursion
		(lojban-find-cmavo-buffer)
		(save-restriction
		  (widen)
		  (goto-char (symbol-value p))
		  (let ((s
				 (if short
					 (let ((p (+ (point) 20)))
					   (buffer-substring
						p
						(save-excursion
						  (goto-char (+ p 42))
						  (if (search-backward-regexp "[^ ]" p t)
							  (match-end 0) p))))
				   (buffer-substring
					(save-excursion (beginning-of-line) (point))
					(save-excursion (end-of-line) (point))))))
			(when (interactive-p) (message s))
			s))))))

;;(defun lojban-describe-word-at-point)

;; paragraphs (ni'o)

(defconst lojban-paragraph-separator-rgx
  ;;"\\(^\\|[\n ]\\)\\(n\\(i'o\\|o'i\\)\\3\\)\\(^\\|[\n ]\\)"
  "\\(n\\(i'o\\|o'i\\)\\)+"
  )

(defun lojban-paragraph-forward (&optional n error limit)
  (interactive)
  (re-search-forward
   lojban-paragraph-separator-rgx
   limit (not error) n))

(defun lojban-paragraph-backward (&optional n error limit)
  (interactive)
  (re-search-backward
   lojban-paragraph-separator-rgx
   limit (not error) n))

;; sentences

(defconst lojban-sentence-separator-rgx
  (concat "\\<\\(\\(\\.\\|\\<\\)i\\(j[aeou]\\|nai?\\)?\\|"
		  lojban-paragraph-separator-rgx "\\|fa'o\\)"))

(defun lojban-sentence-forward (&optional n noerror limit)
  "Travel N sentences forward.
Optional arguments NOERROR and LIMIT behave as in `search-forward'.
If omitted, N defaults to 1.

Does not work well with TO ... TOI regions when they include multiple
sentences."
  (interactive)
  (if (re-search-forward lojban-sentence-separator-rgx limit noerror n)
      (progn (goto-char (match-end 0)) t) nil))

(defun lojban-sentence-backward (&optional n noerror limit)
  "Travel N sentences backward.
Optional arguments NOERROR and LIMIT behave as in `search-forward'.
If omitted, N defaults to 1.

Does not work well with TO ... TOI regions when they include multiple
sentences."
  (interactive)
  (if (re-search-backward lojban-sentence-separator-rgx limit noerror n)
      (progn (goto-char (match-beginning 0)) t) nil))

;; (defun lojban-syllable-forward (&optional noerror limit)
;;   (if (re-search-forward lojban-letter-rgx nil limit)
;;      (let ((first (match-beginning 0)))
;;	(if (re-search-forward
;;	     (eval-when-compile
;;	       (concat lojban-v-rgx "+"))
;;	     nil limit)
;;	    (cond
;;	     ((looking-at "\\W") (point))
;;	     ((looking-at
;;	       (eval-when-compile
;;		 (concat
;;		  lojban-c-rgx "+")))
;;    (if  (error ""))

;; (defun lojban-look-for-lerfu-reference nil)

;;;; * Syntax

(defun lojban-number-to-string (n)
  (apply 'concat
		 (mapcar
		  (lambda (c) (aref lojban-numerical-char-table c))
		  (string-to-list
		   (if (stringp n) n
			 (number-to-string n))))))

;;;; * utilities

(defcustom lojban-jbofihe-command "jbofihe -x -b"
  "Command and arguments to run jbofihe.

See also `lojban-parse-region'."
  :group 'lojban
  :type 'string)
(defcustom lojban-cmafihe-command "cmafihe -b"
  "Command and arguments to run cmafihe.

See also `lojban-gloss-region'."
  :group 'lojban
  :type 'string)

;;;; word lists

(defcustom lojban-gismu-file "/usr/share/lojban/gismu"
  "File where the gismu list can be retrieved."
  :group 'lojban)

(defcustom lojban-cmavo-file "/usr/share/lojban/cmavo"
  "File where the cmavo list can be retrieved."
  :group 'lojban)

(defcustom lojban-rafsi-file "/usr/share/lojban/rafsi"
  "File where the rafsi list can be retrieved."
  :group 'lojban)

(defun lojban-find-gismu-buffer ()
  (let ((p (get-buffer "*gismu*")))
    (if p (set-buffer p)
      (save-window-excursion
		(find-file lojban-gismu-file)
		(setq p (current-buffer))
		(bury-buffer p))
      (set-buffer p)
      (rename-buffer "*gismu*"))))

(defvar lojban-gismu-hash-table nil)
(defun lojban-gismu-hash-table ()
  (or lojban-gismu-hash-table
      (progn
		(lojban-gismu-make-hash-table)
		lojban-gismu-hash-table)))

(defun lojban-gismu-make-hash-table ()
  (setq lojban-gismu-hash-table (make-vector 319 nil))
  (save-excursion
    (lojban-find-gismu-buffer)
    (setq buffer-read-only t)
    (beginning-of-buffer)
    (let ((reg (concat "^\\W*\\(" lojban-gismu-rgx "\\) ")))
      (while (search-forward-regexp reg nil t)
		(set (intern (match-string 1) lojban-gismu-hash-table)
			 (match-beginning 0))))))

(defun lojban-gismu-lookup (word)
  (intern-soft word (lojban-gismu-hash-table)))

(defun lojban-find-cmavo-buffer ()
  (let ((p (get-buffer "*cmavo*")))
    (if p (set-buffer p)
      (save-window-excursion
		(find-file lojban-cmavo-file)
		(setq p (current-buffer))
		(bury-buffer p))
      (set-buffer p)
      (rename-buffer "*cmavo*"))))

(defvar lojban-cmavo-hash-table nil)
(defun lojban-cmavo-hash-table ()
  (or lojban-cmavo-hash-table
      (progn
		(lojban-cmavo-make-hash-table)
		lojban-cmavo-hash-table)))

(defun lojban-cmavo-make-hash-table ()
  (setq lojban-cmavo-hash-table (make-vector 319 nil))
  (save-excursion
    (lojban-find-cmavo-buffer)
    (setq buffer-read-only t)
    (beginning-of-buffer)
    (let ((reg (concat "^\\W*\\(" lojban-compound-cmavo-rgx
					   "\\)[ \t]+[A-Z]"))
		  (case-fold-search nil))
      (while (search-forward-regexp reg nil t)
		(set (intern (match-string 1) lojban-cmavo-hash-table)
			 (match-beginning 0))))))

(defun lojban-cmavo-lookup (word)
  (intern-soft word (lojban-cmavo-hash-table)))

(defun lojban-find-rafsi-buffer ()
  (let ((p (get-buffer "*rafsi*")))
    (if p (set-buffer p)
      (save-window-excursion
		(find-file lojban-rafsi-file)
		(setq p (current-buffer))
		(bury-buffer p))
      (set-buffer p)
      (rename-buffer "*rafsi*"))))

(defvar lojban-rafsi-hash-table nil)
(defun lojban-rafsi-hash-table ()
  (or lojban-rafsi-hash-table
      (progn
		(lojban-rafsi-make-hash-table)
		lojban-rafsi-hash-table)))

(defun lojban-rafsi-make-hash-table ()
  (setq lojban-rafsi-hash-table (make-hash-table))
  (save-excursion
    (lojban-find-rafsi-buffer)
    (setq buffer-read-only t)
    (beginning-of-buffer)
    (let ((reg (concat "^\\W*\\(?1:" lojban-rafsi-3-rgx "\\)\\W+\\(?2:" lojban-valsi-rgx "\\)")))
      (while (search-forward-regexp reg nil t)
		(let ((rafsi (match-string 1))
			  (valsi (match-string 2)))
		  (message "%s -> %s" rafsi valsi)
		  (puthash rafsi valsi lojban-rafsi-hash-table))))))

(defun lojban-rafsi-lookup (word)
  (gethash word 'lojban-rafsi-hash-table))

;;;; parsing

(defun lojban-predigest-region (&optional beg end)
  (interactive "r")
  (unless beg (setq beg (point-min)))
  (save-excursion
    (goto-char beg)
    (let ((case-fold-search t))
      (while (re-search-forward lojban-non-letter-rgx end t)
		(save-excursion
		  (let ((c (char-after (match-beginning 0))))
			(cond
			 ;;((looking-at "w") (replace-match "u"))
			 ;;((looking-at "q") (replace-match "k"))
			 ;; FIXME: the following may modify quoted text
			 ((eq c ?h) (replace-match "'"))
			 ;;((memq c '(?' ?.)) t)
			 (t (replace-match " ")))))))))

(defun lojban-current-word-region (&optional strict really-word)
  "Return the begin and and markers of current word. Acts just like
`current-word' but instead of returning the word itself, returns list with two elements: 
begin and end marker."
  (save-excursion
    (let* ((oldpoint (point)) (start (point)) (end (point))
		   (syntaxes (if really-word "w" "w_"))
		   (not-syntaxes (concat "^" syntaxes)))
      (skip-syntax-backward syntaxes) (setq start (point))
      (goto-char oldpoint)
      (skip-syntax-forward syntaxes) (setq end (point))
      (when (and (eq start oldpoint) (eq end oldpoint)
				 ;; Point is neither within nor adjacent to a word.
				 (not strict))
		;; Look for preceding word in same line.
		(skip-syntax-backward not-syntaxes
							  (save-excursion (beginning-of-line)
											  (point)))
		(if (bolp)
			;; No preceding word in same line.
			;; Look for following word in same line.
			(progn
			  (skip-syntax-forward not-syntaxes
								   (save-excursion (end-of-line)
												   (point)))
			  (setq start (point))
			  (skip-syntax-forward syntaxes)
			  (setq end (point)))
		  (setq end (point))
		  (skip-syntax-backward syntaxes)
		  (setq start (point))))
      ;; If we found something nonempty, return it as a string.
      (list start end))))

(defun lojban-shell-command-on-region
  (beg end command &optional no-digest &rest rest)
  (message "Rest: %s" rest)
  (if no-digest (apply 'shell-command-on-region beg end command rest)
    (let ((orig (current-buffer)))
      (with-temp-buffer
		(insert-buffer-substring orig beg end)
		(lojban-predigest-region)
		(apply
		 'shell-command-on-region
		 (point-min) (point-max) command
		 rest)))))

(defun lojban-gloss-region (beg end &optional no-digest &rest rest)
  "Run cmafihe, a lojban word glosser, on the region.

See also `lojban-cmafihe-command'."
  (interactive "r")
  (apply
   'lojban-shell-command-on-region
   beg end lojban-cmafihe-command no-digest
   rest))

(defun lojban-gloss-word (&optional no-digest)
  "Run cmafihe, a lojban word glosser, on word under point.

See also `lojban-gloss-region'."
  (interactive)
  (let ((reg (lojban-current-word-region)))
	(lojban-gloss-region (car reg) (cadr reg) no-digest)))

;;;###autoload
(defun lojban-parse-region (beg end &optional no-digest	&rest rest)
  "Parse the region as lojban text.
This is done via the external command jbofihe.

See also `lojban-jbofihe-command'."
  (interactive "r")
  (apply
   'lojban-shell-command-on-region
   beg end lojban-jbofihe-command no-digest
   rest))

(defun lojban-parse-sentence ()
  "Parse the sentence that point is in, and advance to the next.
It does not work well with TO...TOI regions including multiple
sentences.

See also `lojban-parse-region'."
  (interactive)
  (let ((beg nil) (end nil) (next nil))
    (save-excursion
      (if (lojban-sentence-backward nil t)
		  (setq beg (match-end 0)) (setq beg (point-min))))
    (if (lojban-sentence-forward nil t)
		(setq end (match-beginning 0) next (point))
      (setq end (point-max)))
    (lojban-parse-region beg end nil)))

(defun lojban-translate-number (n)
  (interactive "s")
  (message (lojban-number-to-string n)))

(provide 'lojban)

;;; lojban.el ends here