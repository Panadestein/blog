Setplot‿Plot ← •Import "../../bqn-utils/plots.bqn"
U ← 0.5-˜•rand.Range⟜0
M ← +˝∘×⎉1‿∞
RMS ← √≠∘⊢÷˜·+´×˜∘-

Minn ← {rt‿ly𝕊dat:
  A‿DA ← ⟨1÷1+⋆∘-, ⊢×1⊸-⟩
  BP ← {fs‿ts‿we𝕊𝕩: do ← (<-⟜ts×DA)⊑⊑hx‿tx ← ¯1(↑⋈↓)𝕩
    (fs<⊸∾tx)×⌜˜¨do∾˜{d𝕊w‿z: z DA⊸×d M˜⍉w}`˜⟜do⌾⌽tx⋈¨˜1↓we
  }
  FP ← {z𝕊bi‿we: A bi+we M z}`⟜(⋈¨´)
  nn ← dat{𝕨𝕊bi‿we: fs‿ts ← 𝕨(↑⋈↓)˜⊑ly
    bi⋈we-rt× fs‿ts‿we BP fs<⊸FP𝕩}˝˜(U⚇1-⟜1∘≠⋈·<∘⌽˘2⊸↕)ly
  E ⇐ ⊢´<⊸FP⟜nn
}

neq‿ntr‿nte‿e ← 600‿100‿50‿100
I ← {↕∘⌈⌾((2.8+𝕩×⊢)⁼)4}
L ← {𝕨(⊣×1⊸-×⊢)⍟((neq-𝕩)+↕𝕩)•rand.Range 0}
te ← ∾{𝕩∾˘⊏⍉2↕𝕩L nte}¨I (0.004-˜10⊸⋆÷˜√)2
tr ← •rand.Deal∘≠⊸⊏⊸∾⍟(e-1)˜∾{𝕩∾˘2↕𝕩L ntr}¨I 0.1
≠¨tr‿te

lm ← 0.001‿⟨2, 300, 1⟩ Minn tr
(⊢RMS⟜∾·lm.E¨⊣)˝⍉tr

)r Setplot "scatter" ⋄ •Out¨ Plot˝⍉(⊑∾lm.E)˘te
