import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure AsymptoticExpansionPackage where
  dominantTerm : Prop
  errorBound : Prop
  uniformApproximationOnUnboundedSet : Prop
  expansionUniqueness : Prop

structure AsymptoticExpansionEvidence (A : AsymptoticExpansionPackage) where
  dominantTermClosed : A.dominantTerm
  errorBoundClosed : A.errorBound
  uniformApproximationOnUnboundedSetClosed : A.uniformApproximationOnUnboundedSet
  expansionUniquenessClosed : A.expansionUniqueness

def AsymptoticExpansionClosed (A : AsymptoticExpansionPackage) : Prop :=
  A.dominantTerm ∧ A.errorBound ∧ A.uniformApproximationOnUnboundedSet ∧ A.expansionUniqueness

theorem asymptotic_expansion_closed_from_evidence (A : AsymptoticExpansionPackage)
    (E : AsymptoticExpansionEvidence A) : AsymptoticExpansionClosed A := by
  exact And.intro E.dominantTermClosed (And.intro E.errorBoundClosed
    (And.intro E.uniformApproximationOnUnboundedSetClosed E.expansionUniquenessClosed))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse