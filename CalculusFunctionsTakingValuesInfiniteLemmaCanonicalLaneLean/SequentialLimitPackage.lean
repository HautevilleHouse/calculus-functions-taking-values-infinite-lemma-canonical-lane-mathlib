import canonicalLaneMathlib.AdmissibleClass

/-!
# Sequential Limit Package

This module formalizes the sequential criterion for infinite limits.
-/

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure SequentialCharacterization where
  sequentialCondition : Prop
  limitExists : Prop
  equivalenceHolds : Prop

structure SequentialLimitEvidence where
  sequentialConditionClosed : Bool
  limitExistsClosed : Bool
  equivalenceHoldsClosed : Bool

def SequentialLimitClosed (S : SequentialCharacterization) : Prop :=
  S.sequentialCondition ∧ S.limitExists ∧ S.equivalenceHolds

theorem sequential_limit_closed_from_evidence
    (S : SequentialCharacterization) (E : SequentialLimitEvidence) :
    SequentialLimitClosed S := by
  exact And.intro E.sequentialConditionClosed
    (And.intro E.limitExistsClosed E.equivalenceHoldsClosed)

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse
