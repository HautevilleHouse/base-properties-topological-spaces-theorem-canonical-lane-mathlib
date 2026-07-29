import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure ConnectednessPackage where
  connected : Prop
  pathConnected : Prop
  intermediateValueProperty : Prop
  componentDecomposition : Prop

structure ConnectednessEvidence (C : ConnectednessPackage) where
  connectedClosed : C.connected
  pathConnectedClosed : C.pathConnected
  intermediateValuePropertyClosed : C.intermediateValueProperty
  componentDecompositionClosed : C.componentDecomposition

def ConnectednessClosed (C : ConnectednessPackage) : Prop :=
  C.connected ∧ C.pathConnected ∧ C.intermediateValueProperty ∧ C.componentDecomposition

theorem connectedness_closed_from_evidence (C : ConnectednessPackage) (E : ConnectednessEvidence C) :
    ConnectednessClosed C := by
  exact And.intro E.connectedClosed
    (And.intro E.pathConnectedClosed
      (And.intro E.intermediateValuePropertyClosed E.componentDecompositionClosed))

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse