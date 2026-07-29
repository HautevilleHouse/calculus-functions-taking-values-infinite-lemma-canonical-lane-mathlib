import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure ImproperIntegralConvergencePackage where
  integralConvergesAtInfinity : Prop
  absoluteConvergence : Prop
  comparisonTestAtInfinity : Prop
  integralRepresentationViaLimit : Prop

structure ImproperIntegralConvergenceEvidence (I : ImproperIntegralConvergencePackage) where
  integralConvergesAtInfinityClosed : I.integralConvergesAtInfinity
  absoluteConvergenceClosed : I.absoluteConvergence
  comparisonTestAtInfinityClosed : I.comparisonTestAtInfinity
  integralRepresentationViaLimitClosed : I.integralRepresentationViaLimit

def ImproperIntegralConvergenceClosed (I : ImproperIntegralConvergencePackage) : Prop :=
  I.integralConvergesAtInfinity ∧ I.absoluteConvergence ∧
  I.comparisonTestAtInfinity ∧ I.integralRepresentationViaLimit

theorem improper_integral_convergence_closed_from_evidence (I : ImproperIntegralConvergencePackage)
    (E : ImproperIntegralConvergenceEvidence I) : ImproperIntegralConvergenceClosed I := by
  exact And.intro E.integralConvergesAtInfinityClosed (And.intro E.absoluteConvergenceClosed
    (And.intro E.comparisonTestAtInfinityClosed E.integralRepresentationViaLimitClosed))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse