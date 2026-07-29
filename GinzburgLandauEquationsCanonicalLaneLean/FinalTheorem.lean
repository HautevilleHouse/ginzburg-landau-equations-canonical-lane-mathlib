import GinzburgLandauEquationsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

def ConstrainedGinzburgLandauClosure (A : GinzburgLandauAdmittedObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_ginzburg_landau_endgame (A : GinzburgLandauAdmittedObject) : ConstrainedGinzburgLandauClosure A :=
  And.intro (bridge_from_ginzburg_landau_class A) (gate_from_ginzburg_landau_class A)

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse