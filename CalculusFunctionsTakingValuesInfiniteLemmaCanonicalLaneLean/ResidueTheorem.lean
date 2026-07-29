import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure ResidueTheoremPackage where
  contourPath : Type u
  integrandFunction : Type v
  residueSumFormula : Prop
  poleClassification : Prop
  contourDeformationInvariance : Prop

structure ResidueTheoremEvidence (R : ResidueTheoremPackage) where
  residueSumFormulaClosed : R.residueSumFormula
  poleClassificationClosed : R.poleClassification
  contourDeformationInvarianceClosed : R.contourDeformationInvariance

def ResidueTheoremClosed (R : ResidueTheoremPackage) : Prop :=
  R.residueSumFormula ∧ R.poleClassification ∧ R.contourDeformationInvariance

theorem residue_theorem_closed_from_evidence (R : ResidueTheoremPackage) (E : ResidueTheoremEvidence R) :
    ResidueTheoremClosed R := by
  exact And.intro E.residueSumFormulaClosed
    (And.intro E.poleClassificationClosed E.contourDeformationInvarianceClosed)

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse