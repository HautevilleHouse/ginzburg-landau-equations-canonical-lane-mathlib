import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GinzburgLandauAdmittedObject where
  complexField : Type u
  spaceDimension : ℕ
  temperature : ℝ
  waveFunction : complexField
  vectorPotential : complexField
  freeEnergyFunctional : Prop
  criticalPoints : Prop

structure AdmissibleClass where
  object : GinzburgLandauAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GinzburgLandauWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse
