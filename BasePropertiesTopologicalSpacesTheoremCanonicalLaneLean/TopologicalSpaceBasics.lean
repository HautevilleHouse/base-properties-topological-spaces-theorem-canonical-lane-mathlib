import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure TopologicalSpaceAdmittedObject where
  carrier : Type u
  topology : TopologicalSpace carrier
  hausdorff : Prop
  secondCountable : Prop
  conclusion : hausdorff ∧ secondCountable

def TopologicalSpaceWitnessClosed (O : TopologicalSpaceAdmittedObject) : Prop :=
  O.hausdorff ∧ O.secondCountable

structure TopologicalSpacePackage where
  carrier : Type u
  topology : TopologicalSpace carrier
  openSets : Set (Set carrier)
  closedSets : Set (Set carrier)
  interiorDefined : Prop
  closureDefined : Prop

def TopologicalSpacePackageClosed (P : TopologicalSpacePackage) : Prop :=
  P.interiorDefined ∧ P.closureDefined

structure TopologicalSpaceEvidence (P : TopologicalSpacePackage) where
  interiorDefinedClosed : P.interiorDefined
  closureDefinedClosed : P.closureDefined

theorem topological_space_closed_from_evidence (P : TopologicalSpacePackage) (E : TopologicalSpaceEvidence P) :
    TopologicalSpacePackageClosed P := by
  exact And.intro E.interiorDefinedClosed E.closureDefinedClosed

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse