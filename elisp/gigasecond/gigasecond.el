;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:
(setenv "TZ" "UTC0")

(defun from (sec min hour day month year)
  (let ((final-time (decode-time (time-add (encode-time sec min hour day month year) 1000000000))))
    (subseq final-time 0 6)))

(provide 'gigasecond)
;;; gigasecond.el ends here
