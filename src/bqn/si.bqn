_bool ← {𝔽◶"#f"‿"#t"}
C ← {𝕨𝕊p‿v:
  o‿h ⇐ 𝕨 ⋈ p •HashMap v
  F ⇐ {h.Has 𝕩 ? h; @≢o ? o.F 𝕩; 0}
}

env ← @ C ⟨
  "sin", "cos", "tan", "asin", "acos", "atan"
  "log", "+", "-", "*", "/", ">", "<", ">=", "<=", "="
  "abs", "append", "apply", "begin", "car", "cdr", "cons"
  "eq?", "expt", "equal?", "length", "list", "list?"
  "map", "max", "min", "not", "null?", "number?"
  "print", "round", "symbol?", "nil", "pi"
⟩ ⋈ ⟨
  ⋆⁼, +´, -´, ×´, ÷´, >´, <´, ≥´, ≤´, =´
  |, ∾´, {𝕎𝕩}´, {∾𝕩}, ⊑∘∾, 1⊸↓∘∾, <⊸∾´
  ≡´_bool, ⋆´, =´_bool, ≠∘∾, ⊢, (0=•Type∘⊑)_bool
  {𝕎∘⋈¨𝕩}´, ⌈´, ⌊´, 0⊸≠_bool¬, @⊸=_bool, (1=•Type∘⊑)_bool 
  {𝕩}, ⌊0.5+⊢, 2⊸=_bool{•Type⊑∾𝕩}, @, π
⟩ ∾˜ •math •ns.Get¨ "sin"‿"cos"‿"tan"‿"asin"‿"acos"‿"atan"

_sch ← {
  T ← " "⊸≢¨⊸/·(-⟜1·+`·¬⊸∧⟜»⊸∨·+˝"( )"=⌜⊢)⊸⊔(⊢+22×@=10-˜⊢)
  R ← {
    𝕊⟨⟩: "Empty program"!0;
    𝕊𝕩: {
      "("≡⊑𝕨 ? l←⟨⟩ ⋄ l⋈1↓{t‿ts: ts⊣l∾↩<t}∘R•_while_(")"≢⊑) 𝕩;
      ")"≡⊑𝕨 ? "Unexpected )"!0 ;
      𝕩 ⋈˜ •ParseFloat⎊⊢ ⊑𝕨
    }´ 1(↑⋈↓)𝕩
  }
  E ← {
    0≠𝕨.F 𝕩 ? (𝕨.F 𝕩).Get 𝕩;
    1=•Type⊑⟨𝕩⟩ ? 𝕩;
    "quote"≡⊑𝕩 ? ·‿arg ← 𝕩 ⋄ arg;
    "if"≡⊑𝕩 ? ·‿tst‿cnd‿alt ← 𝕩 ⋄ 𝕨(⊣𝕊𝕊◶alt‿cnd)tst;
    "define"≡⊑𝕩 ? ·‿var‿val ← 𝕩 ⋄ ⟨⟩ ⊣ var 𝕨.h.Set 𝕨𝕊val;
    "lambda"≡⊑𝕩 ? ·‿par‿bod ← 𝕩 ⋄ 𝕨{bod E˜ 𝕗 C par‿𝕩};
    f ← 𝕨𝕊⊑𝕩 ⋄ F 𝕨⊸𝕊¨1↓𝕩 
  }
  ps‿rs ← "(   )"‿"⟨"",‿⟩" ⋄ P ← (⊢+˝(ps-rs)×rs=⌜⊢)∘•Repr·1⊸=∘≠◶⊢‿⊑(0<≠¨)⊸/⎊⊢
  P 𝕗⊸E⊑R∘T 𝕩
}

Scheme ← env _sch

Scheme "((lambda (x) (list x (list (quote quote) x)))
         (quote (lambda (x) (list x (list (quote quote) x)))))"

ch ← "../supp/chicken/libchicken.so" •FFI "*u8"‿"eval_scheme"‿">*u8:c8"
R5RS ← {@+𝕩.Read¨ ↕1⊸+•_while_(0≠𝕩.Read)0}Ch

(Scheme⋈R5RS)¨ ⟨
  "(+ 10 122)"
  "(max 5 6 7 1)"
  "(* 4 2)"
  "(begin (define r 10) (+ (/ 4 2) (* r r)))"
  "(number? (quote b))"
  "(symbol? (quote var))"
  "(if (> (* 11 11) 120) (* 7 6) oops)"
  "(car (quote (1 2 3)))"
  "(list? (quote (1 2 3)))"
  "(length (quote ((1 2) 3)))"
  "(begin
     (define fib (lambda (n) (if (< n 2) 1 (+ (fib (- n 1)) (fib (- n 2))))))
     (define range (lambda (a b) (if (= a b) (quote ()) (cons a (range (+ a 1) b)))))
     (map fib (range 0 10)))"
⟩
