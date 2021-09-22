Instance: NAV-06-03.04
InstanceOf: Questionnaire
Usage: #example
* url = "http://hl7.org/fhir/Questionnaire/3141" // TODO: hvilken url skal vi ha her?
* title = "Søknad om grunnstønad - 7 Legens uttalelse"
* status = #draft
* subjectType = #Patient

* item[0].linkId = "7.1"
* item[0].prefix = "7.1"
* item[0].code = http://fhir-terminology.nav.no/questions#diagnosis // TODO: Skal vi referere spørsmål til en codeverkt
* item[0].type = #choice // should this allow other codes?
* item[0].answerValueSet = "http://hl7.org/fhir/ValueSet/icd-10"
* item[0].text = "Hvilke(n) diagnose(r) har søkeren? Medisinsk begrunnet (dokumentert av f.eks. spesialist eller sykehus) beskrivelse/vurdering av søkerens
helsetilstand."
* item[0].required = true
* item[0].repeats = true

* item[1].linkId = "7.2"
* item[=].prefix = "7.2"
* item[=].type = #boolean
* item[=].text = "Er tilstanden varig (som hovedregel 2-3 år eller mer), eller kan det ventes endring på kort eller lengre sikt (i tilfelle når og hvorfor/hvordan)?"
* item[=].required = true

* item[2].linkId = "7.3"
* item[=].prefix = "7.3"
* item[=].type = #choice
* item[=].text = " I hvilken grad bekrefter undersøkelsen(e) søkerens utsagn om egen funksjonsevne og ekstrautgiftene?"
* item[=].required = false
* item[=].answerOption[0].valueCoding = #high "Høy"
* item[=].answerOption[1].valueCoding = #low "Lav"

* item[3].linkId = "7.4"
* item[=].prefix = "7.4"
* item[=].type = #text
* item[=].text = " Ved søknad om grunnstønad på grunn av fordyret kosthold ved diett, hva er det medisinske behovet for dietten? En begrunnet beskrivelse av
 behovet."
* item[=].required = false