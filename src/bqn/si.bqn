_bool ← {𝔽◶"#f"‿"#t"}

env ← ⟨
  "sin", "cos", "tan", "asin", "acos", "atan",
  "log", "+", "-", "*", "/", ">", "<", ">=", "<=", "="
  "abs", "append", "apply", "begin", "car", "cdr", "cons"
  "eq?", "expt", "equal?", "length", "list", "list?"
  "map", "max", "min", "not", "null?", "number?"
  "print", "round", "symbol?", "nil"
⟩ •HashMap ⟨
  ⋆⁼, +´, -´, ×´, ÷´, >´, <´, ≥´, ≤´, =´
  |, ∾´, {𝕎𝕩}´, {𝕩}, ⊑, 1⊸↓, ⋈´
  ≡´_bool, ⋆´, =´_bool, ≠, ⋈, 0⊸=_bool{•Type•BQN⎊1𝕩}
  {𝕎¨𝕩}´, ⌈´, ⌊´, 0⊸≠_bool¬, @⊸=_bool, •BQN⎊1
  •Show, ⌊0.5+⊢, 2⊸=_bool{•Type⊑𝕩}, @
⟩ ∾˜ •math •ns.Get¨ "sin"‿"cos"‿"tan"‿"asin"‿"acos"‿"atan"

Scheme ← {
  T ← (-⟜1·+`·¬⊸∧⟜»⊸∨·+˝"( )"=⌜⊢)⊸⊔
  R ← {
    𝕊⟨⟩: "Empty program"!0; 𝕊" ": @;
    𝕊𝕩: {"("≡𝕩 ? l ← ⟨⟩ ⋄ {l ∾⟜R↩ 𝕩 ⋄ 1↓𝕩}•_while_(")"≢⊑) hs ⋄ l;
         ")"≡𝕩 ? "Unexpected )"!0 ;
         •ParseFloat⎊⊢ 𝕩} ⊑ h‿hs ← 1(↑⋈↓)𝕩
  }
  R∘T𝕩
} ⋄ Scheme "(begin (+ 1 1) (* (+ 3 2) 1) (define a (+ 3 3)))"

Scheme "((lambda (x) (list x (list (quote quote) x)))
         (quote (lambda (x) (list x (list (quote quote) x)))))"

ch ← "../supp/chicken/libchicken.so" •FFI "*u8"‿"eval_scheme"‿">*u8:c8"
R5RS ← {@+𝕩.Read¨ ↕1⊸+•_while_(0≠𝕩.Read)0}Ch∾@

("Not Compliant"⊸!Scheme≡R5RS)¨ "(+ 10 122)"‿"(* 4 2)"
