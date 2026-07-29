import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean

structure TopologicalAdmittedObject where
  space : Type u
  topology : TopologicalSpace space
  baseProperty : Prop
  conclusion : baseProperty

structure AdmissibleClass where
  object : TopologicalAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.baseProperty) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BasePropertiesTopologicalSpacesTheoremCanonicalLaneLean
end HautevilleHouse