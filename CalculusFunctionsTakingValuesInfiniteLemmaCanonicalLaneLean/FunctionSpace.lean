import HautevilleHouse.CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure ExtendedReal where
  val : Option ℝ
  isInfinite : Prop
  isFinite : Prop
  order : Prop
  arithmetic : Prop

structure CalculusFunction where
  domain : Type u
  codomain : ExtendedReal
  functionDef : domain → ExtendedReal
  continuity : Prop
  differentiability : Prop
  integrability : Prop

structure FunctionSpaceEvidence (F : CalculusFunction) where
  continuityClosed : F.continuity
  differentiabilityClosed : F.differentiability
  integrabilityClosed : F.integrability

def FunctionSpaceClosed (F : CalculusFunction) : Prop :=
  F.continuity ∧ F.differentiability ∧ F.integrability

theorem function_space_closed_from_evidence (F : CalculusFunction)
    (E : FunctionSpaceEvidence F) : FunctionSpaceClosed F := by
  exact And.intro E.continuityClosed (And.intro E.differentiabilityClosed E.integrabilityClosed)

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse
