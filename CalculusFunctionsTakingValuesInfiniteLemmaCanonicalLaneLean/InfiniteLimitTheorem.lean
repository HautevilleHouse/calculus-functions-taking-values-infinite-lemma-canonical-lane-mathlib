import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure InfiniteLimitTheoremPackage where
  limitExistsAtInfinity : Prop
  limitValueFiniteOrInfinite : Prop
  sequentialCharacterization : Prop
  cauchyConditionAtInfinity : Prop

structure InfiniteLimitTheoremEvidence (L : InfiniteLimitTheoremPackage) where
  limitExistsAtInfinityClosed : L.limitExistsAtInfinity
  limitValueFiniteOrInfiniteClosed : L.limitValueFiniteOrInfinite
  sequentialCharacterizationClosed : L.sequentialCharacterization
  cauchyConditionAtInfinityClosed : L.cauchyConditionAtInfinity

def InfiniteLimitTheoremClosed (L : InfiniteLimitTheoremPackage) : Prop :=
  L.limitExistsAtInfinity ∧ L.limitValueFiniteOrInfinite ∧
  L.sequentialCharacterization ∧ L.cauchyConditionAtInfinity

theorem infinite_limit_theorem_closed_from_evidence (L : InfiniteLimitTheoremPackage)
    (E : InfiniteLimitTheoremEvidence L) : InfiniteLimitTheoremClosed L := by
  exact And.intro E.limitExistsAtInfinityClosed (And.intro E.limitValueFiniteOrInfiniteClosed
    (And.intro E.sequentialCharacterizationClosed E.cauchyConditionAtInfinityClosed))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse