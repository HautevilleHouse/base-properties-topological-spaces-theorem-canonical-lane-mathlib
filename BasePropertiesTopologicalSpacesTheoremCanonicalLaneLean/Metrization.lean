import HautevilleHouse.BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure MetrizationPackage where
  space : Type u
  topology : TopologicalSpace space
  isMetrizable : Prop
  urysohnLemma : Prop
  nagataSmirnov : Prop
  bingMetrization : Prop
  metrizableWitness : isMetrizable
  urysohnWitness : urysohnLemma
  nagataSmirnovWitness : nagataSmirnov
  bingWitness : bingMetrization

structure MetrizationEvidence (M : MetrizationPackage) where
  isMetrizable_closed : M.isMetrizable
  urysohnLemma_closed : M.urysohnLemma
  nagataSmirnov_closed : M.nagataSmirnov
  bingMetrization_closed : M.bingMetrization

def MetrizationClosed (M : MetrizationPackage) : Prop :=
  M.isMetrizable ∧ M.urysohnLemma ∧ M.nagataSmirnov ∧ M.bingMetrization

theorem metrization_closed_from_evidence (M : MetrizationPackage) (E : MetrizationEvidence M) :
    MetrizationClosed M := by
  exact And.intro E.isMetrizable_closed (And.intro E.urysohnLemma_closed (And.intro E.nagataSmirnov_closed E.bingMetrization_closed))

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse