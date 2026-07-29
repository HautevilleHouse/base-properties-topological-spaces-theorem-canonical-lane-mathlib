import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure TopologicalSpacePackage where
  carrier : Type u
  topology : TopologicalSpace carrier
  openSets : Set (Set carrier)
  openSetAxioms : IsTopologicalSpace carrier topology

structure TopologicalSpaceEvidence (P : TopologicalSpacePackage) where
  openSetAxiomsClosed : P.openSetAxioms

def TopologicalSpaceClosed (P : TopologicalSpacePackage) : Prop :=
  P.openSetAxioms

theorem topological_space_closed_from_evidence (P : TopologicalSpacePackage) (E : TopologicalSpaceEvidence P) :
    TopologicalSpaceClosed P := by
  exact E.openSetAxiomsClosed

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse