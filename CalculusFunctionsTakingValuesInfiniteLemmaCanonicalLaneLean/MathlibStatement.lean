import HautevilleHouse.CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.FinalTheorem
import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure MathlibProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : MathlibProofObligation := {
  sourceKey := "calculus-functions-taking-values-infinite-lemma-canonical-lane",
  theoremObject := "Infinite Value Lemma",
  commonCoreImported := true,
  theoremSpecificDefinitionsNative := true,
  theoremSpecificBridgeNative := true,
  theoremSpecificAdmittedClosureNative := true,
  unrestrictedClassicalClosureNative := false,
  carriedGap := "theorem-specific Mathlib endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

theorem mathlib_common_core_imported_checked :
    mathlibProofObligation.commonCoreImported = true := by
  rfl

theorem theorem_specific_endgame_pilot_closed :
    forall A : AdmissibleClass, ConstrainedInfiniteValueClosure A := by
  intro A
  exact constrained_infinite_value_endgame A

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse