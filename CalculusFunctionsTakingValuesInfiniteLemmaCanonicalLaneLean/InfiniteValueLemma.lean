import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure InfiniteValueFunctionPackage where
  domain : Type u
  target : Type v
  extendedRealValues : target = WithTop ℝ
  functionContinuity : Prop
  limitInfiniteExists : Prop
  integrabilityInfinite : Prop
  lemmaStatement : Prop

structure InfiniteValueFunctionEvidence (P : InfiniteValueFunctionPackage) where
  functionContinuityClosed : P.functionContinuity
  limitInfiniteExistsClosed : P.limitInfiniteExists
  integrabilityInfiniteClosed : P.integrabilityInfinite
  lemmaStatementClosed : P.lemmaStatement

def InfiniteValueFunctionClosed (P : InfiniteValueFunctionPackage) : Prop :=
  P.functionContinuity ∧ P.limitInfiniteExists ∧ P.integrabilityInfinite ∧ P.lemmaStatement

theorem infinite_value_function_closed_from_evidence
    (P : InfiniteValueFunctionPackage) (E : InfiniteValueFunctionEvidence P) :
    InfiniteValueFunctionClosed P := by
  exact And.intro E.functionContinuityClosed
    (And.intro E.limitInfiniteExistsClosed
      (And.intro E.integrabilityInfiniteClosed E.lemmaStatementClosed))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse