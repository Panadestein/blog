Setplot‿Plot ← •Import "../bqn-utils/plots.bqn"
U ← 0.5-˜•rand.Range⟜0
M ← +˝∘×⎉1‿∞

Minn ← {r‿l𝕊𝕩:
  C ⇐ +`2÷˜·×˜-
  A‿DA ← ⟨1÷1+⋆∘-, ⊢×1⊸-⟩
  F ⇐ {𝕨𝕊b‿w: A¨b+w⊸M𝕨}`
  B ← {
    do ← (DA∘⊣×𝕗-⊢)´⊢´¨𝕨‿𝕩
  }
  l(U⚇1-⟜1∘≠⋈·<˘2⊸↕)⊸{fs‿ts𝕊b‿w:
    B fs F b⋈¨w
  }´𝕩
}

)r Setplot "scatter" ⋄ •Out¨ Plot´  m {ns←≠⊑𝕨 ⋄ (>𝕨)⋈˜∘‿ns⥊ns/𝕩} r
