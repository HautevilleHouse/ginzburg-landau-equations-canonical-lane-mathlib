import canonicalLaneMathlib.AdmissibleClass

/-!
# Abrikosov Vortex Lattice Package
-/

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GinzburgLandauAbrikosovLatticePackage where
  latticeStructure : Type u
  periodicity : Prop
  freeEnergyMinimizing : Prop
  stabilityNearUpperCriticalField : Prop

structure GinzburgLandauAbrikosovLatticeEvidence (A : GinzburgLandauAbrikosovLatticePackage) where
  periodicityClosed : A.periodicity
  freeEnergyMinimizingClosed : A.freeEnergyMinimizing
  stabilityNearUpperCriticalFieldClosed : A.stabilityNearUpperCriticalField

def GinzburgLandauAbrikosovLatticeClosed (A : GinzburgLandauAbrikosovLatticePackage) : Prop :=
  A.periodicity ∧ A.freeEnergyMinimizing ∧ A.stabilityNearUpperCriticalField

theorem ginzburg_landau_abrikosov_lattice_closed_from_evidence
    (A : GinzburgLandauAbrikosovLatticePackage) (E : GinzburgLandauAbrikosovLatticeEvidence A) :
    GinzburgLandauAbrikosovLatticeClosed A := by
  exact And.intro E.periodicityClosed
    (And.intro E.freeEnergyMinimizingClosed E.stabilityNearUpperCriticalFieldClosed)

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse