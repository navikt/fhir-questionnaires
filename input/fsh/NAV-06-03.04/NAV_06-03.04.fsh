Instance: NAV-06-03.04
InstanceOf: Questionnaire
Usage: #example
* url = "https://fhir.nav.no/Questionnaire/NAV-06-03.04"
* title = "Søknad om grunnstønad - 7 Legens uttalelse"
* status = #draft
* subjectType = #Patient

* item[0]
  * linkId = "7.1"
  * prefix = "7.1"
  * code = http://fhir-terminology.nav.no/questions#diagnosis // TODO: Skal vi referere spørsmål til en codeverkt
  * type = #choice // should this allow other codes?
  * answerValueSet = "http://fhir.nav.no/ValueSet/icd10-vs-nr2"
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
  * extension[=].valueCodeableConcept.coding[0] = http://hl7.org/fhir/questionnaire-item-control#drop-down "Drop down"
  * text = "Hvilke(n) diagnose(r) har søkeren? Medisinsk begrunnet (dokumentert av f.eks. spesialist eller sykehus) beskrivelse/vurdering av søkerens helsetilstand."
  * required = true
  * repeats = true

* item[1]
  * linkId = "7.2"
  * prefix = "7.2"
  * type = #boolean
  * text = "Er tilstanden varig (som hovedregel 2-3 år eller mer), eller kan det ventes endring på kort eller lengre sikt (i tilfelle når og hvorfor/hvordan)?"
  * required = true

* item[2]
  * linkId = "7.3"
  * prefix = "7.3"
  * type = #choice
  * text = " I hvilken grad bekrefter undersøkelsen(e) søkerens utsagn om egen funksjonsevne og ekstrautgiftene?"
  * required = false
  * answerOption[0].valueCoding = #high "Høy"
  * answerOption[1].valueCoding = #low "Lav"

* item[3]
  * linkId = "7.4"
  * prefix = "7.4"
  * type = #text
  * text = " Ved søknad om grunnstønad på grunn av fordyret kosthold ved diett, hva er det medisinske behovet for dietten? En begrunnet beskrivelse av behovet."
  * required = false

* item[4]
  * linkId = "7.5"
  * prefix = "7.5"
//  * definition = http://fhir.nav.no/fhir/DataElement/gender
  * type = #choice
  * text = "Gender?"
  * required = true