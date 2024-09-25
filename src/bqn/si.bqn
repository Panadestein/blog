Scheme ← {
  T ← {}
  𝕩
} ⋄ Scheme "(+ 1 1)"

Scheme "((lambda (x) (list x (list (quote quote) x)))
         (quote (lambda (x) (list x (list (quote quote) x)))))"

ch ← "../supp/chicken/libchicken.so" •FFI "*u8"‿"eval_scheme"‿">*u8:c8"
R5RS ← {(⊢↑˜·+´·∧`@⊸≠) @+(Ch𝕩∾@).Read¨↕100}

("Not Compliant"⊸!Scheme≡R5RS)¨ "(+ 10 122)"‿"(* 4 2)"
