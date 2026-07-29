import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.ConvergenceTheoremsPackage

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure FatouLemmaEvidenceTerms {G : ExtendedRealFunctionPackage}
    {L : LimitDefinitionsPackage G} {C : ConvergenceTheoremsPackage G L}
    (F : FatouLemmaCertificate C) where
  liminfIntegralBound : F.liminfIntegralBound
  integralLiminfBound : F.integralLiminfBound
  fatouLemmaClosed : ConvergenceTheoremsClosed C

def FatouLemmaCertificate.evidenceTerms {G : ExtendedRealFunctionPackage}
    {L : LimitDefinitionsPackage G} {C : ConvergenceTheoremsPackage G L}
    (F : FatouLemmaCertificate C) : FatouLemmaEvidenceTerms F := {
  liminfIntegralBound := F.liminfIntegralBoundClosed
  integralLiminfBound := F.integralLiminfBoundClosed
  fatouLemmaClosed := convergence_theorems_closed_from_evidence C F.convergenceEvidence
}

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse