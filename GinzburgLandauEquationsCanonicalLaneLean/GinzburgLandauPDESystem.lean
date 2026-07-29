import canonicalLaneMathlib.AdmissibleClass

/-!
# Ginzburg-Landau PDE System Package
-/

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GinzburgLandauPDESystemPackage where
  spaceDimension : Nat
  domain : Type u
  orderParameterEquation : Prop
  vectorPotentialEquation : Prop
  boundaryConditions : Prop

structure GinzburgLandauPDESystemEvidence (P : GinzburgLandauPDESystemPackage) where
  orderParameterEquationClosed : P.orderParameterEquation
  vectorPotentialEquationClosed : P.vectorPotentialEquation
  boundaryConditionsClosed : P.boundaryConditions

def GinzburgLandauPDESystemClosed (P : GinzburgLandauPDESystemPackage) : Prop :=
  P.orderParameterEquation ∧ P.vectorPotentialEquation ∧ P.boundaryConditions

theorem ginzburg_landau_pde_system_closed_from_evidence
    (P : GinzburgLandauPDESystemPackage) (E : GinzburgLandauPDESystemEvidence P) :
    GinzburgLandauPDESystemClosed P := by
  exact And.intro E.orderParameterEquationClosed
    (And.intro E.vectorPotentialEquationClosed E.boundaryConditionsClosed)

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse