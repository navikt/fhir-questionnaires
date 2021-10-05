Instance: NAV-06-03-04
InstanceOf: Questionnaire
Usage: #definition
* url = "http://fhir.nav.no/Questionnaire/grunn-og-hjelpstonad-legeerklaring"
* title = "Grunn-og-hjelpstønad - Legens uttalelse"
* status = #draft
* subjectType = #Patient


* item[0]
  * linkId = "1"
  * prefix = "1"
  * type = #choice
  * answerOption[0].valueCoding = #grunnstonad "Grunnstønad"
  * answerOption[1].valueCoding = #hjelpstonad "Hjelpstønad"
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
  * extension[=].valueCodeableConcept.coding[0] = http://hl7.org/fhir/questionnaire-item-control#drop-down "Drop down"
  * text = "Handler dette om en grunnstønad eller/og hjelpstønad?"
  * required = true
  * repeats = true

* item[1]
  * linkId = "1.1"
  * prefix = "1.1"
  * type = #group
  * enableWhen[0]
    * question = "1"
    * operator = #=
    * answerCoding = #grunnstonad
  * text = "Grunnstønad - opplysninger om ekstrautgifter"
  * item[0]
    * linkId = "1.1-support-types"
    * text = "Har brukeren grunn av sykdom, skade eller lyte ekstrautgifter til:"
    * type = #choice
    * answerOption[0].valueCoding = #drift-av-tekniske-hjelpemidler "Drift av tekniske hjelpemidler"
    * answerOption[1].valueCoding = #transport "Transport"
    * answerOption[2].valueCoding = #forerhund "Førerhund"
    * answerOption[3].valueCoding = #fordyret-kosthold "Fordyret kosthold"
    * answerOption[4].valueCoding = #servicehund "Servicehund"
    * answerOption[5].valueCoding = #klesslitasje "Klesslitasje"
    * required = true
    * repeats = true
  * item[1]
    * linkId = "1.1.1"
    * prefix = "1.1.1"
    * type = #group
    * text = "Drift av tekniske hjelpemidler"
    * enableWhen[0]
      * question = "1.1-support-types"
      * operator = #=
      * answerCoding = #drift-av-tekniske-hjelpemidler
  * item[2]
    * linkId = "1.1.2"
    * prefix = "1.1.2"
    * text = "Transport"
    * type = #group
    * enableWhen[0]
      * question = "1.1-support-types"
      * operator = #=
      * answerCoding = #transport
    * item[0]
      * linkId = "1.1.2.1"
      * type = #choice
      * text = "Hvilke sykdommer bruker har som er aktuelle for denne søknaden?"
      // TODO add code to help interpret questionnaire response
      * answerValueSet = "http://fhir.nav.no/ValueSet/icd10"
      * required = true
      * repeats = true
    * item[1]
      * linkId = "1.1.2.2"
      * type = #choice
      * text = "Brukers forflytningsevne og funksjonsnivå."
      // TODO Value set? choice options?
      * answerOption[0].valueCoding = #low "Lav"
      * answerOption[1].valueCoding = #high "Høy"
      * required = true
      * repeats = false

    * item[2]
      * linkId = "1.1.2.3"
      * type = #boolean
      * text = "Handler dette om en psykisk lidelse?"
      * required = true
      * item[0]
        * linkId = "1.1.2.3.1"
        * type = #boolean
        * enableWhen[0]
          * question = "1.1.2.3"
          * operator = #=
          * answerBoolean = true
        * text = "Bruker har gjennomført eksponeringsterapi i  bruk av offentlig transport i regi av spesialist i klinisk psykologi eller psykiater?"
        * extension[0].url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
        * extension[=].valueCodeableConcept.coding[0] = http://hl7.org/fhir/questionnaire-item-control#radio-button "Radio Button"
        * required = true
        * item[0]
          * linkId = "1.1.2.3.1.1"
          * type = #attachment
          * text = "Send oss dokumentasjon."
          * required = true
          * enableWhen[0]
            * question = "1.1.2.3.1"
            * operator = #=
            * answerBoolean = true
        * 
        * item[1]
          * linkId = "1.1.2.3.1.2"
          * type = #string
          * text = "Oppgi navnet på spesialisten eller psykiateren."
          * enableWhen[0]
            * question = "1.1.2.3.1"
            * operator = #=
            * answerBoolean = false
        * item[2]
          * linkId = "1.1.2.3.1.3"
          * type = #attachment
          * 
          * text = "Oppgi navnet på spesialisten eller psykiateren."
          * enableWhen[0]
            * question = "1.1.2.3.1"
            * operator = #=
            * answerBoolean = false

    * item[3]
      * linkId = "1.1.2.4"
      * type = #boolean
      * text = "Bruker er avskåret fra å benytte offentlig transport av medisinske grunner."
      * required = true
    
    * item[4]
      * linkId = "1.1.2.5"
      * type = #boolean
      * required = true
      * text = "Bruker er helt avhengig av drosje/egen bil til transport."

// * item[2]
//   * linkId = "7.3"
//   * prefix = "7.3"
//   * type = #choice
//   * text = " I hvilken grad bekrefter undersøkelsen(e) søkerens utsagn om egen funksjonsevne og ekstrautgiftene?"
//   * required = false
//   * answerOption[0].valueCoding = #high "Høy"
//   * answerOption[1].valueCoding = #low "Lav"

// * item[3]
//   * linkId = "7.4"
//   * prefix = "7.4"
//   * type = #text
//   * text = " Ved søknad om grunnstønad på grunn av fordyret kosthold ved diett, hva er det medisinske behovet for dietten? En begrunnet beskrivelse av behovet."
//   * required = false

// * item[4]
//   * linkId = "7.5"
//   * prefix = "7.5"
// //  * definition = http://fhir.nav.no/fhir/DataElement/gender
//   * type = #choice
//   * text = "Gender?"
//   * required = true

