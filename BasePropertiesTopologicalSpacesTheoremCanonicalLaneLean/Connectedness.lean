import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Connected

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure ConnectednessPackage where
  connected : Prop
  pathConnected : Prop
  locallyConnected : Prop
  arcConnected : Prop
  simplyConnected : Prop

structure ConnectednessEvidence (C : ConnectednessPackage) where
  connectedClosed : C.connected
  pathConnectedClosed : C.pathConnected
  locallyConnectedClosed : C.locallyConnected
  arcConnectedClosed : C.arcConnected
  simplyConnectedClosed : C.simplyConnected

def ConnectednessClosed (C : ConnectednessPackage) : Prop :=
  C.connected ∧ C.pathConnected ∧ C.locallyConnected ∧ C.arcConnected ∧ C.simplyConnected

theorem connectedness_closed_from_evidence (C : ConnectednessPackage)
    (E : ConnectednessEvidence C) : ConnectednessClosed C := by
  exact And.intro E.connectedClosed (And.intro E.pathConnectedClosed (And.intro E.locallyConnectedClosed (And.intro E.arcConnectedClosed E.simplyConnectedClosed)))

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse