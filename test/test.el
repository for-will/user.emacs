;;; test.el --- just for practice
;;; Commentary:
;; code of test

;;; Code:

(+ 2 (* 2 3)) 

(message "Hello %d" 100)

(point)


(region-beginning)
(region-end)

(point)
(line-beginning-position)


(point-min)

(point-max)

356



(line-end-position)

314

(line-beginning-position)

346
;;aaa

(insert "something")

(setq xbuff (generate-new-buffer "*my output*"))

(print "something" xbuff)

(switch-to-buffer xbuff)

(electric-pair-mode t)

(setq xbuff (generate-new-buffer "*my output*"))

(with-output-to-temp-buffer xbuff

  ;; this is inserted in current buffer
  (insert "xyz")

  ;; this is printed in buffer xbuff
  (print "abc"))

(switch-to-buffer xbuff)


(print "aa\" aa\"\tbb") 


(length "hello world")

(substring "abc123" 3 6)


(concat "Hello " "World" "!!!")

(split-string "xy_007_cat" "_")


(string-to-number "11")


(number-to-string #x1a)

(list)


(if 0 "yes" "no")

(< 3 4)

(print (/= 3 4))


(put 'ff 'xx 55)

(get 'ff 'xx)


(setplist 'ff '(a 1 b 2))

(symbol-plist 'ff)

(get 'ff 'a)

(put 'ff 'c "carry")

(get 'ff 'c)


(defun xz-toggle-background-color ()
  (interactive)
  (if (get 'xz-toggle-background-color 'state)
      (progn
	(set-background-color "seashell")
	(put 'xz-toggle-background-color 'state nil))
    (progn
      (set-background-color "honeydew")
      (put 'xz-toggle-background-color 'state t))
    ))

(set-background-color "black")


(defun xz-cycle-background-color (@n)
    (let* (
	($values ["cornsilk" "pale green" "pale turquoise" "thistle" "seashell" "honeydew" "black"])
	($index-before
	    (if (get 'xz-cycle-background-color 'state)
		(get 'xz-cycle-background-color 'state)
	    0))
	($index-after (% (+ $index-before (length $values) @n) (length $values)))
	($next-value (aref $values $index-after)))

    (put 'xz-cycle-background-color 'state $index-after)

    (set-background-color $next-value)
    (message "background color changed to %s" $next-value)))

(xz-cycle-background-color -1)

(symbolp 'xz-cycle-background-color)

(symbolp 3)

(symbolp 'x)

(symbol-name 'xz-cycle-background-color)

(symbol-name 'sin)

(symbol-function 'xz-cycle-background-color)

(symbol-function 'sin)

(symbol-plist 'sin)

(setq y "yes yes")

(symbol-value 'y)

(set-background-color "black")

(boundp 'h)

(setq h 4)

(defun z () 4)

(symbol-function 'z)

(fboundp 'z)

(fboundp 'f)

(intern-soft "xxxzz")

(intern "xxxz")


(setq f 'cos)
(setq f 'sqrt)

(mapcar 'cos '(1 2 3))

(mapcar f '(1 2 3 ))

(special-form-p 'progn)

(macrop 'when)

(commandp 'count-words)

(functionp 'buffer-file-name)

(buffer-file-name)

(point-min)

(evil-ex-line-number)

(point-max)

(boundp 'buffer-file-name)

(subrp (symbol-function 'while))

(subrp (symbol-function 'goto-char))


(progn
  (message "aa")
  (message "bb"))

(if (< 3 20) 100 200)


(when (< 10 2) (message "aaa") (message "bbb"))

(setq x 0)

(while (< x 4)
  (print (format "number is %d" x))
  (setq x (1+ x)))


(let ((x 32))
  (while (< x 127)
    (insert-char x)
    (setq x (1+ x))))

;;  !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

(let ((xx '(a b c)))
  (while xx
    (message "%s" (pop xx))
    (sleep-for 1))
  "DONE")

(let (xx ii)
  (setq xx [0 1 2 3 4 5])
  (setq ii 0)

  (while (< ii (length xx))
    (insert (format "%d" (aref xx ii)))
    (setq ii (1+ ii)))
  "done")

(mapcar 'car '((1 2) (3 4) (5 6)))


(mapcar (lambda (x) (aref x 0)) [[1 2] [3 4] [5 6]])


(mapcar '1+ [1 2 3])

(mapc
 (lambda (x)
   (insert (number-to-string (* 2 x)))
   (* 3 x))
 (number-sequence 1 9))

(dotimes (i 4)
  (insert (number-to-string i)))

(let ((xx [3 4 5]))
  (dotimes (i (length xx))
    (insert (number-to-string (elt xx i)))))

(let ((xx [10 20 30 40 50 ]))
  (catch 'TAG743
    (dotimes (i 99)
      (insert (format "i %s %s\n" i (aref xx i)))
      (if (eq (aref xx i) 30)
	  (throw 'TAG743 "got it")
	nil))))

(cons 4 (cons 5 (cons 6 nil)))

(list 1 2 3)

(cons 1 (cons 2 (cons 3 nil)))


(defun test-exit-f ()
  "Example.  using catch/throw to exit function."
  (interactive)
  (catch 'aaa
    (if (y-or-n-p "exit?")
	(progn
	  (message "existing")
	  (throw 'aaa "yes - exit") ; if yes, exit right away, return 3 to catch
	  )
      (progn ; else, go on
	(message "went on")
	"no - went on" ; return 4
	))))

(test-exit-f)

(setq xx (list 1 "b" 3))

(setq xx '(a b c))

(message "%S" xx)


(let (x y x)
  (setq x 3)
  (setq y 4)
  (setq z 5)
  (message "%S" (list x y z))
  )

(make-list 3 0)

(number-sequence 2 10)


(number-sequence 0 11 3)

(number-sequence 2.2 5.3)


(car '("a" "b" "c"))

(cdr '(1 2 3 4))

(nth 1 '(1 2 3 4))

(butlast '(0 1 2 3 4 5))

(butlast '(0 1 2 3 4 5) 3)

(car (last '(1 2 3 4 5)))

(last (list 1 2 3 4 5 6) 3)


(setq xx '(1))

(push 2 xx)


(setq xx '((1 2) (3 4) (5 6)))

(push "b" (nth 1 xx))

(print xx)


(setq xx
      [(1 2) (3 4) (5 6)])

(push 22 (aref xx 1))

(print xx)

(setq xx '(1 2 3))

(add-to-list 'xx "a")

(setq xx '(1 2 3))

(add-to-ordered-list 'xx 5 nil)


(setq xx '(1 2 3 4 5))

(butlast xx 2)

xx

(pop xx)

(nbutlast xx 2)

xx



(setq xx (number-sequence 1 6))

(setcar xx "aa")

xx

(setcdr xx (cons "bb" (cons "bb" nil)))


(member "4" '(3 "4" 4 "4" "5"))

(member-ignore-case "A" '("b" "a" "A"))

;;;
(setq xx '(3 3 4 4 5 5))

(remq 4 xx)

xx

;;;

(setq xx '(3 4 5))

(delq 4 xx)

xx

;;;
(setq xx '(3 4 5 3 2))

(delete-dups xx)

xx

;;; 

(setq x1 1)

(setq x2 2)

(setq x3 `(0 x1 x2))

(setq x3 `(0 ,x1 x2))

(setq x3 `(0 x1 ,x2))

(setq x3 `(0 ,x1 ,x2))

;;;

(setq x1 (list 1 2))

(setq x2 (list 3 4))

(setq x3 `(0 x1 x2))

(setq x3 `(0 , x1 x2))

(setq x3 `(0 , x1 , x2))

(setq x3 `(0 ,@ x1 , x2))

(setq x3 `(0 ,@x1 ,@x2))

;;
(defun ff (x y z)
  "Return args as one string."
  (format "%s %s %s" x y z))

(ff 2 3 4)

(setq xx '(2 3 4))

(eval `(ff ,@xx))

;;;
(setq xx
      '(("aa" . 23)
	("bb" . 24)
	("cc" . 33)))


;;
(setq xx
      '((aa . 23)
	(bb . 24)
	(cc . 33)))
;;;
(setq xx
      '(("aa" . 23)
	("bb" . 24)
	("cc" . 33)))

(alist-get "bb" xx 999 nil 'string-equal)

(alist-get "dd" xx 999 nil 'string-equal)

;;
(setq xx
      '((aa . 23)
	(bb . 24)
	(cc . 33)))

(alist-get 'bb xx 999)

(alist-get 'dd xx 999)

;;;
(setq xx
      '(("aa" . 23)
	("bb" . 24)
	("cc" . 33)))

(assoc "bb" xx)

;; 
(setq xx
      '((aa . 23)
	(bb . 24)
	(cc . 33)))

(assq 'aa xx)

(assoc "aa" xx)


;;;
(setq xx
      '(("aa" . 23)
	("bb" . 24)
	("cc" . 33)))

(rassoc 24 xx)

(rassq 24 xx)


;;;
(setq xx
      '(("aa" . 23)
	("bb" . 24)
	("cc" . 33)))

(push '("cc" . 44) xx)

;;;
(setq xx
      '(("aa" . 23)
	("bb" . 24)))

(when (not (assoc "cc" xx))
  (push '("cc" . 333) xx))


;;;
(setq xx '("aa" . 100))

(car xx)

(cdr xx)


;;;

(setq xx
      '(("aa" . 23)
	("bb" . 24)))

(assoc-delete-all "bb" xx)

xx
;;;
(make-vector 5 0)

;;
(setq xx 3)

(vector 1 2 xx)


;;;
(setq aa 4)

(setq xx [3 aa 5])

;;;
(setq xx [3 4 5])

(fillarray xx 100)

xx

;;
(length (vector 1 2 3 4))

(length (make-vector 100 2))

;;;
(aref ["a" "b" "c" "d"] 0)

;;;
(setq xx [3 4 5])

(aset xx 1 "b")

xx

;;;
[[1 2] [3 4] [5 6 7]]

;;;
(vconcat [3 4] ["a" "b"])

(vconcat [3 4] '("a" "b"))

(vconcat [3 4] "ab")

;;;
(append (list 1 2) (list 3 4))

(append [1 2 3] nil)

(append [1 2 3] [3 4])

(append [1 2 3] [3 4] nil)

(append [1 2 3] [4 5] '(6))

;;;
(mapconcat 'number-to-string '(1 2 3) "-")

(mapconcat 'number-to-string [1 2 3] "-")

;;
(identity "a")

(mapconcat 'identity '("a" "b" "c") "--")

;;;
(format "%s" '(1 "two" 3))

(substring (format "%s" '(1 "two" 3)) 1 -1)


;;;
(setq xx (make-hash-table :test 'equal))

(puthash 'aa 9 xx)

(puthash 'bb 10 xx)

(remhash 'aa xx)

xx

(gethash 'cc xx)

(gethash 'cc xx 100)

(hash-table-count xx)

(clrhash xx)

(setq xx (make-hash-table :test 'equal))

(puthash "aa" 19 xx)

(puthash "bb" 20 xx)

(puthash "cc" 21 xx)

(puthash "dd" 17 xx)

(maphash
 (lambda (k v)
   (princ (format "%s , %s" k v))
   (princ "\n"))
 xx)

(hash-table-keys xx)

(hash-table-values xx)

(setq show-paren-style 'mixed)

major-mode

minor-mode-list

(when (memq 'outline-minor-mode minor-mode-list)
  (print "YES"))


(setq xx '((a . 1) (b . 2)))
(push '(c . 3) xx)
xx

(defun insert-p-tag ()
  "Invert <p></p> at cursor point."
  (interactive)
  (insert "<p></p>")
  (backward-char 4))

(insert-p-tag)

(defun wrap-markup-region ()
  "Insert a markup <b></b> aroud a region."
  (interactive)
  (let ((p1 (region-beginning))
        (p2 (region-end)))
    (goto-char p2)
    (insert "</b>")
    (goto-char p1)
    (insert "<b>")))

;; <b>hello world </b>


(defun select-current-word ()
  "Select the word under cursor.
“word” here is considered any alphanumeric sequence with “_” or “-”."
  (interactive)
  (let (pt)
    (skip-chars-backward "-_A-Za-z0-9")
    (setq pt (point))
    (skip-chars-forward "-_A-Za-z0-9")
    (set-mark pt)))

(end-of-line)
(line-beginning-position)
;;;


(fill-paragraph nil)



;; Replace newline chars in current paragraph by single spaces. This
;; command does the inverse of `fill-paragraph'. Replace newline chars
;; in current paragraph by single spaces. This command does the
;; inverse of `fill-paragraph'.

most-positive-fixnum
fill-column
(point-min)

(defun word-definition-lookup ()
"Look up the word under cursor in a browser."
 (interactive)
 (browse-url
   (concat "http://www.answers.com/main/ntquery?s=" (thing-at-point 'symbol))))




(buffer-file-name)

(highlight-lines-matching-regexp "buffer" 'hi-blue-b)

(highlight-lines-matching-regexp "fill" 'hi-blue-b)

(unhighlight-regexp "fill")







;;; test.el ends here
