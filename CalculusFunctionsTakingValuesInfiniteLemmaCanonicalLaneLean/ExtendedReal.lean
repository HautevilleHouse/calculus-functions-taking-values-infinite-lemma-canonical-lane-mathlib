import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean

inductive ExtendedReal where
  | negInf : ExtendedReal
  | finite : ℝ → ExtendedReal
  | posInf : ExtendedReal
deriving Repr, DecidableEq

instance : Coe ℝ ExtendedReal where
  coe x := ExtendedReal.finite x

def ExtendedReal.add (x y : ExtendedReal) : ExtendedReal :=
  match x, y with
  | .posInf, .negInf | .negInf, .posInf => ExtendedReal.finite 0
  | .posInf, _ | _, .posInf => .posInf
  | .negInf, _ | _, .negInf => .negInf
  | .finite a, .finite b => .finite (a + b)

instance : Add ExtendedReal where
  add := ExtendedReal.add

def ExtendedReal.mul (x y : ExtendedReal) : ExtendedReal :=
  match x, y with
  | .finite a, .finite b => .finite (a * b)
  | .posInf, .posInf | .negInf, .negInf => .posInf
  | .posInf, .negInf | .negInf, .posInf => .negInf
  | .posInf, .finite b => if b > 0 then .posInf else if b < 0 then .negInf else .finite 0
  | .negInf, .finite b => if b > 0 then .negInf else if b < 0 then .posInf else .finite 0
  | .finite a, .posInf => if a > 0 then .posInf else if a < 0 then .negInf else .finite 0
  | .finite a, .negInf => if a > 0 then .negInf else if a < 0 then .posInf else .finite 0

instance : Mul ExtendedReal where
  mul := ExtendedReal.mul

def ExtendedReal.le (x y : ExtendedReal) : Prop :=
  match x, y with
  | .negInf, _ => True
  | _, .posInf => True
  | .finite a, .finite b => a ≤ b
  | _, _ => False

instance : LE ExtendedReal where
  le := ExtendedReal.le

theorem extended_real_add_comm (x y : ExtendedReal) : x + y = y + x := by
  cases x <;> cases y <;> simp [ExtendedReal.add]

theorem extended_real_add_assoc (x y z : ExtendedReal) : (x + y) + z = x + (y + z) := by
  cases x <;> cases y <;> cases z <;> 
  simp [ExtendedReal.add, add_assoc]

end CalculusFunctionsTakingValuesInfiniteLemmaCanonicalLaneLean
end HautevilleHouse