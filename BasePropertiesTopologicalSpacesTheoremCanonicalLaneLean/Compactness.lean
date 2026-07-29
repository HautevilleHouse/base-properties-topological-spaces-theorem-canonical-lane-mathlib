import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Compactness

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure CompactnessPackage where
  compact : Prop
  sequentiallyCompact : Prop
  locallyCompact : Prop
  sigmaCompact : Prop
  paracompact : Prop

structure CompactnessEvidence (C : CompactnessPackage) where
  compactClosed : C.compact
  sequentiallyCompactClosed : C.sequentiallyCompact
  locallyCompactClosed : C.locallyCompact
  sigmaCompactClosed : C.sigmaCompact
  paracompactClosed : C.paracompact

def CompactnessClosed (C : CompactnessPackage) : Prop :=
  C.compact ∧ C.sequentiallyCompact ∧ C.locallyCompact ∧ C.sigmaCompact ∧ C.paracompact

theorem compactness_closed_from_evidence (C : CompactnessPackage)
    (E : CompactnessEvidence C) : CompactnessClosed C := by
  exact And.intro E.compactClosed (And.intro E.sequentiallyCompactClosed (And.intro E.locallyCompactClosed (And.intro E.sigmaCompactClosed E.paracompactClosed)))

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse