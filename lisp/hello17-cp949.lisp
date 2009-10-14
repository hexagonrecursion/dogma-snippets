
(defstruct a
  x y)

(defstruct (b (:include a))
  z)

(defgeneric grind (x)
  (:method ((x a))
    (+ (a-x x) (a-y x)))
  (:method ((x b))
    (+ (b-z x) (call-next-method)))
  (:method ((x number))
    x))


(defparameter i (make-a :x 1 :y 2))
(defparameter j (make-b :x 3 :y 4 :z 5))

(princln
  (grind i)
  (grind j)
  (grind 10))

(println
  (class-of 'a) 	;; #<Built-In-Class SYMBOL>
  (class-of "a") 	;; #<Built-In-Class STRING>
  (class-of 12) 	;; #<Built-In-Class INTEGER>
  (class-of '(a b)) 	;; #<Built-In-Class CONS>
  (class-of '#(a b c)) 	;; #<Built-In-Class VECTOR>
  )


(defclass person ()
  ((name :accessor name
         :initform 'bill
         :initarg :name)
   (age  :accessor age
         :initform 10
         :initarg :age)))

(let ((bill (make-instance 'person))
      (mary (make-instance 'person :name 'mary))
      (john (make-instance 'person :name 'john :age 20))
      (billy (make-instance 'person :age 4))
      (prt-person (lambda (p)
                    (format t "instance: ~a --- (name: ~a, age: ~a)~%" p (name p) (age p)))))
  (funcall prt-person bill)
  (funcall prt-person mary)
  (funcall prt-person john)
  (funcall prt-person billy))


(defparameter dogma (make-instance 'person :name 'monpetit :age 40))

(prt
  (slot-value dogma 'name)
  (name dogma)
  (slot-value dogma 'age)
  (age dogma))

(describe dogma)


(defclass teacher (person)
  ((subject :accessor subject
            :initarg :subject)))

(defparameter
    prof-nam (make-instance 'teacher
                            :name 'namssam
                            :age 54
                            :subject 'middle-age-korean-history))
(describe prof-nam)
(prt
  (name prof-nam)
  (age prof-nam)
  (subject prof-nam))

(defclass history-teacher (teacher)
  ((subject :initform 'history)))

(defparameter prof-song (make-instance 'history-teacher :name 'songssam :age 61))

(describe prof-song)
(prc
 (name prof-song)
 (age prof-song)
 (subject prof-song))


(defgeneric change-subject (teach new-subject)
  (:method ((teach teacher) (new-subject symbol))
    (setf (subject teach) new-subject))
  (:method ((teach teacher) (new-subject string))
    (setf (subject teach) (intern (string-upcase new-subject)))))


(change-subject prof-nam 'history-of-chosun)
(describe prof-nam)

(change-subject prof-song "history-of-english")
(describe prof-song)


;;;;;;;;;;;;;;;;
(dotimes (i 3)
  (prt '------------------------------------------------))


(defclass ���� () ())

(defgeneric �丮 (���))

(defmethod �丮 :before ((��� ����))
  (format t "����: ~a �丮 ��~%" ���))

(defmethod �丮 :after ((��� ����))
  (format t "����: ~a �丮 ��~%" ���))

(defmethod �丮 ((��� ����))
  (format t "              ����: ~a �丮 ��~%" ���))


(defmethod �丮 :around ((��� ����))
  (prc "��ü �丮 ��")
  (let ((result (call-next-method)))
    (prc "��ü �丮 ��")
    result))


(defclass ���� (����)
  ((���� :accessor ����
         :initarg :����
         :initform '���)))

(defmethod �丮 :before ((��� ����))
  (format t "~a ���� �丮 ��~%" (���� ���)))

(defmethod �丮 :after ((��� ����))
  (format t "~a ���� �丮 ��~%" (���� ���)))

(defmethod �丮 :around ((��� ����))
  (prc "---- ���� �丮 ��")
  (let ((result (call-next-method)))
    (prc "--- ���� �丮 ��")
    result))


(defmethod �丮 ((��� ����))
  (format t "~a ���� �丮 ��!~%" (���� ���))
  (call-next-method)
  (setf (���� ���) (list '�丮�� (���� ���))))


(let ((������� (make-instance '���� :���� '���)))
  (describe �������)
  (prt '------------------------------------------------)
  (�丮 �������)
  (prt '------------------------------------------------)
  (describe �������))


(dotimes (i 3)
  (prt '------------------------------------------------))

(let ((��붱 (make-instance '����)))
  (describe ��붱)
  (�丮 ��붱)
  (describe ��붱))


(defparameter ȣ������ (make-instance '���� :���� 'ȣ��))
(describe ȣ������)
(dotimes (i 3)
  (�丮 ȣ������)
  (prt '=-=-=-=-=-=-=-=-=-=-=-=-))


#+allegro (use-package :clos)
#+sbcl (use-package :sb-mop)

(prt
  (#+abcl sys:generic-function-methods
   #+ecl clos:generic-function-methods
  #-(or abcl ecl) generic-function-methods #'�丮))
