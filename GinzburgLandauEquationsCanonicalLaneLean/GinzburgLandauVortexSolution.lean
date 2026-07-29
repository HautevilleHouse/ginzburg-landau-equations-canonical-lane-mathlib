import canonicalLaneMathlib.AdmissibleClass

/-!
# Ginzburg-Landau Vortex Solution Package
-/

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GinzburgLandauVortexSolutionPackage where
  vortexNumber : ℤ
  asymptoticBehavior : Prop
  energyQuantization : Prop
  stability : Prop

structure GinzburgLandauVortexSolutionEvidence (V : GinzburgLandauVortexSolutionPackage) where
  asymptoticBehaviorClosed : V.asymptoticBehavior
  energyQuantizationClosed : V.energyQuantization
  stabilityClosed : V.stability

def GinzburgLandauVortexSolutionClosed (V : GinzburgLandauVortexSolutionPackage) : Prop :=
  V.asymptoticBehavior ∧ V.energyQuantization ∧ V.stability

theorem ginzburg_landau_vortex_solution_closed_from_evidence
    (V : GinzburgLandauVortexSolutionPackage) (E : GinzburgLandauVortexSolutionEvidence V) :
    GinzburgLandauVortexSolutionClosed V := by
  exact And.intro E.asymptoticBehaviorClosed
    (And.intro E.energyQuantizationClosed E.stabilityClosed)

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse