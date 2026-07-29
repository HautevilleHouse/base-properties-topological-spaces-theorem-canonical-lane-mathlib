import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Separation

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure SeparationAxiomsPackage where
  t0 : Prop
  t1 : Prop
  t2 : Prop
  regular : Prop
  normal : Prop

structure SeparationAxiomsEvidence (S : SeparationAxiomsPackage) where
  t0Closed : S.t0
  t1Closed : S.t1
  t2Closed : S.t2
  regularClosed : S.regular
  normalClosed : S.normal

def SeparationAxiomsClosed (S : SeparationAxiomsPackage) : Prop :=
  S.t0 ∧ S.t1 ∧ S.t2 ∧ S.regular ∧ S.normal

theorem separation_axioms_closed_from_evidence (S : SeparationAxiomsPackage)
    (E : SeparationAxiomsEvidence S) : SeparationAxiomsClosed S := by
  exact And.intro E.t0Closed (And.intro E.t1Closed (And.intro E.t2Closed (And.intro E.regularClosed E.normalClosed)))

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse