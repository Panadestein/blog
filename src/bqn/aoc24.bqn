Xor ← {s32 ← 2⋆31 ⋄ 𝕨(s32⊸×⊸+´32•bit._xor○(s32⊸(⌊∘÷˜⋈|)))𝕩}
Split ← (¬-˜⊢×·+`»⊸>)∘≠⊔⊢
SplitF ← {((¯1+⊢×·+`»⊸<)¬𝕨⊸≡¨𝕩)⊔𝕩}
Ints ← {•ParseFloat¨((¯1+⊢×·+`»⊸<)𝕩∊𝕨∾'0'+↕10)⊔𝕩}
Input ← {"../../supp/aoc/2024/"∾".inp"∾˜•Fmt𝕩}
_fp ← {𝔽∘⊢⍟≢⟜𝔽_𝕣∘⊢⍟≢⟜𝔽𝕩}
_cnu ← {𝕩{𝕏𝕨}¨𝔽⟨»,»˘,«,«˘⟩}
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
  inf ← -2⋆31 ⋄ r‿s‿e ← ⟨'#'⊸≠, 'S'⊸=, 'E'⊸=⟩{𝕎𝕩}¨<inp ← >•FLines Input𝕩
  dij ← ⌊´∘{⟨⊢_cnu, 1⊸⌽, 1⊸⌽⁼, ⊢⟩{r<⊸×𝕎𝕩}¨⟨𝕩+1, 𝕩+1e3, 𝕩+1e3, 𝕩⟩}_fp 0‿inf‿0‿0×<s
  mn‿mr‿mrc ← r⊸∧¨¨ {⟨2⊸⌽_cnu𝕩-1, 1⌽𝕩-1e3, 1⌽⁼𝕩-1e3⟩=<𝕩}dij
  eins ⇐ inf -˜ opt ← (⌊´dij) ⊑˜⊑/○⥊⟜(↕≢)e
  zwei ⇐ +´⥊∨´ ∨´∘{⟨mn∧2⊸⌽_cnu𝕩, mr∧1⌽𝕩, mrc∧1⌽⁼𝕩, 𝕩⟩}_fp e<⊸∧dij=opt
}
XVI _is 16

XVII ← {
  inp ← 3(↑⋈∘‿2⥊↓)∾⟨⟩⊸Ints¨•FLines Input𝕩
  M ← {r𝕊p:
    Cmb ← {𝕩≤3? 𝕩; r⊑˜𝕩-4}
    out←⟨⟩ ⋄ out ⊣ {
      0‿op𝕊pc: arg←Cmb op ⋄ r(⌊(⊑r)÷2⋆arg)⌾⊑↩ ⋄ pc+1;
      1‿op𝕊pc: r(op Xor ⊢)⌾(1⊸⊑)↩ ⋄ pc+1;
      2‿op𝕊pc: arg←Cmb op ⋄ r(8|arg)⌾(1⊸⊑)↩ ⋄ pc+1;
      3‿op𝕊pc: 0≠◶(pc+1)‿op ⊑r;
      4‿·𝕊pc:  r((2⊑r)Xor⊢)⌾(1⊸⊑)↩ ⋄ pc+1;
      5‿op𝕊pc: out∾↩8|Cmb op ⋄ pc+1;
      6‿op𝕊pc: arg←Cmb op ⋄ r(⌊(⊑r)÷2⋆arg)⌾(1⊸⊑)↩ ⋄ pc+1;
      7‿op𝕊pc: arg←Cmb op ⋄ r(⌊(⊑r)÷2⋆arg)⌾(2⊸⊑)↩ ⋄ pc+1
    }´∘{𝕩⋈˜𝕩⊏p}•_while_{𝕊: 𝕩≠≠p}0
  }
  Q ← {
    ·‿b‿c ← ⊑r‿p ← 𝕩
    {(⥊p) ≡ 𝕩‿b‿c M p ? 𝕩;
     (0=𝕨) ∨ ((-𝕨)↑⥊p) ≡ 𝕩‿b‿c M p ? ⌊´(<𝕨)𝕊{(𝕨+1)𝔽𝕩+8×𝕘}𝕩¨⊒˜p;∞}´0‿0
  }
  eins ⇐ 1↓∾','⊸∾¨('0'-@)+@+M´inp
  zwei ⇐ Q inp
}
XVII _is 17

XVIII ← {
  n ← 70 ⋄ inp ← >⟨⟩⊸Ints¨•FLines Input𝕩
  g ← 1⌾⊑0¨ b ← (1⥊˜1+n‿n) {0⌾(𝕨⊸⊑)𝕩}´<˘1024↑inp
  _sym ← {Ms _𝕣𝕩: ⊑{(𝕨+1)⋈ms∧∨´⊢_cnu⊸∾<𝕩}´•_while_{𝕊: ¬⊢´⊢˝⊢´𝕩} 0‿𝕩}
  _symv ← {Ms _𝕣𝕩: ⊢´⊢˝{ms∧∨´⊢_cnu⊸∾<𝕩}_fp𝕩}
  eins ⇐ b _sym g
  zwei ⇐ inp⊏˜⊑{𝕊l‿r:
    ⟨l‿m,m‿r⟩⊑˜{si←<˘𝕩↑inp ⋄ (0¨⌾(si⊸⊑)b)_symv g}m ← ⌊2÷˜+´𝕩
  }_fp 1024⋈≠inp
}
XVIII _is 18

XIX ← {
  p‿d ← (1⊸↑⋈2⊸↓) •FLines Input𝕩
  dp ← •HashMap˜⟨⟩ ⋄ p(','⊸≢¨⊸/¨·' '⊸Split∾)↩
  C ← {
    dp.Has 𝕩 ? dp.Get 𝕩;
    𝕩{𝕩⊣𝕨dp.Set𝕩}(𝕩≡⟨⟩)∨+´p𝕊{h‿hs←𝕨(↑⋈↓)˜≠𝕩 ⋄ h≡𝕩 ? 𝔽hs; 0}¨˜<𝕩
  }
  zwei‿eins ⇐ (+´⋈·+´0⊸≠)C¨d
}
XIX _is 19

XX ← {
  r‿s ← ⟨'#'⊸≠, 'S'⊸=⟩{𝕎𝕩}¨<inp ← >•FLines Input𝕩
  Sym ← {ms𝕊𝕩: s←𝕩
    s(⊢⋈⊑˜)/○⥊⟜(↕≢){{s+↩𝕩⋄𝕩}ms∧∨´⊢_cnu⊸∾<𝕩}_fp𝕩
  }
  diff ← (-⌜˜ctn)-mh ← (+´|∘-)⌜˜⊑pth‿ctn ← r Sym s
  eins‿zwei ⇐ +´¨⟨mh=2, mh≤20⟩{⥊100≤𝕨×𝕩}¨<diff
}
XX _is 20

XXI ← {
  inp ← •FLines Input𝕩
  kbs ← ["789","456","123"," 0A"]‿[" ^A","<v>"] ⋄ dp ← •HashMap˜⟨⟩
  F ← {
    >´1↓𝕩 ? ≠⊑𝕩; dp.Has 𝕩 ? dp.Get 𝕩;
    𝕊s‿k‿r:
    𝕩{𝕩⊣𝕨dp.Set𝕩}⊑+˝{
      p‿q‿nl ← (𝕩∾' ')(⊑=/○⥊·↕∘≢⊢)¨<⍉kbs⊑˜k>0
      F⟨'A'∾˜{0≠+´×⟜⌽˝q‿p>∘=<nl?⌽𝕩;𝕩}"<v^>"/˜0⌈∾¯1‿1⊸×¨⋈⟜⌽q-p, k+1, r⟩
    }˘2↕'A'∾s
  }
  eins‿zwei ⇐ 2‿25 {+´𝕨{(•ParseFloat 3↑𝕩)×F𝕩‿0‿𝕨}¨𝕩}⌜ <inp
}
XXI _is 21

XXII ← {
  dp ← •HashMap˜⟨⟩ ⋄ inp ← •ParseFloat¨ •FLines Input𝕩
  Ev ← {{16777216|𝕩Xor𝕎𝕩}´⟨2048×⊢, ⌊32÷˜⊢, 64×⊢, 𝕩⟩}
  Ctn ← {𝕩dp.Set𝕨+dp.Get⎊0𝕩}
  {𝕩{@⊣(4↓𝕨) ⊑⊸Ctn˘○((∊w)⊸/)w←4↕𝕩}¨{-´˘2↕𝕩}¨𝕩} 10|sn ← Ev⍟(↕2001)¨ inp
  eins ⇐ +´⊢´¨sn
  zwei ⇐ ⌈´dp.Values@
}
XXII _is 22

XXIII ← {
  p‿c ← (⊢⋈·⍷∾)'-'⊸Split¨•FLines Input𝕩
  am ← (⌽¨⊸∾p)∊˜⋈⌜˜c
  eins ⇐ -○(6÷˜·+´0‿0⍉+˝∘×⎉1‿∞⍟2˜)´ am(⊣⋈/˜)⋈˜('t'≠⊑)¨c
  zwei ⇐ 1↓∾','⊸∾¨∧c/˜⌈´⊸=⌈˝+˝∘×⎉1‿∞˜⊸×⍟2 am
}
XXIII _is 23

XXIV ← {
  gs‿os ← (⊢⊔˜·+`⟨⟩⊸≡¨)•FLines Input𝕩
  op ← "AND"‿"OR"‿"XOR"•HashMap "∧"‿"∨"‿"≠" ⋄ os 1⊸↓↩
  TS ← {{𝕊⍟(𝕩<○≠⊢)⟜(𝕩∾·/𝕨⊸<)𝕨∨∧´∘⊏⟜𝕨¨p}⟜/0¨p←𝕩}
  tsn ← (3⊸↑¨gs)∾⊑¨urd ← {a‿o‿b‿·‿r←' 'Split𝕩 ⋄ ⟨r, a‿b⟩}¨os
  ord ← (≠gs)(↓-⊣)TS(⟨⟨⟩⟩⥊˜≠gs)∾(tsn⊸⊐⊢´)¨urd
  defs ← {'←'¨⌾((𝕩=':')⊸/)𝕩}¨gs
  dos ← ord⊏{a‿o‿b‿·‿r←' 'Split𝕩 ⋄ do ← op.Get o ⋄ ∾´r‿'←'‿a‿do‿b}¨os
  eins ⇐ +´(⊢×2⋆↕∘≠)•BQN(∾'⋄'⊸∾¨defs∾dos)∾'⋄'∾1↓∾'‿'⊸∾¨(⊢∾˜·1⊸=◶"z"‿"z0"≠)¨•Fmt¨↕46
  zwei ⇐ "cqm,mps,vcv,vjv,vwp,z13,z19,z25" # Graphviz
 }
 XXIV _is 24

XXV ← {
  inp ← >¨⟨⟩SplitF•FLines Input𝕩
  eins‿zwei ⇐ "All done!"⋈˜2÷˜+´⥊{¬∨´⥊1<+´'#'=𝕨‿𝕩}⌜˜inp
}
XXV _is 25
