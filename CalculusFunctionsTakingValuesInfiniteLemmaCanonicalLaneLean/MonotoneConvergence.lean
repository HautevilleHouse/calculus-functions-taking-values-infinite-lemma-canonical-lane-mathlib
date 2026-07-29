import CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.ExtendedReal
import CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.InfiniteLimit

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

theorem monotone_convergence (f : ℕ → ExtendedReal) (hmono : ∀ n, f n ≤ f (n+1)) :
    IsSupremum f (limsup f) := by
  have h1 : ∀ n, f n ≤ limsup f := by
    intro n
    apply le_limsup f hmono n
  have h2 : ∀ (x : ExtendedReal), (∀ n, f n ≤ x) → limsup f ≤ x := by
    intro x hx
    apply limsup_le_of_forall_le f hx
  exact And.intro h1 h2

def limsup (f : ℕ → ExtendedReal) : ExtendedReal :=
  -- definition omitted
  ExtendedReal.finite 0

theorem monotone_convergence_tends_to_sup (f : ℕ → ExtendedReal) (hmono : ∀ n, f n ≤ f (n+1)) :
    IsLimit f (limsup f) := by
  have hsup : IsSupremum f (limsup f) := monotone_convergence f hmono
  rcases hsup with ⟨hle, hsup'⟩
  have : IsSupremum f (limsup f) := hsup
  apply isLimit_of_isSupremum f (limsup f) ?_
  · exact hmono
  · exact hsup

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse