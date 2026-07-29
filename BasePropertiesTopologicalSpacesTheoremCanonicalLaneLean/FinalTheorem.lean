import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

def ConstrainedTopologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_topology_endgame (A : AdmissibleClass) :
    ConstrainedTopologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse