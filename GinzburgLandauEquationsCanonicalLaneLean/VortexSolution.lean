import GinzburgLandauEquationsCanonicalLaneLean.GinzburgLandauPDE

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure VortexSolution {Fe : GinzburgLandauFreeEnergyFunctional} (P : GinzburgLandauPDEPackage Fe) where
  vortexPoints : Set (P.domain)
  windingNumber : ℤ
  asymptoticBehavior : ∀ (x : P.domain), x ∉ vortexPoints → |P.orderParameterEquation x| = 1

structure VortexEvidence {Fe : GinzburgLandauFreeEnergyFunctional} {P : GinzburgLandauPDEPackage Fe} (V : VortexSolution P) where
  windingNumberFinite : V.windingNumber ≠ 0
  conditionAtVortex : ∀ (x : V.vortexPoints), P.orderParameterEquation x = 0
  asymptoticBehaviorHolds : V.asymptoticBehavior

def VortexSolutionClosed {Fe : GinzburgLandauFreeEnergyFunctional} {P : GinzburgLandauPDEPackage Fe} (V : VortexSolution P) : Prop :=
  V.windingNumber ≠ 0 ∧ (∀ x : V.vortexPoints, P.orderParameterEquation x = 0) ∧ V.asymptoticBehavior

theorem vortex_solution_closed_from_evidence {Fe : GinzburgLandauFreeEnergyFunctional} {P : GinzburgLandauPDEPackage Fe} (V : VortexSolution P) (E : VortexEvidence V) : VortexSolutionClosed V :=
  And.intro E.windingNumberFinite (And.intro E.conditionAtVortex E.asymptoticBehaviorHolds)

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse