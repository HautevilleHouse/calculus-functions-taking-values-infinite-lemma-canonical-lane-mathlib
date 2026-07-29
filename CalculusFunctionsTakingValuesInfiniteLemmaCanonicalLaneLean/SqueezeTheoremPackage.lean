import canonicalLaneMathlib.AdmissibleClass

/-!
# Squeeze Theorem Package

This module captures the squeeze theorem for infinite limits.
-/

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure SqueezeTheoremConditions where
  lowerBound : Prop
  upperBound : Prop
  functionBounded : Prop
  limitResult : Prop

structure SqueezeTheoremEvidence where
  lowerBoundClosed : Bool
  upperBoundClosed : Bool
  functionBoundedClosed : Bool
  limitResultClosed : Bool

def SqueezeTheoremClosed (S : SqueezeTheoremConditions) : Prop :=
  S.lowerBound ∧ S.upperBound ∧ S.functionBounded ∧ S.limitResult

theorem squeeze_theorem_closed_from_evidence
    (S : SqueezeTheoremConditions) (E : SqueezeTheoremEvidence) :
    SqueezeTheoremClosed S := by
  exact And.intro E.lowerBoundClosed
    (And.intro E.upperBoundClosed
      (And.intro E.functionBoundedClosed E.limitResultClosed))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse
