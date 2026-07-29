import HautevilleHouse.BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure FunctionSpacePackage where
  domain : Type u
  codomain : Type v
  domainTopology : TopologicalSpace domain
  codomainTopology : TopologicalSpace codomain
  compactOpen : TopologicalSpace (domain → codomain)
  pointwiseConvergence : TopologicalSpace (domain → codomain)
  ascoliArzela : Prop
  stoneWeierstrass : Prop
  ascoliWitness : ascoliArzela
  stoneWitness : stoneWeierstrass

structure FunctionSpaceEvidence (F : FunctionSpacePackage) where
  ascoliArzela_closed : F.ascoliArzela
  stoneWeierstrass_closed : F.stoneWeierstrass

def FunctionSpaceClosed (F : FunctionSpacePackage) : Prop :=
  F.ascoliArzela ∧ F.stoneWeierstrass

theorem function_space_closed_from_evidence (F : FunctionSpacePackage) (E : FunctionSpaceEvidence F) :
    FunctionSpaceClosed F := by
  exact And.intro E.ascoliArzela_closed E.stoneWeierstrass_closed

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse