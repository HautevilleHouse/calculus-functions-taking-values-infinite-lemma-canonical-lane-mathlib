import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure InfiniteValuesPackage where
  functionSpace : Type u
  targetSpace : Type v
  infiniteValueLemma : Prop
  valueRangeClassification : Prop
  limitPointExists : Prop

structure InfiniteValuesEvidence (P : InfiniteValuesPackage) where
  infiniteValueLemmaClosed : P.infiniteValueLemma
  valueRangeClassificationClosed : P.valueRangeClassification
  limitPointExistsClosed : P.limitPointExists

def InfiniteValuesClosed (P : InfiniteValuesPackage) : Prop :=
  P.infiniteValueLemma ∧ P.valueRangeClassification ∧ P.limitPointExists

theorem infinite_values_closed_from_evidence (P : InfiniteValuesPackage) (E : InfiniteValuesEvidence P) :
    InfiniteValuesClosed P := by
  exact And.intro E.infiniteValueLemmaClosed
    (And.intro E.valueRangeClassificationClosed E.limitPointExistsClosed)

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse