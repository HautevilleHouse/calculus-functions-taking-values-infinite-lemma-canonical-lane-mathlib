import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.LimitDefinitionsPackage

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure ConvergenceTheoremsPackage {G : ExtendedRealFunctionPackage}
    {L : LimitDefinitionsPackage G} where
  monotoneConvergence : Prop
  dominatedConvergence : Prop
  fatouLemma : Prop

structure ConvergenceTheoremsEvidence {G : ExtendedRealFunctionPackage}
    {L : LimitDefinitionsPackage G} (C : ConvergenceTheoremsPackage G L) where
  monotoneConvergenceClosed : C.monotoneConvergence
  dominatedConvergenceClosed : C.dominatedConvergence
  fatouLemmaClosed : C.fatouLemma

def ConvergenceTheoremsClosed {G : ExtendedRealFunctionPackage}
    {L : LimitDefinitionsPackage G} (C : ConvergenceTheoremsPackage G L) : Prop :=
  C.monotoneConvergence ∧ C.dominatedConvergence ∧ C.fatouLemma

theorem convergence_theorems_closed_from_evidence
    {G : ExtendedRealFunctionPackage} {L : LimitDefinitionsPackage G}
    (C : ConvergenceTheoremsPackage G L) (E : ConvergenceTheoremsEvidence C) :
    ConvergenceTheoremsClosed C := by
  exact And.intro E.monotoneConvergenceClosed
    (And.intro E.dominatedConvergenceClosed E.fatouLemmaClosed)

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse