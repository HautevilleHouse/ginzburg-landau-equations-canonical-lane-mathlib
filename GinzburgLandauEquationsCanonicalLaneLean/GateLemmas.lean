import GinzburgLandauEquationsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

def gateClosed (A : GinzburgLandauAdmittedObject) : Prop :=
  A.superconductingDomain ∨ A.orderParameterDefined ∨ A.magneticPotentialDefined

theorem gate_from_ginzburg_landau_class (A : GinzburgLandauAdmittedObject) : gateClosed A :=
  Or.inl (by
    have : A.superconductingDomain := And.left A.conclusion
    exact this)

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse