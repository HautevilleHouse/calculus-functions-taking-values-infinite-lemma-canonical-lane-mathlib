import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure FunctionValuesAtInfinityPackage where
  limitAtInfinity : Prop
  asymptoticBehavior : Prop
  boundednessOnFiniteIntervals : Prop
  oscillationControl : Prop

structure FunctionValuesAtInfinityEvidence (F : FunctionValuesAtInfinityPackage) where
  limitAtInfinityClosed : F.limitAtInfinity
  asymptoticBehaviorClosed : F.asymptoticBehavior
  boundednessOnFiniteIntervalsClosed : F.boundednessOnFiniteIntervals
  oscillationControlClosed : F.oscillationControl

def FunctionValuesAtInfinityClosed (F : FunctionValuesAtInfinityPackage) : Prop :=
  F.limitAtInfinity ∧ F.asymptoticBehavior ∧ F.boundednessOnFiniteIntervals ∧ F.oscillationControl

theorem function_values_at_infinity_closed_from_evidence (F : FunctionValuesAtInfinityPackage)
    (E : FunctionValuesAtInfinityEvidence F) : FunctionValuesAtInfinityClosed F := by
  exact And.intro E.limitAtInfinityClosed (And.intro E.asymptoticBehaviorClosed
    (And.intro E.boundednessOnFiniteIntervalsClosed E.oscillationControlClosed))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse