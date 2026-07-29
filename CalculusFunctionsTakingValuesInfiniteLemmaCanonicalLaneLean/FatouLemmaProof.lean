import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.FatouLemmaEvidenceTerms

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure FatouLemmaCertificate {G : ExtendedRealFunctionPackage}
    {L : LimitDefinitionsPackage G} {C : ConvergenceTheoremsPackage G L} where
  liminfIntegralBound : Prop
  integralLiminfBound : Prop
  liminfIntegralBoundClosed : liminfIntegralBound
  integralLiminfBoundClosed : integralLiminfBound
  convergenceEvidence : ConvergenceTheoremsEvidence C

def FatouLemmaCertificateClosed {G : ExtendedRealFunctionPackage}
    {L : LimitDefinitionsPackage G} {C : ConvergenceTheoremsPackage G L}
    (F : FatouLemmaCertificate C) : Prop :=
  F.liminfIntegralBound ∧ F.integralLiminfBound ∧ ConvergenceTheoremsClosed C

theorem fatou_lemma_certificate_closed
    {G : ExtendedRealFunctionPackage} {L : LimitDefinitionsPackage G}
    {C : ConvergenceTheoremsPackage G L}
    (F : FatouLemmaCertificate C) : FatouLemmaCertificateClosed F := by
  exact And.intro F.liminfIntegralBoundClosed
    (And.intro F.integralLiminfBoundClosed
      (convergence_theorems_closed_from_evidence C F.convergenceEvidence))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse