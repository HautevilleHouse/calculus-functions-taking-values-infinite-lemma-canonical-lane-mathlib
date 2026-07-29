import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure InfiniteValueClassificationPackage where
  infiniteLimitTypeClassified : Prop
  logarithmicExponentialGrowth : Prop
  oscillatoryUnboundedDetected : Prop
  valueSetClosureAtInfinity : Prop

structure InfiniteValueClassificationEvidence (C : InfiniteValueClassificationPackage) where
  infiniteLimitTypeClassifiedClosed : C.infiniteLimitTypeClassified
  logarithmicExponentialGrowthClosed : C.logarithmicExponentialGrowth
  oscillatoryUnboundedDetectedClosed : C.oscillatoryUnboundedDetected
  valueSetClosureAtInfinityClosed : C.valueSetClosureAtInfinity

def InfiniteValueClassificationClosed (C : InfiniteValueClassificationPackage) : Prop :=
  C.infiniteLimitTypeClassified ∧ C.logarithmicExponentialGrowth ∧
  C.oscillatoryUnboundedDetected ∧ C.valueSetClosureAtInfinity

theorem infinite_value_classification_closed_from_evidence
    (C : InfiniteValueClassificationPackage)
    (E : InfiniteValueClassificationEvidence C) : InfiniteValueClassificationClosed C := by
  exact And.intro E.infiniteLimitTypeClassifiedClosed (And.intro E.logarithmicExponentialGrowthClosed
    (And.intro E.oscillatoryUnboundedDetectedClosed E.valueSetClosureAtInfinityClosed))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse