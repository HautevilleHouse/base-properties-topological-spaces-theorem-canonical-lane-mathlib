import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure CompactnessPackage where
  compact : Prop
  finiteIntersectionProperty : Prop
  heineBorel : Prop
  sequentiallyCompact : Prop

structure CompactnessEvidence (C : CompactnessPackage) where
  compactClosed : C.compact
  finiteIntersectionPropertyClosed : C.finiteIntersectionProperty
  heineBorelClosed : C.heineBorel
  sequentiallyCompactClosed : C.sequentiallyCompact

def CompactnessClosed (C : CompactnessPackage) : Prop :=
  C.compact ∧ C.finiteIntersectionProperty ∧ C.heineBorel ∧ C.sequentiallyCompact

theorem compactness_closed_from_evidence (C : CompactnessPackage) (E : CompactnessEvidence C) :
    CompactnessClosed C := by
  exact And.intro E.compactClosed
    (And.intro E.finiteIntersectionPropertyClosed
      (And.intro E.heineBorelClosed E.sequentiallyCompactClosed))

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse