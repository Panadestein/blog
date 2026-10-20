
DFT ← ⊢+˝∘×⎉1‿∞˜·⋆∘⍳¯2×π×≠÷˜·×⌜˜↕∘≠



RC ← •rand.Range⟜0{𝔽⍳𝔽}
_err_ ← {+´∘|∘⥊𝔽-𝔾}



FFT ← {𝕊⁼: 𝕊⌾+⊸÷⟜≠𝕩; (+∾-)⟜(⊢×·⋆∘⍳¯π×⊒˜÷≠)´∘(𝕊¨⊢⊔˜2|⊒˜)⍟(1<≠)𝕩}



FFT _err_ DFT RC 2⋆10



FFT2 ← {
  (𝕩⊏˜⥊+⌜´0∾¨p){
    t ← ⋆-⍳π×𝕨÷˜↕𝕨
    ⥊(+∾-)⟜(t⊸×)˝⌾⍉∘‿2‿𝕨⥊𝕩
  }´⌽p ← ↕⌾(2⊸⋆⁼)≠𝕩
}



!(1e¯15>FFT _err_ FFT2) v ← RC 2⋆20
5 (FFT•_timed⋈FFT2•_timed) v



FFT3 ← {
  hm ← •HashMap˜⟨⟩
  Pease ← {
    hm.Has≠𝕩 ? kernel ← hm.Get≠𝕩 ⋄ Kernel𝕩;
    t ← ⌽⊸{𝕨/¨⋆⍳-π×↕⊸÷¨𝕩}k ← ↕⌾(2⊸⋆⁼)≠𝕩
    s‿r ← ⟨⥊⍉2‿∘⥊↕≠𝕩, ⥊+⌜´0∾¨k⟩
    Kernel ← {r⊏𝕩{s⊏(+∾𝕨×-)˝2‿∘⥊𝕩}´t}
    kernel hm.Set˜≠𝕩 ⋄ Kernel𝕩
  }
  _block ← {
    𝕗≥≠𝕩 ? Pease𝕩;
    c‿r ← (⌊⋈⌈)∘÷⟜2⌾(2⊸⋆⁼)n ← ≠𝕩
    t ← ⋆-⍳2×π×n÷˜c×⌜○↕r
    ⥊𝕊˘⌾⍉t×𝕊˘⍉r‿c⥊𝕩
  }
  1024 _block 𝕩
}



!(1e¯6>FFT _err_ FFT3) v ← RC 2⋆20
5 (FFT•_timed⋈FFT3•_timed) v



km‿tm ← •HashMap˜¨⋈˜↕0

FFT4 ← {
  𝕨𝕊⁼𝕩: ≍⟜-˝{⊢´∘≢÷˜·𝔽𝔾∘𝔽}(𝕨⊸𝕊)𝕩;

  Cmu‿Cis ← ⟨-˝∘×≍·+˝×⟜⌽, •math{𝕗.Cos≍𝕗.Sin}⟩

  Pease ← {
    km.Has𝕨 ? (km.Get𝕨){𝔽}𝕩;
    t ← ⌽⊸{𝕨/˘¨Cis¨-π×↕⊸÷¨𝕩}k ← ↕⌾(2⊸⋆⁼)𝕨
    s‿r ← ⟨⥊⍉2‿∘⥊↕𝕨, ⥊+⌜´0∾¨k⟩ # perfect shuffle ⋈ bit reversal
    Kernel ← {r⊸⊏˘𝕩{s⊸⊏˘(+˝∾˘𝕨Cmu-˝)1⍉2‿2‿∘⥊𝕩}´t}
    𝕨 km.Set kernel ⋄ Kernel𝕩
  }

  _block ← {
    𝕗≥⊢´≢𝕩 ? ⊢´∘≢⊸Pease𝕩;
    c‿r ← (⌊⋈⌈)∘÷⟜2⌾(2⊸⋆⁼)n ← ⊢´≢𝕩
    t ← {tm.Has n ? tm.Get n;
      n tm.Set Cis˘-2×π×n÷˜c×⌜○↕r ⋄ tm.Get n
    }
    2‿∘⥊⍉𝕊˘2‿1⍉t Cmu˘𝕊˘⍉⁼2‿r‿c⥊𝕩
  }

  𝕨_block 𝕩
}



1024 FFT4{+´|⥊𝕩-𝕨𝔽⁼𝕨𝔽𝕩} 0•rand.Range˜2⋈2⋆12



v ← 0•rand.Range˜2⋈2⋆23
10 4096⊸FFT4•_timed v

