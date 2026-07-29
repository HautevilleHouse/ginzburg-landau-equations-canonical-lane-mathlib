import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure VortexSolutionPackage where
  vortexNumber : ℤ
  phaseWinding : Prop
  magneticFluxQuantization : Prop
  vortexCoreStructure : Prop
  interactionEnergy : Prop

structure VortexEvidence (V : VortexSolutionPackage) where
  phaseWindingClosed : V.phaseWinding
  magneticFluxQuantizationClosed : V.magneticFluxQuantization
  vortexCoreStructureClosed : V.vortexCoreStructure
  interactionEnergyClosed : V.interactionEnergy

def VortexClosed (V : VortexSolutionPackage) : Prop :=
  V.phaseWinding ∧ V.magneticFluxQuantization ∧ V.vortexCoreStructure ∧ V.interactionEnergy

theorem vortex_closed_from_evidence (V : VortexSolutionPackage) (E : VortexEvidence V) : VortexClosed V := by
  exact And.intro E.phaseWindingClosed (And.intro E.magneticFluxQuantizationClosed (And.intro E.vortexCoreStructureClosed E.interactionEnergyClosed))

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse