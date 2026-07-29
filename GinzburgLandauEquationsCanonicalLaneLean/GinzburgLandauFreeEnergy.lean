import canonicalLaneMathlib.AdmissibleClass

/-!
# Ginzburg–Landau Free Energy Functional
-/

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GinzburgLandauFreeEnergyPackage where
  orderParameter : Type u
  vectorPotential : Type v
  externalPotential : Type w
  freeEnergyFunctional : Type x
  coherenceLength : ℝ
  penetrationDepth : ℝ
  criticalTemperature : ℝ
  normalStateEnergy : ℝ
  superconductingCoupling : ℝ
  gaugeInvariant : Prop
  freeEnergyFunctionalDefined : Prop
  coherenceLengthPositive : coherenceLength > 0
  penetrationDepthPositive : penetrationDepth > 0
  criticalTemperatureDefined : Prop
  normalStateEnergyDefined : Prop

structure GinzburgLandauFreeEnergyEvidence (F : GinzburgLandauFreeEnergyPackage) where
  gaugeInvariantClosed : F.gaugeInvariant
  freeEnergyFunctionalDefinedClosed : F.freeEnergyFunctionalDefined
  criticalTemperatureDefinedClosed : F.criticalTemperatureDefined
  normalStateEnergyDefinedClosed : F.normalStateEnergyDefined

def GinzburgLandauFreeEnergyClosed (F : GinzburgLandauFreeEnergyPackage) : Prop :=
  F.gaugeInvariant ∧
  F.freeEnergyFunctionalDefined ∧
  F.criticalTemperatureDefined ∧
  F.normalStateEnergyDefined

theorem ginzburg_landau_free_energy_closed_from_evidence
    (F : GinzburgLandauFreeEnergyPackage)
    (E : GinzburgLandauFreeEnergyEvidence F) :
    GinzburgLandauFreeEnergyClosed F := by
  exact And.intro E.gaugeInvariantClosed
    (And.intro E.freeEnergyFunctionalDefinedClosed
      (And.intro E.criticalTemperatureDefinedClosed
        E.normalStateEnergyDefinedClosed))

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse