{-# OPTIONS --without-K #-}

open import Base
open import CategoryTheory.PullbackDef

module CategoryTheory.PullbackIsPullback {i} (d : pullback-diag i) where

open pullback-diag d

import CategoryTheory.PullbackUP as PullbackUP
open PullbackUP d (λ _ → unit)

pullback-cocone : cocone (pullback d)
pullback-cocone = (pullback.a d , pullback.b d , pullback.h d)

factor-pullback : (E : Set i) → (cocone E → (E → pullback d))
factor-pullback E (top→A , top→B , h) x = (top→A x , top→B x , h x)

pullback-is-pullback : is-pullback (pullback d) pullback-cocone
pullback-is-pullback E = iso-is-eq _
  (factor-pullback E)
  (λ y → refl _)
  (λ f → refl _)
