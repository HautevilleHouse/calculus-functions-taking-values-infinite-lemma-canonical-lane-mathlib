import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.ExtendedRealObjects

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure ExtendedRealFunctionPackage where
  space : ExtendedRealFunctionSpace
  function : space.carrier → ℝ≥0∞
  measurable : Prop
  integrable : Prop
  integral : ℝ≥0∞

structure ExtendedRealFunctionEvidence (G : ExtendedRealFunctionPackage) where
  measurableClosed : G.measurable
  integrableClosed : G.integrable
  integralDefined : Prop

def ExtendedRealFunctionClosed (G : ExtendedRealFunctionPackage) : Prop :=
  G.measurable ∧ G.integrable

theorem extended_real_function_closed_from_evidence
    (G : ExtendedRealFunctionPackage) (E : ExtendedRealFunctionEvidence G) :
    ExtendedRealFunctionClosed G := by
  exact And.intro E.measurableClosed E.integrableClosed

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse