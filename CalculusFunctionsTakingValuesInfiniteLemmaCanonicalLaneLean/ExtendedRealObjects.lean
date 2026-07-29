import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ExtendedRealFunctionSpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  measure : (Set carrier) → ℝ≥0∞

structure ExtendedRealFunctionAdmittedObject where
  space : ExtendedRealFunctionSpace
  measurable : Prop
  function : space.carrier → ℝ≥0∞
  sequence : ℕ → (space.carrier → ℝ≥0∞)
  pointwiseLimit : Prop
  integrableLimit : Prop
  conclusion : pointwiseLimit ∧ integrableLimit

structure ExtendedRealEndgameState where
  object : ExtendedRealFunctionAdmittedObject

def ExtendedRealFunctionWitnessClosed (O : ExtendedRealFunctionAdmittedObject) : Prop :=
  O.conclusion

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse