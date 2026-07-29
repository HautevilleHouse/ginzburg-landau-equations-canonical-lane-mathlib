import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GinzburgLandauEquationsCanonicalLaneLean

structure FreeEnergyFunctional (κ : Type) where
  domain : Type u
  orderParameter : domain → ℂ
  gradientTerm : Prop
  potentialTerm : Prop
  fieldTerm : Prop
  freeEnergyFormula : Prop

structure FreeEnergyEvidence {κ : Type} (F : FreeEnergyFunctional κ) where
  gradientTermClosed : F.gradientTerm
  potentialTermClosed : F.potentialTerm
  fieldTermClosed : F.fieldTerm
  freeEnergyFormulaClosed : F.freeEnergyFormula

def FreeEnergyClosed {κ : Type} (F : FreeEnergyFunctional κ) : Prop :=
  F.gradientTerm ∧ F.potentialTerm ∧ F.fieldTerm ∧ F.freeEnergyFormula

theorem free_energy_closed_from_evidence {κ : Type} (F : FreeEnergyFunctional κ) (E : FreeEnergyEvidence F) :
    FreeEnergyClosed F := by
  exact And.intro E.gradientTermClosed (And.intro E.potentialTermClosed (And.intro E.fieldTermClosed E.freeEnergyFormulaClosed))

end GinzburgLandauEquationsCanonicalLaneLean
end HautevilleHouse