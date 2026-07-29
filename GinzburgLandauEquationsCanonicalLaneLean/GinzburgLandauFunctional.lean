import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GinzburgLandauFunctionalPackage where
  orderParameter : Type u
  spatialDomain : Type v
  freeEnergyFunctional : Prop
  coherenceLength : ℝ
  penetrationDepth : ℝ
  externalField : ℝ
  couplingConstant : ℝ
  freeEnergyFunctionalClosed : freeEnergyFunctional

structure GinzburgLandauFunctionalEvidence (G : GinzburgLandauFunctionalPackage) where
  freeEnergyFunctionalClosed : G.freeEnergyFunctional
  coherenceLengthPositive : G.coherenceLength > 0
  penetrationDepthPositive : G.penetrationDepth > 0

def GinzburgLandauFunctionalClosed (G : GinzburgLandauFunctionalPackage) : Prop :=
  G.freeEnergyFunctional ∧ G.coherenceLength > 0 ∧ G.penetrationDepth > 0

theorem ginzburg_landau_functional_closed_from_evidence
    (G : GinzburgLandauFunctionalPackage) (E : GinzburgLandauFunctionalEvidence G) :
    GinzburgLandauFunctionalClosed G := by
  exact And.intro E.freeEnergyFunctionalClosed
    (And.intro E.coherenceLengthPositive E.penetrationDepthPositive)

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse