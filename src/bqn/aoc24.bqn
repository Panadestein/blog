Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢
Input ← {"../supp/aoc/2024/"∾".inp"∾˜•Fmt𝕩}
_is ← {(𝔽𝕩).eins⋈(𝔽𝕩).zwei}

I ← {
  inp ← >(•ParseFloat¨' '⊸Split)¨•FLines Input𝕩
  eins ⇐ +´|-´˘∧˘⌾⍉inp
  zwei ⇐ {+´𝕨×-´(∧𝕩)⊸⍋¨(⊢⋈-⟜1)𝕨}´<˘⍉inp
}
I _is 1

II ← {
  inp ← (-´˘·2⊸↕·•ParseFloat¨' '⊸Split)¨•FLines Input𝕩
  P‿Q ← ⟨3≥⌈´∘|, ≠=·|+´∘×⟩
  F1‿F2‿F3 ← P‿P‿Q {𝕎∧𝕏}¨ ⟨Q, 1=≠-·|·+´×, 1=·+´3>|⟩   
  eins ⇐ +´F1¨inp
  zwei ⇐ eins + {a‿b‿ab: ab-˜b+a} ⟨F2, F3, F2∧F3⟩ {≠𝕎¨⊸/𝕩}¨ <(¬F1¨)⊸/inp
}
II _is 2

III ← {
  mem ← •FChars Input𝕩
  prg ← mem/˜1=×∘+`2×-´"do()"‿"don't()"(≢∘⊢↑⍷)¨<mem
  mul‿cmd ← {(12↑↓⟜𝕩)¨4+/"mul("(≢∘⊢↑⍷)𝕩}¨mem‿prg
  C ← {
    l‿r←⊑⎊0¨1(↑⋈↓)','Split𝕩
    l×○•ParseFloat⎊0 (∨´⎊0')'⊸=)◶⟨0, ⊑')'⊸Split⟩r
  }
  eins‿zwei ⇐ (+´C¨)¨ mul‿cmd
}
III _is 3

IV ← {
  inp ← >•FLines Input 𝕩
  t‿ts ← ⟨"XMAS"‿"SAMX", "MSAMS"‿"SMASM"‿"SSAMM"‿"MMASS"⟩
  eins ⇐ +´+´∘⥊¨t ⍷⌜{⟨+´𝕨𝔽<𝕩, +´𝕨𝔽<⍉𝕩, ∾+˝𝕨𝔽𝔾𝕩, ∾+˝𝕨𝔽𝔾⌽𝕩⟩}(⊢⊔˜·+⌜´↕¨∘≢) inp
  xm ← ⌽˘⊸∨=⌜˜↕3 ⋄ zwei ⇐ +´⥊{ts≡¨<xm/○⥊𝕩}⎉2 3‿3↕inp
}
IV _is 4

V ← {
  p‿r ← ",|" •ParseFloat⚇1∘(Split¨)¨ 1↓(∧`⊸+⟨⟩⊸≢¨)⊸⊔ •FLines Input𝕩
  M ← (⍒∊⟜(>r)∘⋈⌜˜)¨⊏¨⊢
  g‿b ← p⊔˜∞=+´˘ p (2=·+´∘⥊=⌜)◶0‿{𝕩(⊣≡⊢/˜·+˝=⌜)𝕨?1;∞}⌜ r
  eins‿zwei ⇐ (+´(⊢⊑˜·⌊2÷˜≠)¨)¨ g⋈M b
}
V _is 5

VI ← {
  hm ← (↕∘≢•HashMap○⥊⊢) inp ← >•Flines Input𝕩
  g ← ⊑/○⥊⟜(↕≢)'^'= inp ⋄ r ← ⟨¯1, 0⟩‿⟨0, 1⟩‿⟨1, 0⟩‿⟨0, ¯1⟩
  Sym ← {𝕊m: s ← •HashMap˜⟨⟩
    (s.Keys@) ⋈ s.Has {𝕊p‿d:
      s.Set˜p‿d ⋄ '#'=◶{𝕊:d⋈˜p+d⊑r}‿{𝕊:p⋈4|d+1} m.Get⎊@ p+d⊑r
    }•_while_{𝕊𝕩: (m.Has⊑𝕩) ∧ ¬s.Has𝕩} g‿0
  }
  eins‿zwei ⇐ (≠⋈·+´{𝕩hm.Set'#' ⋄ (𝕩hm.Set'.')⊢⊢´Sym hm}¨) ⍷⊏⍉>⊑Sym hm
}
VI _is 6

VII ← {
  inp ← (⊑⊸⋈○(•ParseFloat¨' '⊸Split)´':'⊸Split)¨•FLines Input𝕩
  C ← ⊢+⊣×10⊸⋆⟜(⌊1+10⋆⁼1⌈|)
  eins ⇐ +´{⊑𝕨∊(+∾×)´⌽𝕩?𝕨;0}´¨ inp
  zwei ⇐ +´{⊑𝕨∊(C˜∾+∾×)´⌽𝕩?𝕨;0}´¨ inp
}
VII _is 7

VIII ← {
  n ← ≠⊑inp‿ant ← (⊢⋈1↓⍷∘⥊)>•FLines Input𝕩
  _tcd ← {(𝕨⊸×-(𝕨-1)×⊣)⌜˜⊸𝔽/○⥊⟜(↕≢)𝕩}
  eins ⇐ ≠⍷(∧´≥⟜0∧<⟜n)⊸/∾ 2 (⥊∘⊣/˜·¬⥊⊸∊)_tcd¨ ant=<inp
  zwei ⇐ +´(∧´≥⟜0∧<⟜n)¨⍷∾∾ (↕n) ⥊∘⊣_tcd¨⌜<ant=<inp
}
VIII _is 8

IX ← {
   f‿s ← <˘⍉↑‿2⥊•ParseFloat∘⋈¨⊑•FLines Input𝕩
   m ← ¯1=d ← ∾⥊⍉ds ← (⊔˜/f)≍¯1¨∘↕¨sm ← s
   ds ⊣ {n𝕊cf: (p<n)∧(≠f)>p←⊑1⊐˜cf≠⊸≤sm?
     ds({cf«𝕩}⌾(1‿p⊸⊑){¯1¨𝕩}⌾(0‿n⊸⊑))↩ ⋄ @⊣sm{𝕩-≠cf}⌾(p⊸⊑)↩; @
   }´˘(⊢≍˘˜·⌽⊒˜)⌽⊏ds
   eins ⇐ {+´(⊢×↕∘≠)(𝕩-˜≠d)↑(𝕩↑⌽/f)⌾(m⊸/)d}+´s
   zwei ⇐ +´(⊢×↕∘≠)(⊢×¯1⊸≠)∾⥊⍉{𝕊⟨⟩:𝕩;(⌽∘⊣∾⊢)´𝕩⊔˜𝕩=¯1}¨⌾(1⊸⊏)ds
}
IX _is 9

X ← {
  inp ← >'0'-˜•FLines Input𝕩
  I ← {(𝕨⊸=/○⥊⟜(↕≢)⊢)𝕩}
  P ← {(4/≍≢inp)(⊢/˜·∧´˘>∧0⊸≤)>⟨¯1‿0, 0‿1, 1‿0, 0‿¯1⟩+<𝕩}
  BFS ← {
    v‿r ← •HashMap{⟨𝕩𝔽○⋈@, 𝔽˜⟨⟩⟩}𝕩
    (r.Count@) ⊣ 1⊸↓∘{9=⊑⊑𝕩 ? 𝕩⊣@r.Set˜⊢´⊑𝕩; h‿c←⊑𝕩
      𝕩∾@⊸≢¨⊸/⥊{(h=1-˜𝕩⊑inp)∧¬v.Has𝕩}◶⟨@⟩‿{@v.Set˜𝕩⋄⋈𝕩⋈˜h+1}˘P c
    }•_while_{𝕊:0≠≠𝕩} ⋈0‿𝕩
  }
  DP ← {h𝕊ct: ct⊣{ct(+´{h=1-˜𝕩⊑inp?𝕩⊑ct;0}˘P𝕩)⌾(𝕩⊸⊑)↩}¨h I inp}
  eins ⇐ +´BFS¨ 0 I inp
  zwei ⇐ +´⥊ (inp=0) × (inp=9) DP´↕9
}
X _is 10
