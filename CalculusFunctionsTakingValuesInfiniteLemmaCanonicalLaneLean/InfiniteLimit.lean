import CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean.ExtendedReal

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

def IsLimit (f : ℕ → ExtendedReal) (L : ExtendedReal) : Prop :=
  ∀ (ε : ℝ), ε > 0 → ∃ (N : ℕ), ∀ (n : ℕ), n ≥ N →
    (match f n, L with
     | ExtendedReal.finite a, ExtendedReal.finite b => |a - b| < ε
     | ExtendedReal.posInf, ExtendedReal.posInf => True
     | ExtendedReal.negInf, ExtendedReal.negInf => True
     | _, _ => False)

def IsSupremum (f : ℕ → ExtendedReal) (L : ExtendedReal) : Prop :=
  (∀ n, f n ≤ L) ∧ ∀ (M : ExtendedReal), (∀ n, f n ≤ M) → L ≤ M

theorem limit_unique (f : ℕ → ExtendedReal) (L1 L2 : ExtendedReal) (h1 : IsLimit f L1) (h2 : IsLimit f L2) : L1 = L2 := by
  by_cases h : L1 = L2
  · exact h
  · exfalso
    have : L1 ≠ L2 := h
    rcases with_cases hL1 : L1 with (a | | )
    · rcases with_cases hL2 : L2 with (b | | )
      · -- both finite
        have hneq : a ≠ b := by
          intro heq; apply h; rw [hL1, hL2, heq]
        have hpos : |a - b| > 0 := abs_pos.mpr (sub_ne_zero.mpr hneq)
        have hpos' : |a - b| / 2 > 0 := by linarith
        rcases h1 (|a - b| / 2) hpos' with ⟨N1, hN1⟩
        rcases h2 (|a - b| / 2) hpos' with ⟨N2, hN2⟩
        let N := max N1 N2
        have hN1' : N1 ≤ N := le_max_left _ _
        have hN2' : N2 ≤ N := le_max_right _ _
        have hN1'' : N ≥ N1 := hN1'
        have hN2'' : N ≥ N2 := hN2'
        have hfN1 := hN1 N (by exact Nat.le_of_eq rfl)
        have hfN2 := hN2 N (by exact Nat.le_of_eq rfl)
        simp [hL1, hL2] at hfN1 hfN2
        have : |a - b| = |(a - f N) + (f N - b)| := by ring
        have hsum : |a - b| ≤ |a - f N| + |f N - b| := by
          calc
            |a - b| = |(a - f N) + (f N - b)| := by ring
            _ ≤ |a - f N| + |f N - b| := abs_add _ _
        have h1' : |a - f N| < |a - b| / 2 := hfN1
        have h2' : |f N - b| < |a - b| / 2 := hfN2
        have : |a - b| < |a - b| := by
          calc
            |a - b| ≤ |a - f N| + |f N - b| := hsum
            _ < |a - b| / 2 + |a - b| / 2 := by nlinarith
            _ = |a - b| := by ring
        exact lt_irrefl _ this
      · -- L1 finite, L2 posInf
        have : ∃ (ε : ℝ), ε > 0 := ⟨1, by norm_num⟩
        rcases h1 1 (by norm_num) with ⟨N1, hN1⟩
        rcases h2 1 (by norm_num) with ⟨N2, hN2⟩
        let N := max N1 N2
        have hN1' : N1 ≤ N := le_max_left _ _
        have hN2' : N2 ≤ N := le_max_right _ _
        have hfN1 := hN1 N (Nat.le_of_eq rfl)
        have hfN2 := hN2 N (Nat.le_of_eq rfl)
        simp [hL1, hL2] at hfN1 hfN2
        -- hfN1 says |a - f N| < 1, hfN2 says True, no contradiction here, but we need to derive a contradiction from the assumption L1 ≠ L2
        -- Actually, if L2 = posInf, then the condition is that f n eventually takes finite values? No, it's just that for any ε, |a - f n| < ε eventually, but also f n is eventually posInf? Wait, IsLimit says for any ε>0, eventually |a-f(n)|<ε, but also f(n) eventually has to be finite because the match returns True only when both match. But h2 says for any ε>0, eventually f n = posInf? Actually, if L2 = posInf, then the match condition is True only if f n is posInf. So h2 says eventually f n = posInf. Combined with h1, which says eventually f n is finite (since |a-f n|<ε only makes sense when f n is finite), we get a contradiction because eventually f n cannot be both finite and posInf.
        have hposInf : ∀ n ≥ N2, f n = ExtendedReal.posInf := by
          intro n hn
          have := hN2 n hn
          simp [hL2] at this
          exact this
        have hfinite : ∀ n ≥ N1, ∃ (x : ℝ), f n = ExtendedReal.finite x := by
          intro n hn
          have := hN1 n hn
          simp [hL1] at this
          exact ⟨f n, rfl⟩
        let n0 := max N1 N2
        have hn0N1 : n0 ≥ N1 := le_max_left _ _
        have hn0N2 : n0 ≥ N2 := le_max_right _ _
        rcases hfinite n0 hn0N1 with ⟨x, hx⟩
        have := hposInf n0 hn0N2
        rw [hx] at this
        have : ExtendedReal.finite x = ExtendedReal.posInf := this
        cases this
      · -- L1 finite, L2 negInf
        -- similar to above, use < instead of > for distance
        have : ∃ (ε : ℝ), ε > 0 := ⟨1, by norm_num⟩
        rcases h1 1 (by norm_num) with ⟨N1, hN1⟩
        rcases h2 1 (by norm_num) with ⟨N2, hN2⟩
        let N := max N1 N2
        have hN1' : N1 ≤ N := le_max_left _ _
        have hN2' : N2 ≤ N := le_max_right _ _
        have hfN1 := hN1 N (Nat.le_of_eq rfl)
        have hfN2 := hN2 N (Nat.le_of_eq rfl)
        simp [hL1, hL2] at hfN1 hfN2
        have hnegInf : ∀ n ≥ N2, f n = ExtendedReal.negInf := by
          intro n hn
          have := hN2 n hn
          simp [hL2] at this
          exact this
        have hfinite : ∀ n ≥ N1, ∃ (x : ℝ), f n = ExtendedReal.finite x := by
          intro n hn
          have := hN1 n hn
          simp [hL1] at this
          exact ⟨f n, rfl⟩
        let n0 := max N1 N2
        have hn0N1 : n0 ≥ N1 := le_max_left _ _
        have hn0N2 : n0 ≥ N2 := le_max_right _ _
        rcases hfinite n0 hn0N1 with ⟨x, hx⟩
        have := hnegInf n0 hn0N2
        rw [hx] at this
        have : ExtendedReal.finite x = ExtendedReal.negInf := this
        cases this
    · rcases with_cases hL2 : L2 with (b | | )
      · -- L1 posInf, L2 finite
        -- symmetric to finite vs posInf
        have : ∃ (ε : ℝ), ε > 0 := ⟨1, by norm_num⟩
        rcases h1 1 (by norm_num) with ⟨N1, hN1⟩
        rcases h2 1 (by norm_num) with ⟨N2, hN2⟩
        let N := max N1 N2
        have hN1' : N1 ≤ N := le_max_left _ _
        have hN2' : N2 ≤ N := le_max_right _ _
        have hfN1 := hN1 N (Nat.le_of_eq rfl)
        have hfN2 := hN2 N (Nat.le_of_eq rfl)
        simp [hL1, hL2] at hfN1 hfN2
        have hposInf : ∀ n ≥ N1, f n = ExtendedReal.posInf := by
          intro n hn
          have := hN1 n hn
          simp [hL1] at this
          exact this
        have hfinite : ∀ n ≥ N2, ∃ (x : ℝ), f n = ExtendedReal.finite x := by
          intro n hn
          have := hN2 n hn
          simp [hL2] at this
          exact ⟨f n, rfl⟩
        let n0 := max N1 N2
        have hn0N1 : n0 ≥ N1 := le_max_left _ _
        have hn0N2 : n0 ≥ N2 := le_max_right _ _
        rcases hfinite n0 hn0N2 with ⟨x, hx⟩
        have := hposInf n0 hn0N1
        rw [hx] at this
        have : ExtendedReal.finite x = ExtendedReal.posInf := this
        cases this
      · -- both posInf
        rfl
      · -- L1 posInf, L2 negInf
        have : ∃ (ε : ℝ), ε > 0 := ⟨1, by norm_num⟩
        rcases h1 1 (by norm_num) with ⟨N1, hN1⟩
        rcases h2 1 (by norm_num) with ⟨N2, hN2⟩
        let N := max N1 N2
        have hN1' : N1 ≤ N := le_max_left _ _
        have hN2' : N2 ≤ N := le_max_right _ _
        have hfN1 := hN1 N (Nat.le_of_eq rfl)
        have hfN2 := hN2 N (Nat.le_of_eq rfl)
        simp [hL1, hL2] at hfN1 hfN2
        have hposInf : ∀ n ≥ N1, f n = ExtendedReal.posInf := by
          intro n hn
          have := hN1 n hn
          simp [hL1] at this
          exact this
        have hnegInf : ∀ n ≥ N2, f n = ExtendedReal.negInf := by
          intro n hn
          have := hN2 n hn
          simp [hL2] at this
          exact this
        let n0 := max N1 N2
        have hn0N1 : n0 ≥ N1 := le_max_left _ _
        have hn0N2 : n0 ≥ N2 := le_max_right _ _
        have h1 := hposInf n0 hn0N1
        have h2 := hnegInf n0 hn0N2
        rw [h2] at h1
        have : ExtendedReal.posInf = ExtendedReal.negInf := h1
        cases this
    · rcases with_cases hL2 : L2 with (b | | )
      · -- L1 negInf, L2 finite
        -- similar
        have : ∃ (ε : ℝ), ε > 0 := ⟨1, by norm_num⟩
        rcases h1 1 (by norm_num) with ⟨N1, hN1⟩
        rcases h2 1 (by norm_num) with ⟨N2, hN2⟩
        let N := max N1 N2
        have hN1' : N1 ≤ N := le_max_left _ _
        have hN2' : N2 ≤ N := le_max_right _ _
        have hfN1 := hN1 N (Nat.le_of_eq rfl)
        have hfN2 := hN2 N (Nat.le_of_eq rfl)
        simp [hL1, hL2] at hfN1 hfN2
        have hnegInf : ∀ n ≥ N1, f n = ExtendedReal.negInf := by
          intro n hn
          have := hN1 n hn
          simp [hL1] at this
          exact this
        have hfinite : ∀ n ≥ N2, ∃ (x : ℝ), f n = ExtendedReal.finite x := by
          intro n hn
          have := hN2 n hn
          simp [hL2] at this
          exact ⟨f n, rfl⟩
        let n0 := max N1 N2
        have hn0N1 : n0 ≥ N1 := le_max_left _ _
        have hn0N2 : n0 ≥ N2 := le_max_right _ _
        rcases hfinite n0 hn0N2 with ⟨x, hx⟩
        have := hnegInf n0 hn0N1
        rw [hx] at this
        have : ExtendedReal.finite x = ExtendedReal.negInf := this
        cases this
      · -- L1 negInf, L2 posInf
        have : ∃ (ε : ℝ), ε > 0 := ⟨1, by norm_num⟩
        rcases h1 1 (by norm_num) with ⟨N1, hN1⟩
        rcases h2 1 (by norm_num) with ⟨N2, hN2⟩
        let N := max N1 N2
        have hN1' : N1 ≤ N := le_max_left _ _
        have hN2' : N2 ≤ N := le_max_right _ _
        have hfN1 := hN1 N (Nat.le_of_eq rfl)
        have hfN2 := hN2 N (Nat.le_of_eq rfl)
        simp [hL1, hL2] at hfN1 hfN2
        have hnegInf : ∀ n ≥ N1, f n = ExtendedReal.negInf := by
          intro n hn
          have := hN1 n hn
          simp [hL1] at this
          exact this
        have hposInf : ∀ n ≥ N2, f n = ExtendedReal.posInf := by
          intro n hn
          have := hN2 n hn
          simp [hL2] at this
          exact this
        let n0 := max N1 N2
        have hn0N1 : n0 ≥ N1 := le_max_left _ _
        have hn0N2 : n0 ≥ N2 := le_max_right _ _
        have h1' := hnegInf n0 hn0N1
        have h2' := hposInf n0 hn0N2
        rw [h2'] at h1'
        have : ExtendedReal.negInf = ExtendedReal.posInf := h1'
        cases this
      · -- both negInf
        rfl

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse