Setplot‿Plot ← •Import "../bqn-utils/plots.bqn"
U ← 0.5-˜•rand.Range⟜0
M ← +˝∘×⎉1‿∞

Minn ← {rt‿ly𝕊𝕩:
  A‿DA ← ⟨1÷1+⋆∘-, ⊢×1⊸-⟩
  BP ← {ts‿we𝕊𝕩:
    do ← <(-⟜ts×DA)⊢´𝕩
    ⌽𝕩×⌜¨do∾do{d𝕊w‿z: (DA z)×d M˜⍉w}`⋈¨´(1↓⌽)¨we‿𝕩
  }
  FP ← {z𝕊b‿we: A¨b+z M we}`⟜(⋈¨´)
  nn ← 𝕩{fs‿ts𝕊bi‿we: bi⋈we-rt× ts‿we BP fs FP𝕩}´˜(U⚇1-⟜1∘≠⋈·<˘2⊸↕)ly
  E ⇐ ⊢´FP⟜nn  
}

n‿ri‿rf‿dr ← 1000‿2.8‿4‿0.001
@ ⊣ td ← {𝕩(⊣∾(⊣×1⊸-×⊢)⍟n)¨0 •rand.Range˜≠𝕩} ↕∘⌈⌾((ri+dr×⊢)⁼)rf

lm ← 0.01‿⟨1, 500, 1⟩ Minn td
lm.E 2.85

)r Setplot "scatter" ⋄ •Out¨ Plot´  m {ns←≠⊑𝕨 ⋄ (>𝕨)⋈˜∘‿ns⥊ns/𝕩} r
