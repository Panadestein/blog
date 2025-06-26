blasFFI ← (⊣•FFI·(1-˜+`×¬)∘=⟜⊏⊸⊔⊢)´ ⟨
  "/lib/libcblas.so"∾˜•BQN 1⊑•Sh "nix-instantiate"‿"--eval-only"‿"--expr"‿"(import <nixpkgs> {}).blas.outPath"
  " & cblas_dgemm u32 u32 u32 i32 i32 i32 f64 *f64 i32 *f64 i32 f64 &f64 i32"
⟩
Dgemm ← {BlasFFI 101‿111‿111‿m‿n‿k‿1‿𝕨‿k‿𝕩‿n‿0‿(m‿n⥊0)∾⊢´m‿k‿·‿n←𝕨∾○≢𝕩}

mat‿mbt ← ⟨⋈˜2⥊500, ⋈˜5⥊600⟩ /¨⊸⊔¨ ma‿mb ← •rand.Range⟜0¨1e3×⟨1‿1, 3‿3⟩
>⟨ma‿ma‿mat, mb‿mb‿mbt⟩ {𝕎˜•_timed𝕩}¨¨˜ <⟨Dgemm, +˝∘×⎉1‿∞, ∾(+˝+˝∘×⎉1‿∞¨)⎉1‿∞⟩

MPB ← {𝕩≢⊸↑∾(+˝+˝∘×⎉1‿∞¨)⎉1‿∞˜𝕩(⥊⟜𝕨¨∘⊢/¨⊸⊔𝕨⊸×↑⊣)⌈𝕨÷˜≢𝕩}

(300+50×↕8) {𝕨⊸MPB•_timed𝕩}¨ <3e3‿3e3 •rand.Range 0

MPB2 ← {∾∾×_p¨_p¨(_p←{+˝∘𝔽⎉1‿∞})˜𝕩{𝕩⊔˜/¨⥊⟜𝕨¨⌈𝕨÷˜≢𝕩}´𝕨}
⟨10‿60, 4‿250, 3‿500⟩ {𝕨⊸MPB2•_timed𝕩}¨ <3e3‿3e3•rand.Range 0

⟨+˝∘×⎉1‿∞, 600⊸MPB, +˝∘×⎉1‿∞ _strassen_ 256, Dgemm _strassen_ 256, Dgemm⟩ {𝕎˜•_timed𝕩}¨ <4096‿4096•rand.Range 0

⟨mpi⟩ ⇐ •Import "mpi.bqn"

mpi.Init@ ⋄ r‿s ← ⟨mpi.Rank@, mpi.Size@⟩

# Processor element coordinates in 2D grid (r≡y+q×x)
!⌊⊸=q←√s ⋄ b ← q÷˜n ← 2⋆12 ⋄ x‿y ← q(|⋈˜·⌊÷˜)r

# Local matrices
aml ← (+´b‿b×x‿y)++⌜˜↕b
bml ← (-´b‿b×x‿y)+-⌜˜↕b

# Toroidal topology with periodic boundary conditions, (aml←) (bml↑)
L‿U ← {𝕩⊸mpi.Sendrecv⌾⥊}¨⟨(q×x)+q|y(-⋈+)1 ⋄ y+q×q|x(-⋈+)1⟩

# Strassen algorithm with blocking for cache efficiency
_strassen_ ← {𝕘≥≠𝕩 ? 𝕨𝔽𝕩;
  [a‿b,c‿d]‿[e‿f,g‿h] ← (2⊸⥊¨∘⊢/¨⊸⊔2⊸×↑⊣)¨⟜(⌈2÷˜≢¨)𝕨‿𝕩
  p1‿p2‿p3‿p4‿p5‿p6‿p7 ← 𝕊´¨⟨a+d,e+h⟩‿⟨c+d,e⟩‿⟨a,f-h⟩‿⟨d,g-e⟩‿⟨a+b,h⟩‿⟨c-a,e+f⟩‿⟨b-d,g+h⟩
  𝕩≢⊸↑∾⟨p1+p4+p7-p5, p3+p5⟩≍⟨p2+p4, p1+p3+p6-p2⟩
}
MP ← +˝∘×⎉1‿∞ _strassen_ 256

# Skewing
aml L⍟x↩ ⋄ bml U⍟y↩

# Multiply and shift
cml ← +´{𝕊: aml⊸MP⟜bml⟨aml L↩ ⋄ bml U↩⟩}¨↕q

# Test (not included in benchmark)
cmf ← (+⌜˜+˝∘×⎉1‿∞-⌜˜)↕n
!cml≡r⊑⥊cmf/¨⊸⊔˜⋈˜q⥊b

mpi.Finalize@
