import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GinzburgLandauEquationsCanonicalLaneLean.GinzburgLandauPDE

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure GaugeInvariancePackage (G : GinzburgLandauFunctionalPackage) where
  gaugeGroup : Type u
  transformationLaw : Prop
  invariantFunctional : Prop
  conservedCurrent : Prop
  gaugeFixingCondition : Prop

structure GaugeInvarianceEvidence {G : GinzburgLandauFunctionalPackage}
    (I : GaugeInvariancePackage G) where
  transformationLawClosed : I.transformationLaw
  invariantFunctionalClosed : I.invariantFunctional
  conservedCurrentClosed : I.conservedCurrent
  gaugeFixingConditionClosed : I.gaugeFixingCondition

def GaugeInvarianceClosed {G : GinzburgLandauFunctionalPackage}
    (I : GaugeInvariancePackage G) : Prop :=
  I.transformationLaw ∧ I.invariantFunctional ∧ I.conservedCurrent ∧ I.gaugeFixingCondition

theorem gauge_invariance_closed_from_evidence
    {G : GinzburgLandauFunctionalPackage} (I : GaugeInvariancePackage G)
    (E : GaugeInvarianceEvidence I) : GaugeInvarianceClosed I := by
  exact And.intro E.transformationLawClosed
    (And.intro E.invariantFunctionalClosed
      (And.intro E.conservedCurrentClosed E.gaugeFixingConditionClosed))

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse