
(defun range1 (n)
  (if (> n 0)
      (loop for i from 1 to n collect i)))
(compile 'range1)

(time (defparameter x (reduce #'* (range1  100000))))
;;Evaluation took:
;;  15.989 seconds of real time
;;  14.596912 seconds of user run time
;;  0.63204 seconds of system run time
;;  [Run times include 1.26 seconds GC run time.]
;;  0 calls to %EVAL
;;  0 page faults and
;;  9,029,652,712 bytes consed.

;; (time (progn (n!-tail 100000) nil))
;;Evaluation took:
;;  16.115 seconds of real time
;;  14.684918 seconds of user run time
;;  0.592037 seconds of system run time
;;  [Run times include 1.344 seconds GC run time.]
;;  0 calls to %EVAL
;;  0 page faults and
;;  9,029,668,056 bytes consed.
