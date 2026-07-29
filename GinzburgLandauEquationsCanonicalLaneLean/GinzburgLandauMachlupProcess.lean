import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure FluctuationDissipationPackage where
  thermodynamicLimit : Prop
  noiseTerm : Prop
  correlationFunction : Prop
  relaxationDynamics : Prop

structure FluctuationDissipationEvidence (F : FluctuationDissipationPackage) where
  thermodynamicLimitClosed : F.thermodynamicLimit
  noiseTermClosed : F.noiseTerm
  correlationFunctionClosed : F.correlationFunction
  relaxationDynamicsClosed : F.relaxationDynamics

def FluctuationDissipationClosed (F : FluctuationDissipationPackage) : Prop :=
  F.thermodynamicLimit ∧ F.noiseTerm ∧ F.correlationFunction ∧ F.relaxationDynamics

theorem fluctuation_dissipation_closed_from_evidence (F : FluctuationDissipationPackage) (E : FluctuationDissipationEvidence F) :
    FluctuationDissipationClosed F := by
  exact And.intro E.thermodynamicLimitClosed (And.intro E.noiseTermClosed (And.intro E.correlationFunctionClosed E.relaxationDynamicsClosed))

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse