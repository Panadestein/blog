⟨P⇐Parse⟩ ← •Import "../../bqn-libs/json.bqn"
@ ⊣ spd ← P •file.Chars "../../supp/spdat/data.json"

s‿a‿m‿l ← ⟨7, 8, 3, 1+↕20⟩

Q ← {l≍˘∾(⍷𝕨⊸⊏˘)¨ l⊏ ((⍒(+´m⊸⊏˘)¨)⊸⊏ 𝕨⊸⊏˘⊐⊸⊔⊢) >1⊏¨ 𝕩}

s Q spd

a Q spd

lo ← (↕∘⌈+´÷≠) 7‿5‿9‿7‿8‿6‿8‿8‿7‿10‿7‿11‿10

O ← {lo (1⊸+∘⊣≍˘⊏) (⊢˝˘⊸∊⟜𝕨/⊏˘) ∾(⍷s‿a⊸⊏˘)¨ ((⍒(+´m⊸⊏˘)¨)⊸⊏ s⊸⊏˘⊐⊸⊔⊢) >1⊏¨ 𝕩}

spd O˜⋈ "Opeth"
