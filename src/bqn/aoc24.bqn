Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢
Ints ← {•ParseFloat¨((¯1+⊢×·+`»⊸<)𝕩∊𝕨∾'0'+↕10)⊔𝕩}
Input ← {"../supp/aoc/2024/"∾".inp"∾˜•Fmt𝕩}
_is ← {
 ∾⟨"Computed ", •Fmt(𝔽𝕩).eins, " and ",
    •Fmt(𝔽𝕩).zwei, " in ", •Fmt 10𝔽•_timed𝕩, "s"⟩
}

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
  eins ⇐ +´(∧´≥⟜0∧<⟜n)¨⍷∾ 2 (⥊∘⊣/˜·¬⥊⊸∊)_tcd¨ ant=<inp
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
  DP ← {
   dpm ← (𝕩=9)𝕩{h 𝔽_𝕣 ct: ct⊣{ct(+´{h=1-˜𝕩⊑inp?𝕩⊑ct;0}˘P𝕩)⌾(𝕩⊸⊑)↩}¨h I𝕗}´↕9
   +´⥊ (𝕩=0) × dpm
  }
  AMP ← {
    am ← (1=-⌜˜⥊𝕩)∧1=+´∘|∘-⌜˜⥊↕≢𝕩
    +´⥊(0=⥊𝕩)/⌾⍉(9=⥊𝕩)/{𝕩𝕨⊸𝕊⍟≢𝕨+𝕨+˝∘×⎉1‿∞𝕩}˜am
  }
  eins ⇐ +´BFS¨ 0 I inp
  zwei ⇐ DP inp
}
X _is 10

XI ← {
  inp ← •ParseFloat¨' 'Split⊑•Flines Input𝕩 ⋄ m ← •HashMap˜⟨⟩
  B ← {
    m.Has𝕨‿𝕩 ? m.Get𝕨‿𝕩;
    ·𝕊0: 1;      
    0𝕊𝕩: 𝕩{𝕩 ⊣ 𝕨m.Set𝕩}1𝕊𝕩-1;
    e𝕊c: l‿r ← e (⌊∘÷⋈|˜) 10⋆⌊2÷˜d ← ⌊1+10⋆⁼e 
    {𝕩⊣e‿c m.Set𝕩} 𝕊{0=𝕩 ? (l⊸𝔽+r⊸𝔽)c-1; (2024×e)𝔽c-1} 2|d
  }
  zwei ⇐ +´inp B¨ 75
  eins ⇐ +´inp B¨ 25
}
XI _is 11

XII ← {
   n‿inp ← ≠⊸⋈>•FLines Input𝕩
   sf‿sp‿sc ← ⟨»˘, », «˘, «⟩‿⟨0‿¯1, ¯1‿0, 0‿1, 1‿0⟩‿⟨1‿0, 1‿2, 3‿0, 3‿2⟩
   mn‿mp ← (∾¨´⋈·+´¬) inp<⊸=nud ← sf{𝕎𝕩}¨<inp
   mc ← +´sc{hv←(sf⊑˜⊢´𝕨){𝔽}⊑h‿v←𝕨⊏nud ⋄ ((𝕩≠h)∧𝕩≠v)∨(𝕩≠hv)∧(𝕩=v)∧𝕩=h}¨<inp
   BFS ← {
     +´{𝕩⊑v?0; v 1⌾(𝕩⊸⊑)↩ ⋄ a‿p‿c ← 0‿0‿0
       1⊸↓∘{𝕊: h←⊑𝕩 ⋄ a+↩1 ⋄ p+↩h⊑mp ⋄ c+↩h⊑mc
 	       𝕩∾{𝕩⊣v 1¨⌾(𝕩⊸⊑)↩}{𝕩/˜(0=𝕩⊑⎊∞¨<v)∧(h⊑mn)∧(∧´≥⟜0∧<⟜n)¨𝕩}sp+<h
       }•_while_{𝕊: 0<≠𝕩} ⋈𝕩 ⋄ a×p‿c}¨⥊↕≢ v ← 0¨𝕩
   }
   eins‿zwei ⇐ BFS inp
 }
XII _is 12

XIII ← {
 ∘‿3‿2⥊∾Ints¨⟨⟩⊸≢¨⊸/•FLines Input 𝕩
 C ← (-´×⟜⌽˝){𝕨𝔽_𝕣[a,b,c]: (𝔽÷˜(𝕨+c)⌾⊏⋈○𝔽(𝕨+c)⌾(⊏⌽))a≍b} 
 eins‿zwei ⇐ {+´⥊3‿1×⎉1(∧´⌊⊸=)˘⊸/𝕩⊸C˘inp}¨ 0‿1e13
}
XIII _is 13

XIV ← {
  sm ← 0⥊˜s ← 101‿103 ⋄ inp ← 2‿2⊸⥊˘>'-'⊸Ints¨•FLines Input𝕩
  Q ← {𝕊r: ×´+´∘⥊¨0‿2‿6‿8⊏⥊(({/𝕩∾1∾𝕩}·⌊÷⟜2)¨s)⊔+˝{1⌾((s|𝕨+r×𝕩)⊸⊑)sm}˝˘inp}
  eins ⇐ Q 100
  zwei ⇐ ⊑⍋Q¨↕•math.LCM´s
}
XIV _is 14

XV ← {
  ri ← ⊑/○⥊⟜(↕≢)'@'=⊑w‿m ← >⊸⋈⟜∾´(⊢⊔˜·+`⟨⟩⊸≡¨)•FLines Input𝕩
  m{<˘⌽⍉>"v^"‿"><"(-˝=⌜)¨<𝕩}↩
  oid ← ∘‿2⥊/○⥊⟜(↕≢) 'O'=wd ← (⊢/˜2×1⥊˜≠)˘w ⋄ rid‿ridp ← /○⥊⟜(↕≢) '@'=wd
  wd '.'⌾(ridp⊸⊑)↩ ⋄ {@ ⊣ wd(']'⌾(𝕩⊸⊑)'['⌾(𝕨⊸⊑))↩}´˘oid
  DFS ← {dr𝕊r:
    Step ← {
      '#'=w⊑˜𝕩+dr ? 1;
      '['=w⊑˜𝕩+dr ? 𝕊𝕩+dr+0‿1 ? 1;
      ']'=w⊑˜𝕩+dr ? 𝕊𝕩+dr-0‿1 ? 1;
      ⊑"[O]"∊˜w⊑˜𝕩+dr ? 𝕊𝕩+dr ? 1;
      0 ⊣ w('.'⌾(𝕩⊸⊑)(𝕩⊑w)⌾((𝕩+dr)⊸⊑))↩
    }
    cw ← w ⋄ Step◶{𝕊: 𝕩+dr}‿{𝕊: w↩cw ⋄ 𝕩} r
  }
  ri DFS´m ⋄ eins ⇐ +´⥊100‿1×⎉1>/○⥊⟜(↕≢)'O'=w
  w↩wd ⋄ rid DFS´m ⋄ zwei ⇐ +´⥊100‿1×⎉1>/○⥊⟜(↕≢)'['=w
}
XV _is 15

XVI ← {
  r‿s‿e ← ⟨'#'⊸≠, 'S'⊸=, 'E'⊸=⟩{𝕎𝕩}¨<inp ← >•FLines Input𝕩
  _fp ← {𝔽∘⊢⍟≢⟜𝔽_𝕣∘⊢⍟≢⟜𝔽𝕩} ⋄ _m ← {𝕩{𝕏𝕨}¨𝔽⟨»,»˘,«,«˘⟩} ⋄ inf ← -2⋆31
  dij ← ⌊´∘{⟨⊢_m, 1⊸⌽, 1⊸⌽⁼, ⊢⟩{r<⊸×𝕎𝕩}¨⟨𝕩+1, 𝕩+1e3, 𝕩+1e3, 𝕩⟩}_fp 0‿inf‿0‿0×<s
  mn‿mr‿mrc ← r⊸∧¨¨ {⟨2⊸⌽_m𝕩-1, 1⌽𝕩-1e3, 1⌽⁼𝕩-1e3⟩=<𝕩}dij
  eins ⇐ inf -˜ opt ← (⌊´dij) ⊑˜⊑/○⥊⟜(↕≢)e
  zwei ⇐ +´⥊∨´ ∨´∘{⟨mn∧2⊸⌽_m𝕩, mr∧1⌽𝕩, mrc∧1⌽⁼𝕩, 𝕩⟩}_fp e<⊸∧dij=opt
}
XVI _is 16
