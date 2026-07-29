import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GinzburgLandauSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GinzburgLandauAdmittedObject where
  space : GinzburgLandauSpace
  superconductingDomain : Prop
  orderParameterDefined : Prop
  magneticPotentialDefined : Prop
  conclusion : superconductingDomain ∧ orderParameterDefined ∧ magneticPotentialDefined

structure GinzburgLandauEndgameState where
  object : GinzburgLandauAdmittedObject

def GinzburgLandauWitnessClosed (O : GinzburgLandauAdmittedObject) : Prop :=
  O.superconductingDomain ∧ O.orderParameterDefined ∧ O.magneticPotentialDefined

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse