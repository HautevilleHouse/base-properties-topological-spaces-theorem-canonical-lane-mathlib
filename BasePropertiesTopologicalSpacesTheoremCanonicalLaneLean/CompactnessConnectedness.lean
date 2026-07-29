import BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean.SeparationAxioms

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure CompactnessPackage where
  isCompact : Prop
  finiteIntersectionProperty : Prop
  compactnessTerm : isCompact
  finiteIntersectionPropertyTerm : finiteIntersectionProperty

structure CompactnessEvidence (C : CompactnessPackage) where
  isCompactClosed : C.isCompact
  finiteIntersectionPropertyClosed : C.finiteIntersectionProperty

def CompactnessClosed (C : CompactnessPackage) : Prop :=
  C.isCompact ∧ C.finiteIntersectionProperty

theorem compactness_closed_from_evidence (C : CompactnessPackage) (E : CompactnessEvidence C) :
    CompactnessClosed C := by
  exact And.intro E.isCompactClosed E.finiteIntersectionPropertyClosed

structure ConnectednessPackage where
  isConnected : Prop
  pathConnected : Prop
  connectedComponent : Prop
  connectedTerm : isConnected
  pathConnectedTerm : pathConnected
  connectedComponentTerm : connectedComponent

structure ConnectednessEvidence (C : ConnectednessPackage) where
  isConnectedClosed : C.isConnected
  pathConnectedClosed : C.pathConnected
  connectedComponentClosed : C.connectedComponent

def ConnectednessClosed (C : ConnectednessPackage) : Prop :=
  C.isConnected ∧ C.pathConnected ∧ C.connectedComponent

theorem connectedness_closed_from_evidence (C : ConnectednessPackage) (E : ConnectednessEvidence C) :
    ConnectednessClosed C := by
  exact And.intro E.isConnectedClosed (And.intro E.pathConnectedClosed E.connectedComponentClosed)

structure TopologicalBasePropertiesPackage (S : SeparationPackage) (C : CompactnessPackage) (Cn : ConnectednessPackage) where
  separationClosed : SeparationClosed S
  compactnessClosed : CompactnessClosed C
  connectednessClosed : ConnectednessClosed Cn

theorem base_properties_package_closed (S : SeparationPackage) (C : CompactnessPackage) (Cn : ConnectednessPackage)
    (Esep : SeparationEvidence S) (Ecomp : CompactnessEvidence C) (Econ : ConnectednessEvidence Cn) :
    TopologicalBasePropertiesPackage S C Cn := by
  exact {
    separationClosed := separation_closed_from_evidence S Esep
    compactnessClosed := compactness_closed_from_evidence C Ecomp
    connectednessClosed := connectedness_closed_from_evidence Cn Econ
  }

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse