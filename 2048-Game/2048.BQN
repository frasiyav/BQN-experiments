# 2048 Game

_while_ ← {𝕊⍟𝔾 𝔽 𝕩}
_retry_ ← {𝔾◶⟨𝕊𝕩˙, ⊢⟩ 𝔽 𝕩}
GetInput ← {c←¯1⊑p←𝕩 ⋄ ⊑{{•←𝕩}¨p ⋄ •Stdin 𝕩} _retry_ (∊⟜c) 1}

Game ← {
  Move ← {
    ⟨L,R,U,D⟩ ← {L⇐⊢ ⋄ R⇐{𝕊:⌽˘𝕩;𝕊⁼:𝕊𝕩} ⋄ U⇐⍉ ⋄ D⇐R⍉}
    C ← ≠↑×⟜(∾·(≠⊸⥊⟜1‿0∧1+«⊸=)¨(+`∘»«⊸≠)⊸⊔){𝔾𝔽𝔾𝕩}((/0⊸≠)⊸⊏)
    C˘⌾(⍎GetInput⟨𝕩, "Enter move:", "l"‿"r"‿"u"‿"d"⟩) 𝕩
  }
  SpawnTile ← {(2+2×2=•Rand 10)⌾((•Rand∘≠⊸⊏/0=𝕩)⊸⊑)𝕩}
  Turn ← {Move _retry_ (≢⟜𝕩) 𝕩}∘SpawnTile

  board ← {𝕩‿𝕩⥊0} ⍎GetInput⟨"Enter Board Size:", "4"‿"5"‿"6"⟩
  𝕤 ⋄ Turn _while_ (¬2048⊸∊) board
 }

 •←Game @
