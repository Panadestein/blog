# Utilities for creating SVG diagrams as strings
# Adapted from https://github.com/mlochbaum/BQN.git, ISC license

# Exports
⟨ Enc, FmtNum, At, Pos, Elt, SVG ⟩⇐

# Create a node from a tag name and interior text.
Enc ← {
  DeNest ← {(3⌊≡)◶⟨!∘0,⋈,⊢,∾𝕊¨⟩ ⥊𝕩}
  open ← ∾⟨"<",𝕨,">"⟩
  close← ∾⟨"</", (∧`𝕨≠' ')/𝕨, ">"⟩
  l ← 1 < d←≡𝕩
  ∾ open ({"  "⊸∾¨(∾DeNest¨)⍟(3≤d)⥊𝕩}⍟l 𝕩){𝕨‿𝕗‿𝕩}○(⥊∘<⍟l) close
}
Void ← {∾⟨"<",𝕩,"/>"⟩}

FmtNums ← {
  ! ∧´ (¯∞⊸< ∧ <⟜∞) 𝕩
  k←3⋆˜b←10
  m‿p←"-."-'0'
  s←𝕩<0⋄a←|𝕩⋄v←⌊0.5+k×a
  ⊔⟜('0'⊸+)´<∘∾˘⍉∾⟨
    ≍⋈⟜(m¨)/s
    ↕∘≠⊸{f←b≤𝕩⋄(∨´f)◶⟨≍,𝕊⟜(⌊÷⟜b)○(f⊸/)´∾b⊸|⌾(⊑⌽)⟩𝕨‿𝕩}⌊v÷k
    p¨⌾(⊑⌽)∘⊏⊸∾⍟(0<≠)↕∘≠⊸{f←×𝕩↩k|𝕩⋄𝕨(∨´f)◶⟨↕0‿2,(⋈⟜(⌊÷⟜k)∾𝕊)⟜(b⊸×)○(f⊸/)⟩𝕩}v
  ⟩
}
FmtNum ← (2⌊≡)◶(⊑FmtNums∘⥊)‿(FmtNums⌾⥊)‿{𝕩⋄!0}
Fmt ← (2⌊≡)◶FmtNum‿(1↓·∾' '∾¨FmtNum)‿{𝕩⋄!0}

At1 ← " " ∾ {∾⟨𝕨,"='",𝕩,"'"⟩}´
Attr ← ∾⟜(∾ <∘At1⎉1)
At ← {
  _s ← {((+`×¬)⊸-𝕗⊸=)⊸⊔}
  𝕨 >⊘(∾⟜(∾At1¨)) '='_s¨ '|'_s 𝕩
}
Pos ← ⟨"x","y"⟩ ≍˘ FmtNum
Elt ← Void∘Attr

SVG ← {
  ("svg" Attr ⟨"viewBox",Fmt 𝕨⟩) Enc 𝕩
}
