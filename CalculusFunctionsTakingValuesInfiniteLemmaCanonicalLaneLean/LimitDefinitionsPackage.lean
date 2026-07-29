import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.ExtendedRealFunctionPackage

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure LimitDefinitionsPackage {G : ExtendedRealFunctionPackage} where
  sequence : ℕ → (G.space.carrier → ℝ≥0∞)
  pointwiseLiminf : (G.space.carrier → ℝ≥0∞)
  pointwiseLimsup : (G.space.carrier → ℝ≥0∞)
  liminfMeasurable : Prop
  limsupMeasurable : Prop

def LimitDefinitionsClosed {G : ExtendedRealFunctionPackage} (L : LimitDefinitionsPackage G) : Prop :=
  L.liminfMeasurable ∧ L.limsupMeasurable

theorem limit_definitions_closed_from_evidence
    {G : ExtendedRealFunctionPackage} (L : LimitDefinitionsPackage G)
    (E : L.liminfMeasurable ∧ L.limsupMeasurable) :
    LimitDefinitionsClosed L := by
  exact E

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse