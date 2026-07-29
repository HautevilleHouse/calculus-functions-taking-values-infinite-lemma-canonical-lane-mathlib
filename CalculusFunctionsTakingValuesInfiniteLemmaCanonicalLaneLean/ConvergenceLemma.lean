import HautevilleHouse.CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.InfiniteLimit

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure ConvergenceLemmaPackage (F : CalculusFunction) (L : InfiniteLimitPackage F) where
  infiniteValueLemma : Prop
  boundednessImplication : Prop
  cauchyCriterion : Prop
  subsequenceConvergence : Prop

structure ConvergenceLemmaEvidence (F : CalculusFunction) (L : InfiniteLimitPackage F)
    (C : ConvergenceLemmaPackage F L) where
  infiniteValueLemmaClosed : C.infiniteValueLemma
  boundednessImplicationClosed : C.boundednessImplication
  cauchyCriterionClosed : C.cauchyCriterion
  subsequenceConvergenceClosed : C.subsequenceConvergence

def ConvergenceLemmaClosed (F : CalculusFunction) (L : InfiniteLimitPackage F)
    (C : ConvergenceLemmaPackage F L) : Prop :=
  C.infiniteValueLemma ∧ C.boundednessImplication ∧ C.cauchyCriterion ∧ C.subsequenceConvergence

theorem convergence_lemma_closed_from_evidence (F : CalculusFunction) (L : InfiniteLimitPackage F)
    (C : ConvergenceLemmaPackage F L) (E : ConvergenceLemmaEvidence F L C) :
    ConvergenceLemmaClosed F L C := by
  exact And.intro E.infiniteValueLemmaClosed (And.intro E.boundednessImplicationClosed
    (And.intro E.cauchyCriterionClosed E.subsequenceConvergenceClosed))

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse
