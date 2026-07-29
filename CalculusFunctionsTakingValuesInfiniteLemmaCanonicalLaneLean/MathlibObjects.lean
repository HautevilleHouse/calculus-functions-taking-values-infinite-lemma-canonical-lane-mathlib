import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure InfiniteValuedObject where
  sourceSet : Type u
  targetSet : Type v
  functionDefinition : sourceSet → targetSet
  infiniteValueProperty : Prop
  conclusion : infiniteValueProperty

structure InfiniteValuedState where
  object : InfiniteValuedObject

def InfiniteValuedClosed (O : InfiniteValuedObject) : Prop :=
  O.infiniteValueProperty

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse