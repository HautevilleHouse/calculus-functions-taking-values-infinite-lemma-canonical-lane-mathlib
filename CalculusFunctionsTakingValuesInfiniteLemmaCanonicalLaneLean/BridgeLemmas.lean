import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CalculusWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse