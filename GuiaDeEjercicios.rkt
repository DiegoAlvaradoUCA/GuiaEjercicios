#lang racket

;; ============================================================
;; Actividad: Funciones y Variables (Racket)
;; Salida con rótulos exactos: "PARTE X – Ejercicio N"
;; ============================================================

;; -------------------------
;; Helpers de impresión
;; -------------------------
(define (sep) (displayln (make-string 60 #\-)))
(define (rotulo parte n)
  (newline)
  (sep)
  (displayln (format "PARTE ~a – Ejercicio ~a" parte n))
  (sep))

(define (kv k v)
  (displayln (format "~a: ~a" k v)))

;; ============================================================
;; Parte A – Definiciones necesarias
;; ============================================================
;; Ej.1
(define a 5)
(define b (+ a 3))
(define c (* b 2))

;; Ej.2
(define x 4)
(define (doble n) (* 2 n))
(define (suma3 m) (+ m 3))

;; Ej.3
(define (cuadrado x) (* x x))
(define cuadrado-lambda (lambda (x) (* x x)))

;; ============================================================
;; Parte B – Definiciones necesarias
;; ============================================================
;; Ej.4
(define base 5)
(define altura 3)
(define (area base altura) (* base altura))

;; Ej.5
(define (celsius->fahrenheit c)
  (+ (* (/ 9 5) c) 32))

;; Ej.6
(define precio-base 100)
(define (iva monto) (* 0.13 monto))
(define (precio-final p) (+ p (iva p)))

;; Ej.7
(define (descuento10 p) (* p 0.9))
(define (iva13 p) (* p 0.13))
(define (precio-total p)
  (let* ([precio-desc (descuento10 p)]
         [impuesto    (iva13 precio-desc)])
    (+ precio-desc impuesto)))

;; ============================================================
;; Parte C – Conceptos y ejemplos mínimos
;; ============================================================
;; Ej.8: Evitar (set!) en el estilo funcional (no se usará aquí).
;; Ej.9:
(define sumar (lambda (a b) (+ a b)))
(define operar sumar)
;; Ej.10: (define x 5) vs (define (x) 5)

;; ============================================================
;; Parte D – Desafío
;; ============================================================
(define (calcular-total precio descuento impuesto)
  (let* ([precio-desc (* precio (- 1 descuento))]
         [imp         (* precio-desc impuesto)])
    (+ precio-desc imp)))

;; ============================================================
;; BLOQUE PRINCIPAL: imprime TODO con rótulos exactos
;; ============================================================
(module+ main
  ;; PARTE A
  (rotulo "A" 1)
  (kv "a" a)
  (kv "b = (+ a 3)" b)
  (kv "c = (* b 2)" c)

  (rotulo "A" 2)
  (kv "x" x)
  (kv "(doble x)" (doble x))
  (kv "(suma3 (doble x))" (suma3 (doble x)))

  (rotulo "A" 3)
  (kv "(cuadrado 5)" (cuadrado 5))
  (kv "(cuadrado-lambda 5)" (cuadrado-lambda 5))
  (displayln "Nota: Son equivalentes (definición con nombre vs lambda).")

  ;; PARTE B
  (rotulo "B" 4)
  (kv "base" base)
  (kv "altura" altura)
  (kv "(area base altura)" (area base altura))

  (rotulo "B" 5)
  (kv "(celsius->fahrenheit 0)" (celsius->fahrenheit 0))
  (kv "(celsius->fahrenheit 100)" (celsius->fahrenheit 100))

  (rotulo "B" 6)
  (kv "precio-base" precio-base)
  (kv "(precio-final precio-base)" (precio-final precio-base))

  (rotulo "B" 7)
  (kv "(precio-total 100)" (precio-total 100))
  (displayln "Orden: descuento 10% y luego IVA 13% sobre el precio con descuento.")

  ;; PARTE C
  (rotulo "C" 8)
  (displayln "Respuesta: En el enfoque funcional se evita mutar estado; (set!) rompe transparencia referencial.")

  (rotulo "C" 9)
  (displayln "operar es otro nombre para la misma función que sumar.")
  (kv "(operar 4 5)" (operar 4 5))

  (rotulo "C" 10)
  (displayln "(define x 5) define un valor; (define (x) 5) define una función sin parámetros. Se usa x vs (x).")

  ;; PARTE D
  (rotulo "D" 1)
  (kv "(calcular-total 100 0.1 0.13)" (calcular-total 100 0.1 0.13))

  (newline)
  (displayln ">>> Fin <<<"))
