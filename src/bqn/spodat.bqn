⟨P⇐Parse⟩ ← •Import "../bqn-libs/json.bqn"
@ ⊣ spd ← P •file.Chars "data.json"

s‿a‿m‿l ← ⟨7, 8, 3, 1+↕20⟩

Q ← {l≍˘∾(⍷𝕨⊸⊏˘)¨ l⊏ ((⍒(+´m⊸⊏˘)¨)⊸⊏ 𝕨⊸⊏˘⊐⊸⊔⊢) >1⊏¨ 𝕩}

s Q spd

a Q spd
