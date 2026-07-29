import GinzburgLandauEquationsCanonicalLaneLean.GinzburgLandauAdmissibleClass

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

def bridgeClosed (A : GinzburgLandauAdmittedObject) : Prop :=
  GinzburgLandauWitnessClosed A

theorem bridge_from_ginzburg_landau_class (A : GinzburgLandauAdmittedObject) : bridgeClosed A :=
  A.conclusion

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse