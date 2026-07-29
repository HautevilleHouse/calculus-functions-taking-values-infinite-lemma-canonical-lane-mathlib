import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

structure InfiniteValueSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure InfiniteValueAdmittedObject where
  space : InfiniteValueSpace
  target : Type
  targetTopology : TopologicalSpace target
  functionDefined : Prop
  takesInfiniteValues : Prop
  infiniteValueLemma : Prop
  conclusion : infiniteValueLemma

structure InfiniteValueEndgameState where
  object : InfiniteValueAdmittedObject

def InfiniteValueWitnessClosed (O : InfiniteValueAdmittedObject) : Prop :=
  O.infiniteValueLemma

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse