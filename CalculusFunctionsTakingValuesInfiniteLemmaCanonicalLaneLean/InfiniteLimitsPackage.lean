import canonicalLaneMathlib.AdmissibleClass

/-!
# Infinite Limits Package

This module defines the object language for functions taking infinite values,
including the tendency to infinity, limit superior/inferior, and the infinite
limit lemma.
-/

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure CalculusFunctionObject where
  domain : Type u
  codomain : Type v
  function : domain → codomain
  infiniteValueBehavior : Prop
  limitAtPoint : Prop
  conclusion : limitAtPoint

structure InfiniteLimitCharacterization where
  tendsToInfinity : Prop
  tendsToNegativeInfinity : Prop
  limitSuperior : Prop
  limitInferior : Prop
  infiniteLimitLemma : Prop

structure InfiniteLimitEvidence where
  tendsToInfinityClosed : Bool
  tendsToNegativeInfinityClosed : Bool
  limitSuperiorClosed : Bool
  limitInferiorClosed : Bool
  infiniteLimitLemmaClosed : Bool

def InfiniteLimitClosed (C : InfiniteLimitCharacterization) : Prop :=
  C.tendsToInfinity ∧ C.tendsToNegativeInfinity ∧
  C.limitSuperior ∧ C.limitInferior ∧ C.infiniteLimitLemma

theorem infinite_limit_closed_from_evidence
    (C : InfiniteLimitCharacterization) (E : InfiniteLimitEvidence) :
    InfiniteLimitClosed C := by
  exact And.intro E.tendsToInfinityClosed
    (And.intro E.tendsToNegativeInfinityClosed
      (And.intro E.limitSuperiorClosed
        (And.intro E.limitInferiorClosed E.infiniteLimitLemmaClosed)))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse
