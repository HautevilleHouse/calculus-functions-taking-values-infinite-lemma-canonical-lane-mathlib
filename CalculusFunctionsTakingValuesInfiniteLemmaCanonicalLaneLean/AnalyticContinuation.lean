import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure AnalyticContinuationPackage where
  initialFunction : Type u
  analyticDomain : Type v
  continuationExists : Prop
  uniquenessUnderMonodromy : Prop
  branchCutClassification : Prop

structure AnalyticContinuationEvidence (A : AnalyticContinuationPackage) where
  continuationExistsClosed : A.continuationExists
  uniquenessUnderMonodromyClosed : A.uniquenessUnderMonodromy
  branchCutClassificationClosed : A.branchCutClassification

def AnalyticContinuationClosed (A : AnalyticContinuationPackage) : Prop :=
  A.continuationExists ∧ A.uniquenessUnderMonodromy ∧ A.branchCutClassification

theorem analytic_continuation_closed_from_evidence (A : AnalyticContinuationPackage) (E : AnalyticContinuationEvidence A) :
    AnalyticContinuationClosed A := by
  exact And.intro E.continuationExistsClosed
    (And.intro E.uniquenessUnderMonodromyClosed E.branchCutClassificationClosed)

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse