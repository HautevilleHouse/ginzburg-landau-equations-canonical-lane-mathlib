import canonicalLaneMathlib.AdmissibleClass

/-!
# Ginzburg-Landau Critical Field Package
-/

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GinzburgLandauCriticalFieldPackage where
  upperCriticalField : ℝ
  lowerCriticalField : ℝ
  thermodynamicCriticalField : ℝ
  nucleationOrder : Prop

structure GinzburgLandauCriticalFieldEvidence (C : GinzburgLandauCriticalFieldPackage) where
  upperCriticalFieldClosed : C.upperCriticalField > 0
  lowerCriticalFieldClosed : C.lowerCriticalField > 0
  thermodynamicCriticalFieldClosed : C.thermodynamicCriticalField > 0
  nucleationOrderClosed : C.nucleationOrder

def GinzburgLandauCriticalFieldClosed (C : GinzburgLandauCriticalFieldPackage) : Prop :=
  C.upperCriticalField > 0 ∧ C.lowerCriticalField > 0 ∧
  C.thermodynamicCriticalField > 0 ∧ C.nucleationOrder

theorem ginzburg_landau_critical_field_closed_from_evidence
    (C : GinzburgLandauCriticalFieldPackage) (E : GinzburgLandauCriticalFieldEvidence C) :
    GinzburgLandauCriticalFieldClosed C := by
  exact And.intro E.upperCriticalFieldClosed
    (And.intro E.lowerCriticalFieldClosed
      (And.intro E.thermodynamicCriticalFieldClosed E.nucleationOrderClosed))

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse