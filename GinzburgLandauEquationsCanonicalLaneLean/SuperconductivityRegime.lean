import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure SuperconductivityRegimePackage where
  criticalTemperature : ℝ
  externalField : ℝ
  typeIIBehavior : Prop
  surfaceSuperconductivity : Prop
  vortexLatticeFormation : Prop

structure SuperconductivityRegimeEvidence (S : SuperconductivityRegimePackage) where
  typeIIBehaviorClosed : S.typeIIBehavior
  surfaceSuperconductivityClosed : S.surfaceSuperconductivity
  vortexLatticeFormationClosed : S.vortexLatticeFormation

def SuperconductivityRegimeClosed (S : SuperconductivityRegimePackage) : Prop :=
  S.typeIIBehavior ∧ S.surfaceSuperconductivity ∧ S.vortexLatticeFormation

theorem superconductivity_regime_closed_from_evidence (S : SuperconductivityRegimePackage) (E : SuperconductivityRegimeEvidence S) :
    SuperconductivityRegimeClosed S := by
  exact And.intro E.typeIIBehaviorClosed (And.intro E.surfaceSuperconductivityClosed E.vortexLatticeFormationClosed)

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse