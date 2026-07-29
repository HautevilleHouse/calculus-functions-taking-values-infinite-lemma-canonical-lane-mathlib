import CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure AdmittedObject where
  functionType : Type
  infiniteValue : Bool
  limit : Prop
  conclusion : limit

structure TheoremStatement where
  object : AdmittedObject
  classicalBoundary : Prop
  constrainedTheorem : Bool
  carriedGap : String

def WitnessClosed (O : AdmittedObject) : Prop :=
  O.limit

def sourceRepository : String :=
  "calculus-functions-taking-values-infinite-lemma-canonical-lane"

def sourceDescription : String :=
  "Calculus Functions Taking Values Infinite Lemma"

def sourceTheoremBoundary : String :=
  "classical boundary: infinite value remainder carried"

def baselineCertificateLane : String :=
  "manifold_constrained"

def baselineCertificateAllPass : Bool :=
  true

def outsideConstantDependencyCount : Nat :=
  0

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse
