_bool ← {𝔽◶"#f"‿"#t"}

env ← ⟨
  "sin", "cos", "tan", "asin", "acos", "atan"
  "log", "+", "-", "*", "/", ">", "<", ">=", "<=", "="
  "abs", "append", "apply", "begin", "car", "cdr", "cons"
  "eq?", "expt", "equal?", "length", "list", "list?"
  "map", "max", "min", "not", "null?", "number?"
  "print", "round", "symbol?", "nil", "pi"
⟩ •HashMap ⟨
  ⋆⁼, +´, -´, ×´, ÷´, >´, <´, ≥´, ≤´, =´
  |, ∾´, {𝕎𝕩}´, {𝕩}, ⊑, 1⊸↓, ⋈´
  ≡´_bool, ⋆´, =´_bool, ≠, ⋈, 0⊸=_bool{•Type•BQN⎊1𝕩}
  {𝕎¨𝕩}´, ⌈´, ⌊´, 0⊸≠_bool¬, @⊸=_bool, •BQN⎊1
  •Show, ⌊0.5+⊢, 2⊸=_bool{•Type⊑𝕩}, @, π
⟩ ∾˜ •math •ns.Get¨ "sin"‿"cos"‿"tan"‿"asin"‿"acos"‿"atan"

Scheme ← {
  T ← (⊢/˜·∨´¨' '⊸≠)(-⟜1·+`·¬⊸∧⟜»⊸∨·+˝"( )"=⌜⊢)⊸⊔
  R ← {
    𝕊⟨⟩: "Empty program"!0;
    𝕊𝕩: {
      "("≡⊑𝕨 ? l←⟨⟩ ⋄ l⋈1↓{t‿ts: ts⊣l∾↩<t}∘R•_while_(")"≢⊑) 𝕩;
      ")"≡⊑𝕨 ? "Unexpected )"!0 ;
      𝕩 ⋈˜ •ParseFloat⎊⊢ ⊑𝕨
    }´ 1(↑⋈↓)𝕩
  }
  E ← {
    env.Has 𝕩 ? env.Get 𝕩;
    1=•Type⊑⟨𝕩⟩ ? 𝕩;
    "if"≡⊑𝕩 ? ·‿tst‿cnd‿alt ← 𝕩 ⋄ env(⊣𝕊𝕊◶alt‿cnd)tst;
    "define"≡⊑𝕩 ? ·‿var‿val ← 𝕩 ⋄ ⟨⟩ ⊣ var env.Set env𝕊val;
    f ← env𝕊⊑𝕩 ⋄ F env⊸𝕊¨1↓𝕩 
  }
  P ← (⊢+˝("()"-"⟨⟩")×"⟨⟩"=⌜⊢)∘•Fmt·1⊸=∘≠◶⊢‿⊑∾⎊⊢
  P env⊸E⊑R∘T 𝕩
}

Scheme "((lambda (x) (list x (list (quote quote) x)))
         (quote (lambda (x) (list x (list (quote quote) x)))))"

ch ← "../supp/chicken/libchicken.so" •FFI "*u8"‿"eval_scheme"‿">*u8:c8"
R5RS ← {@+𝕩.Read¨ ↕1⊸+•_while_(0≠𝕩.Read)0}Ch

("Not Compliant"⊸!Scheme≡R5RS)¨ ⟨
  "(+ 10 122)"
  "(* 4 2)"
  "(begin (define r 10) (+ (/ 4 2) (* r r)))"
  "(if (> (* 11 11) 120) (* 7 6) oops)"
⟩
