import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GinzburgLandauEquationsCanonicalLaneLean.GinzburgLandauFreeEnergy

/-!
# Ginzburg–Landau PDE System
-/

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GinzburgLandauPDEPackage {F : GinzburgLandauFreeEnergyPackage}
  (E : GinzburgLandauFreeEnergyEvidence F) where
  firstEquation : Prop
  secondEquation : Prop
  boundaryConditions : Prop
  regularity : Prop
  gaugeFixed : Prop
  firstEquationHolds : firstEquation
  secondEquationHolds : secondEquation
  boundaryConditionsSatisfied : boundaryConditions
  regularityAssumed : regularity
  gaugeFixedChoice : gaugeFixed

structure GinzburgLandauPDEEvidence {F : GinzburgLandauFreeEnergyPackage}
  {E : GinzburgLandauFreeEnergyEvidence F}
  (P : GinzburgLandauPDEPackage E) where
  firstEquationHoldsClosed : P.firstEquationHolds
  secondEquationHoldsClosed : P.secondEquationHolds
  boundaryConditionsSatisfiedClosed : P.boundaryConditionsSatisfied
  regularityAssumedClosed : P.regularityAssumed
  gaugeFixedChoiceClosed : P.gaugeFixedChoice

def GinzburgLandauPDEClosed {F : GinzburgLandauFreeEnergyPackage}
  {E : GinzburgLandauFreeEnergyEvidence F}
  (P : GinzburgLandauPDEPackage E) : Prop :=
  P.firstEquationHolds ∧
  P.secondEquationHolds ∧
  P.boundaryConditionsSatisfied ∧
  P.regularityAssumed ∧
  P.gaugeFixedChoice

theorem ginzburg_landau_pde_closed_from_evidence
    {F : GinzburgLandauFreeEnergyPackage}
    {E : GinzburgLandauFreeEnergyEvidence F}
    (P : GinzburgLandauPDEPackage E)
    (Ev : GinzburgLandauPDEEvidence P) :
    GinzburgLandauPDEClosed P := by
  exact And.intro Ev.firstEquationHoldsClosed
    (And.intro Ev.secondEquationHoldsClosed
      (And.intro Ev.boundaryConditionsSatisfiedClosed
        (And.intro Ev.regularityAssumedClosed
          Ev.gaugeFixedChoiceClosed)))

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse