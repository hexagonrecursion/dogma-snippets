;;; This file was automatically generated by SWIG (http://www.swig.org).
;;; Version 1.3.40
;;;
;;; Do not make changes to this file unless you know what you are doing--modify
;;; the SWIG interface file instead.


;;;SWIG wrapper code starts here

(cl:defmacro defanonenum (&body enums)
   "Converts anonymous enums to defconstants."
  `(cl:progn ,@(cl:loop for value in enums
                        for index = 0 then (cl:1+ index)
                        when (cl:listp value) do (cl:setf index (cl:second value)
                                                          value (cl:first value))
                        collect `(cl:defconstant ,value ,index))))

(cl:eval-when (:compile-toplevel :load-toplevel)
  (cl:unless (cl:fboundp 'swig-lispify)
    (cl:defun swig-lispify (name flag cl:&optional (package cl:*package*))
      (cl:labels ((helper (lst last rest cl:&aux (c (cl:car lst)))
                    (cl:cond
                      ((cl:null lst)
                       rest)
                      ((cl:upper-case-p c)
                       (helper (cl:cdr lst) 'upper
                               (cl:case last
                                 ((lower digit) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:lower-case-p c)
                       (helper (cl:cdr lst) 'lower (cl:cons (cl:char-upcase c) rest)))
                      ((cl:digit-char-p c)
                       (helper (cl:cdr lst) 'digit 
                               (cl:case last
                                 ((upper lower) (cl:list* c #\- rest))
                                 (cl:t (cl:cons c rest)))))
                      ((cl:char-equal c #\_)
                       (helper (cl:cdr lst) '_ (cl:cons #\- rest)))
                      (cl:t
                       (cl:error "Invalid character: ~A" c)))))
        (cl:let ((fix (cl:case flag
                        ((constant enumvalue) "+")
                        (variable "*")
                        (cl:t ""))))
          (cl:intern
           (cl:concatenate
            'cl:string
            fix
            (cl:nreverse (helper (cl:concatenate 'cl:list name) cl:nil cl:nil))
            fix)
           package))))))

;;;SWIG wrapper code ends here


(cffi:defcstruct bsddb
	(db :pointer)
	(open :int))

(cffi:defcfun ("py_init" py-init) :void)

(cffi:defcfun ("py_close" py-close) :void)

(cffi:defcfun ("py_runstr" py-runstr) :int
  (command :string))

(cffi:defcfun ("py_none" py-none) :pointer)

(cffi:defcfun ("null_pointer" null-pointer) :pointer)

(cffi:defcfun ("bdb_module" bdb-module) :pointer)

(cffi:defcfun ("db_open" db-open) :pointer
  (fname :string)
  (flags :string))

(cffi:defcfun ("db_close" db-close) :pointer
  (db :pointer))

(cffi:defcfun ("db_size" db-size) :int
  (db :pointer))

(cffi:defcfun ("db_store" db-store) :int
  (db :pointer)
  (key :string)
  (value :string))

(cffi:defcfun ("db_sync" db-sync) :void
  (db :pointer))

(cffi:defcfun ("db_clear" db-clear) :void
  (db :pointer))

(cffi:defcfun ("db_first_item" db-first-item) :pointer
  (db :pointer))

(cffi:defcfun ("db_last_item" db-last-item) :pointer
  (db :pointer))

(cffi:defcfun ("tuple_key" tuple-key) :string
  (item :pointer))

(cffi:defcfun ("tuple_value" tuple-value) :string
  (item :pointer))

(cffi:defcfun ("db_next_item" db-next-item) :pointer
  (db :pointer))

(cffi:defcfun ("db_prev_item" db-prev-item) :pointer
  (db :pointer))

(cffi:defcfun ("db_get" db-get) :string
  (db :pointer)
  (key :string))

(cffi:defcfun ("has_key" has-key) :int
  (db :pointer)
  (key :string))

(cffi:defcfun ("db_del" db-del) :int
  (db :pointer)
  (key :string))

(cffi:defcfun ("db_iterkeys" db-iterkeys) :pointer
  (db :pointer))

(cffi:defcfun ("db_itervalues" db-itervalues) :pointer
  (db :pointer))

(cffi:defcfun ("db_iteritems" db-iteritems) :pointer
  (db :pointer))

(cffi:defcfun ("iter_next" iter-next) :string
  (iterator :pointer))

