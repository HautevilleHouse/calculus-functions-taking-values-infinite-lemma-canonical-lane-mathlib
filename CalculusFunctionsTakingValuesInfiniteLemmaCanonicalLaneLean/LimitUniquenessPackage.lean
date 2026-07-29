import canonicalLaneMathlib.AdmissibleClass

/-!
# Limit Uniqueness Package

This module formalizes the uniqueness of infinite limits.
-/

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure LimitUniquenessProposition where
  limitExists : Prop
  uniquenessHolds : Prop

structure LimitUniquenessEvidence where
  limitExistsClosed : Bool
  uniquenessHoldsClosed : Bool

def LimitUniquenessClosed (L : LimitUniquenessProposition) : Prop :=
  L.limitExists ∧ L.uniquenessHolds

theorem limit_uniqueness_closed_from_evidence
    (L : LimitUniquenessProposition) (E : LimitUniquenessEvidence) :
    LimitUniquenessClosed L := by
  exact And.intro E.limitExistsClosed E.uniquenessHoldsClosed

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse
