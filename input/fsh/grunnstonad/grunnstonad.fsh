Instance: grunnstonad
InstanceOf: Questionnaire
Usage: #definition
* url = "http://fhir.nav.no/Questionnaire/grunnstonad"
* title = "Grunnstønad"
* status = #draft
* subjectType = #Patient
* version = "SNAPSHOT"

* item[+]
  * linkId = "patient-group"
  * prefix = "1"
  * type = #group
  * text = "Opplysninger om pasienten"

  * item[+]
    * linkId = "patient-name"
    * prefix = "1.1"
    * type = #text
    * required = true
    * text = "Etternavn, fornavn"

  * item[+]
    * linkId = "patient-fnumber"
    * prefix = "1.2"
    * type = #text
    * text = "Fødselsnummer"

  * item[+]
    * linkId = "patient-age"
    * prefix = "1.3"
    * type = #text
    * required = true
    * text = "Alder"

  * item[+]
    * linkId = "grunnstonad-support-types"
    * prefix = "1.4"
    * text = "Har pasienten grunn av sykdom, skade eller lyte ekstrautgifter til:"
    * type = #choice
    * answerOption[+].valueCoding = #drift-av-tekniske-hjelpemidler "Drift av tekniske hjelpemidler"
    * answerOption[+].valueCoding = #transport "Transport"
    * answerOption[+].valueCoding = #forerhund "Førerhund"
    * answerOption[+].valueCoding = #fordyret-kosthold "Fordyret kosthold"
    * answerOption[+].valueCoding = #servicehund "Servicehund"
    * answerOption[+].valueCoding = #klesslitasje "Klesslitasje"
    * required = true
    * repeats = true

* item[+]
  * linkId = "doctor-group"
  * prefix = "2"
  * type = #group
  * text = "Legens uttalelse"

  * item[+]
    * linkId = "diagnoses"
    * prefix = "2.1"
    * type = #choice
    * text = "Hvilke(n) diagnose(r) har søkeren?"
    * answerValueSet = "http://fhir.nav.no/ValueSet/icd-10-cm"
    * required = true
    * repeats = true
    * item[+]
      * linkId = "diagnoses-annet"
      * type = #text
      * text = "Annen"


  * item[+]
    * linkId = "grunnstonad-duration"
    * prefix = "2.2"
    * type = #boolean
    * text = "(2) Er tilstanden varig (som hovedregel 2-3 år eller mer)?"
    * required = true
  * item[+]
    * linkId = "grunnstonad-duration-variation"
    * prefix = "2.3"
    * text = "Kan det ventes endring på kort eller lengre sikt?"
    * type = #boolean
    * required = true
    * item[+]
      * linkId = "grunnstonad-duration-variation-details"
      * prefix = "2.3.1"
      * enableWhen[+]
        * question = "grunnstonad-duration-variation"
        * operator = #=
        * answerBoolean = true
      * type = #text
      * text = "Når og hvorfor/hvordan?"

  * item[+]
    * linkId = "grunnstonad-assesment"
    * prefix = "2.4"
    * type = #text
    * text = "I hvilken grad bekrefter undersøkelsen(e) søkerens utsagn om egen funksjonsevne og ekstrautgiftene? (1)"
  * item[+]
    * linkId = "grunnstonad-hide-from-patient"
    * prefix = "2.5"
    * type = #boolean
    * text = "Er det noe i legeerklæringen som pasienten ikke bør få vite av medisinske grunner? (6)"
    * item[+]
      * linkId = "grunnstonad-hide-from-patient-details"
      * prefix = "2.5.1"
      * type = #text
      * text = "Oppgi hva pasienten ikke bør få vite:"
      * enableWhen[+]
        * question = "grunnstonad-hide-from-patient"
        * operator = #=
        * answerBoolean = true
  
  * item[+]
    * linkId = "transport-details"
    * prefix = "2.6"
    * type = #choice
    * text = "Transport - vennligst velg mest relevant skjema:"
    * req
    * enableWhen[+]
      * question = "grunnstonad-support-types"
      * operator = #=
      * answerCoding = #transport
    * answerOption[+].valueCoding = #transport-general "Transport / Drift av bil"
    * answerOption[+].valueCoding = #transport-psykisk "Transport / Drift av bil - psykisk lidelse"

  * item[+]
    * linkId = "klesslitasje-details"
    * prefix = "2.7"
    * type = #choice
    * text = "Klesslitasje - vennlig velg mest relevant skjema:"
    * enableWhen[+]
      * question = "grunnstonad-support-types"
      * operator = #=
      * answerCoding = #klesslitasje
    * answerOption[+].valueCoding = #klesslitasje-general "Klesslitasje"
    * answerOption[+].valueCoding = #klesslitasje-adhd "Klesslitasje - ADHD diagnose"
    * answerOption[+].valueCoding = #klesslitasje-hudlidelse "Klesslitasje - hudlidelse"

  * item[+]
    * linkId = "fordyret-kosthold-details"
    * prefix = "2.8"
    * type = #choice
    * text = "Fordyret kosthold - vennlig velg mest relevant skjema:"
    * enableWhen[+]
      * question = "grunnstonad-support-types"
      * operator = #=
      * answerCoding = #fordyret-kosthold
    * answerOption[+].valueCoding = #fordyret-kosthold-general "Fordyret kosthold"
    * answerOption[+].valueCoding = #fordyret-kosthold-coliaki "Fordyret kosthold - Cøliaki"
    * answerOption[+].valueCoding = #fordyret-kosthold-hveteallergi "Fordyret kosthold - Hveteallergi"
    * answerOption[+].valueCoding = #fordyret-kosthold-hvete-glutenintoleranse "Fordyret kosthold - Hvete-/glutenintoleranse"
    * answerOption[+].valueCoding = #fordyret-kosthold-cystisk-fibrose "Fordyret kosthold - Cystisk fibrose"
    * answerOption[+].valueCoding = #fordyret-kosthold-medfodte-stoffskiftesykdommer "Fordyret kosthold - Medfødte stoffskiftesykdommer"
    * answerOption[+].valueCoding = #fordyret-kosthold-epilepsi-ketogen "Fordyret kosthold - Epilepsi/ketogen diett"

  
  
  
  * item[+]
    * linkId = "transport-general"
    * prefix = "2.9"
    * type = #group
    * text = "Transport / Drift av bil"
    * enableWhen[+]
      * question = "transport-details"
      * operator = #=
      * answerCoding = #transport-general
    
    * item[+]
      * linkId = "1.1.2.3"
      * prefix = "2.9.1"
      * type = #boolean
      * text = "Bruker er avskåret fra å benytte offentlig transport av medisinske grunner."
      * required = true

    * item[+]
      * linkId = "1.1.2.2"
      * prefix = "2.9.2"
      * type = #choice
      * text = "Brukers forflytningsevne og funksjonsnivå. (4)"
      // TODO Value set? choice options?
      * answerOption[+].valueCoding = #low "Lav"
      * answerOption[+].valueCoding = #high "Høy"
      * required = true
      * repeats = false

    * item[+]
      * linkId = "1.1.2.5"
      * prefix = "2.9.3"
      * type = #boolean
      * required = true
      * text = "Bruker er helt avhengig av drosje/egen bil til transport."
    
    * item[+]
      * linkId = "1.1.2.6"
      * prefix = "2.9.4"
      * type = #text
      * text = "Hvilken behandling får bruker og hvilken effekt behandlingen har."
      * required = true
    
    * item[+]
      * linkId = "1.1.2.7"
      * prefix = "2.9.5"
      * type = #boolean
      * required = true
      * text = "det kan ventes endring i funksjonen? (5)"
      * item[+]
        * linkId = "1.1.2.7-explain"
        * prefix = "2.9.5.1"
        * type = #string
        * text = "redegjør nærmere."
        * enableWhen[+]
          * question = "1.1.2.7"
          * operator = #=
          * answerBoolean = true
    * item[+]
      * linkId = "1.1.2.8"
      * prefix = "2.9.6"
      * type = #quantity
      * required = true
      * text = "Hvor mange år det er forventet at funksjonen og transportbehovet vil vare. (5)"
    * item[+]
      * linkId = "1.1.2.9"
      * prefix = "2.9.7"
      * type = #text
      * text = "Det er noe mer vi bør vite for å vurdere søknaden."

  // END * linkId = "transport-general"




  * item[+]
    * linkId = "transport-psykisk"
    * prefix = "2.10"
    * type = #group
    * text = "Transport / Drift av bil - psykisk lidelse"
    * enableWhen[+]
      * question = "transport-details"
      * operator = #=
      * answerCoding = #transport-psykisk

    * item[+]
      * linkId = "transport-psykisk-1"
      * prefix = "2.10.1"
      * type = #boolean
      * text = "Bruker er avskåret fra å benytte offentlig transport av medisinske grunner."
      * required = true

    * item[+]
      * linkId = "transport-psykisk-2"
      * prefix = "2.10.2"
      * type = #choice
      * text = "Brukers forflytningsevne og funksjonsnivå. (4)"
      // TODO Value set? choice options?
      * answerOption[+].valueCoding = #low "Lav"
      * answerOption[+].valueCoding = #high "Høy"
      * required = true
      * repeats = false

    * item[+]
      * linkId = "transport-psykisk-terapi"
      * prefix = "2.10.3"
      * type = #choice
      * text = "Bruker har gjennomført eksponeringsterapi i  bruk av offentlig transport i regi av spesialist i klinisk psykologi eller psykiater?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"
      
      * item[+]
        * linkId = "transport-psykisk-terapi-ja"
        * prefix = "2.10.3.1"
        * type = #date
        * text = "Oppgi dato av epikrise"
        * enableWhen[+]
          * question = "transport-psykisk-terapi"
          * operator = #=
          * answerCoding = #ja

      * item[+]
        * linkId = "1.1.2.4.1-display"
        * prefix = "2.10.3.2"
        * type = #display
        * text = "(7) Hvis det ikke er gjennomført eksponeringsterapi må en spesialist i klinisk psykologi eller psykiater fraråde dette. Du må sende oss denne dokumentasjonen. Hvis du ikke har denne dokumentasjonen - oppgi navnet på spesialisten eller psykiateren."
        * enableWhen[+]
          * question = "transport-psykisk-terapi"
          * operator = #=
          * answerCoding = #nei
      * item[+]
        * linkId = "1.1.2.4.1.2"
        * prefix = "2.10.3.3"
        * type = #string
        * text = "Oppgi navnet på spesialisten eller psykiateren."
        * enableWhen[+]
          * question = "transport-psykisk-terapi"
          * operator = #=
          * answerCoding = #nei
      * item[+]
        * linkId = "1.1.2.4.1.3"
        * prefix = "2.10.3.4"
        * type = #date
        * text = "Oppgi dato av epikrise"
        * enableWhen[+]
          * question = "transport-psykisk-terapi"
          * operator = #=
          * answerCoding = #nei

    * item[+]
      * linkId = "transport-psykisk-5"
      * prefix = "2.10.4"
      * type = #boolean
      * required = true
      * text = "Bruker er helt avhengig av drosje/egen bil til transport."
    
    * item[+]
      * linkId = "transport-psykisk-6"
      * prefix = "2.10.5"
      * type = #text
      * text = "Hvilken behandling får bruker og hvilken effekt behandlingen har."
      * required = true
    
    * item[+]
      * linkId = "transport-psykisk-7"
      * prefix = "2.10.5"
      * type = #boolean
      * required = true
      * text = "det kan ventes endring i funksjonen? (5)"
      * item[+]
        * linkId = "1.1.2.7-explain"
        * prefix = "2.10.5.1"
        * type = #string
        * text = "redegjør nærmere."
        * enableWhen[+]
          * question = "1.1.2.7"
          * operator = #=
          * answerBoolean = true
    * item[+]
      * linkId = "transport-psykisk-8"
      * prefix = "2.10.6"
      * type = #quantity
      * required = true
      * text = "Hvor mange år det er forventet at funksjonen og transportbehovet vil vare. (5)"
    * item[+]
      * linkId = "1.1.2.9"
      * prefix = "2.10.7"
      * type = #text
      * text = "Det er noe mer vi bør vite for å vurdere søknaden."

  // END * linkId = "transport-psykisk"



  * item[+]
    * linkId = "klesslitasje-general"
    * prefix = "2.11"
    * type = #group
    * text = "Klesslitasje"
    * enableWhen[+]
      * question = "klesslitasje-details"
      * operator = #=
      * answerCoding = #klesslitasje-general

    * item[+]
      * linkId = "klesslitasje-general-1"
      * prefix = "2.11.1"
      * type = #text
      * text = "Hvilke sykdommer bruker har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "klesslitasje-general-2"
      * prefix = "2.11.2"
      * type = #text
      * text = "Spesifikasjon av brukers utfordringer som følge av diagnosen, for eksempel uro, utagering, konsentrasjonsvansker, impulsivitet, hyperaktivitet, søvnvansker, motoriske vansker og lignende."

    * item[+]
      * text = "Hvor alvorlig den medisinske tilstanden er."
      * prefix = "2.11.3"
      * type = #text
      * linkId = "klesslitasje-alvorlighet"

    * item[+]
      * text = "Hvilken behandling bruker får og hvilken effekt Behandlingen har"
      * prefix = "2.11.4"
      * type = #text
      * linkId = "klesslitasje-behandling"

    * item[+]
      * text = "Hvor mange år det er forventet at tilstanden og klesslitasjen vil vare?"
      * prefix = "2.11.5"
      * type = #text
      * linkId = "klesslitasje-general-duration"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * prefix = "2.11.6"
      * type = #boolean
      * linkId = "klesslitasje-general-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * prefix = "2.11.6.1"
        * type = #text
        * linkId = "klesslitasje-endringer-details"
        * enableWhen[+]
          * question = "klesslitasje-general-endringer"
          * operator = #=
          * answerBoolean = true
    
    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * prefix = "2.11.7"
      * type = #text
      * linkId = "klesslitasje-general-extra"




  * item[+]
    * linkId = "klesslitasje-adhd"
    * prefix = "2.11.8"
    * type = #group
    * text = "Klesslitasje - ADHD diagnose"
    * enableWhen[+]
      * question = "klesslitasje-details"
      * operator = #=
      * answerCoding = #klesslitasje-adhd

    * item[+]
      * prefix = "2.11.8.1"
      * linkId = "klesslitasje-adhd-1"
      * type = #boolean
      * text = "Det er en forutsetning at det fremgår av de medisinske opplysningene at personen har en hyperaktiv adferd. Bekrefter du at personen har en hyperaktiv adferd."





  * item[+]
    * linkId = "klesslitasje-hudlidelse"
    * prefix = "2.11.9"
    * type = #group
    * text = "Klesslitasje - hudlidelse"
    * enableWhen[+]
      * question = "klesslitasje-details"
      * operator = #=
      * answerCoding = #klesslitasje-hudlidelse
  
    * item[+]
      * linkId = "klesslitasje-hudlidelse-1"
      * prefix = "2.11.9.1"
      * type = #text
      * text = "Hvilke sykdommer bruker har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "klesslitasje-hudlidelse-karakterisering"
      * prefix = "2.11.9.2"
      * type = #text
      * text = "Hvordan hudlidelsen karakterisere"
    
    * item[+]
      * linkId = "klesslitasje-hudlidelse-hvor"
      * prefix = "2.11.9.3"
      * type = #text
      * text = "Hvor på kroppen den er lokalisert"
    
    * item[+]
      * linkId = "klesslitasje-hudlidelse-behandling"
      * prefix = "2.11.9.4"
      * type = #text
      * text = "Hvordan den behandles"
    
    * item[+]
      * linkId = "klesslitasje-hudlidelse-sesong"
      * prefix = "2.11.9.5"
      * type = #boolean
      * text = "Det er sesongvariasjoner?"

    * item[+]
      * linkId = "klesslitasje-hudlidelse-duration"
      * prefix = "2.11.9.6"
      * type = #text
      * text = "Hvor mange år det er forventet at tilstanden og klesslitasjen vil vare?"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * prefix = "2.11.9.7"
      * type = #boolean
      * linkId = "klesslitasje-hudlidelse-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * prefix = "2.11.9.7.1"
        * type = #text
        * linkId = "klesslitasje-hudlidelse-endringer-details"
        * enableWhen[+]
          * question = "klesslitasje-hudlidelse-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * prefix = "2.11.9.8"
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "klesslitasje-hudlidelse-extra"




  * item[+]
    * linkId = "fordyret-kosthold-general"
    * prefix = "2.11.10"
    * type = #group
    * text = "Fordyret kosthold"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-general

    * item[+]
      * linkId = "fordyret-kosthold-general-sykdom"
      * prefix = "2.11.10.1"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-general-findings"
      * prefix = "2.11.10.2"
      * type = #text
      * text = "Kliniske funn"

    * item[+]
      * linkId = "fordyret-kosthold-general-assesment-diet"
      * prefix = "2.11.10.3"
      * text = "Sykdommen medfører behov for en spesialdiett?"
      * type = #choice
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-diet-effectiveness"
      * prefix = "2.11.10.4"
      * type = #choice
      * text = "Dietten faktisk avhjelper lidelsen?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-diet-costs"
      * prefix = "2.11.10.5"
      * type = #text
      * text = "Hvilke elementer i dietten er dyrere enn et normalt kosthold?"

    * item[+]
      * linkId = "fordyret-kosthold-general-diet-document"
      * prefix = "2.11.10.6"
      * type = #choice
      * text = "Er dietten vitenskapelig dokumentert og alminnelig anerkjent i medisinsk praksis?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-specialist"
      * prefix = "2.11.10.7"
      * type = #choice
      * text = "Er diagnose og diett fastsatt av spesialist med allergologisk kompetanse?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-followup"
      * prefix = "2.11.10.8"
      * type = #choice
      * text = "Bruker følges opp av sykehus / klinisk ernæringsfysiolog?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-findings"
      * prefix = "2.11.10.9"
      * type = #choice
      * text = "Sykdommen medfører behov for en spesialdiett?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * text = "Hvor mange år det er forventet at tilstanden og behovet for diett vil vare?"
      * prefix = "2.11.10.10"
      * type = #text
      * linkId = "fordyret-kosthold-general-duration"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * prefix = "2.11.10.11"
      * type = #boolean
      * linkId = "fordyret-kosthold-general-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * prefix = "2.11.10.11.1"
        * type = #text
        * linkId = "fordyret-kosthold-general-details"
        * enableWhen[+]
          * question = "fordyret-kosthold-general-endringer"
          * operator = #=
          * answerBoolean = true




  * item[+]
    * linkId = "fordyret-kosthold-coliaki"
    * prefix = "2.12"
    * type = #group
    * text = "Fordyret kosthold - Cøliaki"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-coliaki

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-sykdom"
      * prefix = "2.12.1"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-sykehistorie"
      * prefix = "2.12.2"
      * type = #text
      * text = "Sykehistorie"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-findings"
      * prefix = "2.12.3"
      * type = #text
      * text = "Kliniske funn"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-test"
      * prefix = "2.12.4"
      * type = #text
      * text = "Resultater fra blodprøver"
      * item[+]
        * linkId = "fordyret-kosthold-coliaki-test-ref"
        * type = #text
        * text = "Referanseverdi"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-test-vevstyping"
      * prefix = "2.12.5"
      * type = #text
      * text = "Resultater av vevstyping"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-test-biopsi"
      * prefix = "2.12.6"
      * type = #text
      * text = "Biopsiresultater"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-reaction-test"
      * prefix = "2.12.7"
      * type = #choice
      * text = "Har provokasjonsforsøk ble gjort?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-coliaki-reaction-test-type"
        * prefix = "2.12.7.1"
        * type = #choice
        * text = "Er det foretatt åpen eller blind provokasjon?"
        * answerOption[+].valueString = "Åpen"
        * answerOption[+].valueString = "Blind"
        * enableWhen[+]
          * question = "fordyret-kosthold-coliaki-reaction-test"
          * operator = #=
          * answerString = "Ja"
    
    * item[+]
      * linkId = "fordyret-kosthold-coliaki-specialist-question"
      * prefix = "2.12.8"
      * type = #choice
      * text = "Er du spesialisten som har stilt diagnosen?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-coliaki-specialist-name"
        * prefix = "2.12.8.1"
        * type = #text
        * text = "Hvilken spesialist som har stilt diagnosen?"
        * enableWhen[+]
          * question = "fordyret-kosthold-coliaki-specialist-question"
          * operator = #=
          * answerString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-coliaki-specialist-addreess"
        * prefix = "2.12.8.2"
        * type = #text
        * text = "Hvor spesialisten arbeider?"
        * enableWhen[+]
          * question = "fordyret-kosthold-coliaki-specialist-question"
          * operator = #=
          * answerString = "Nei"




  * item[+]
    * linkId = "fordyret-kosthold-hveteallergi"
    * prefix = "2.13"
    * type = #group
    * text = "Fordyret kosthold - Hveteallergi"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-hveteallergi

    * item[+]
      * linkId = "fordyret-kosthold-hveteallergi-sykdom"
      * prefix = "2.13.1"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-hveteallergi-findings"
      * prefix = "2.13.2"
      * type = #text
      * text = "Kliniske funn"

    * item[+]
      * linkId = "fordyret-kosthold-hveteallergi-test"
      * prefix = "2.13.3"
      * type = #text
      * text = "Resultater fra blodprøver"
      * item[+]
        * linkId = "fordyret-kosthold-hveteallergi-test-ref"
        * type = #text
        * text = "Referanseverdi"

    * item[+]
      * linkId = "fordyret-kosthold-hveteallergi-reaction-test"
      * prefix = "2.13.4"
      * type = #choice
      * text = "Har provokasjonsforsøk ble gjort?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-hveteallergi-reaction-test-type"
        * prefix = "2.13.4.1"
        * type = #choice
        * text = "Er det foretatt åpen eller blind provokasjon?"
        * answerOption[+].valueString = "Åpen"
        * answerOption[+].valueString = "Blind"
        * enableWhen[+]
          * question = "fordyret-kosthold-hveteallergi-reaction-test"
          * operator = #=
          * answerString = "Ja"



  * item[+]
    * linkId = "fordyret-kosthold-hvete-glutenintoleranse"
    * prefix = "2.14"
    * type = #group
    * text = "Fordyret kosthold - Hvete-/glutenintoleranse"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-hvete-glutenintoleranse

    * item[+]
      * linkId = "fordyret-kosthold-hvete-glutenintoleranse-sykdom"
      * prefix = "2.14.1"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-hvete-glutenintoleranse-findings"
      * prefix = "2.14.2"
      * type = #text
      * text = "Kliniske funn"

    * item[+]
      * linkId = "fordyret-kosthold-hvete-glutenintoleranse-findings"
      * prefix = "2.14.3"
      * type = #text
      * text = "Provokasjon i regi av spesialist"

    * item[+]
      * linkId = "fordyret-kosthold-hvete-glutenintoleranse-specialist-question"
      * prefix = "2.14.4"
      * type = #choice
      * text = "Er du spesialisten som har stilt diagnosen?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-hvete-glutenintoleranse-specialist-name"
        * prefix = "2.14.4.1"
        * type = #text
        * text = "Hvilken spesialist som har stilt diagnosen?"
        * enableWhen[+]
          * question = "fordyret-kosthold-hvete-glutenintoleranse-specialist-question"
          * operator = #=
          * answerString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-hvete-glutenintoleranse-specialist-addreess"
        * prefix = "2.14.4.2"
        * type = #text
        * text = "Hvor spesialisten arbeider?"
        * enableWhen[+]
          * question = "fordyret-kosthold-hvete-glutenintoleranse-specialist-question"
          * operator = #=
          * answerString = "Nei"




  * item[+]
    * linkId = "fordyret-kosthold-cystisk-fibrose"
    * prefix = "2.15"
    * type = #group
    * text = "Fordyret kosthold - Cystisk fibrose"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-cystisk-fibrose

    * item[+]
      * linkId = "fordyret-kosthold-cystisk-fibrose-sykdom"
      * prefix = "2.15.1"
      * type = #text
      * text = "Opplysninger om sykdommen"

    * item[+]
      * linkId = "fordyret-kosthold-cystisk-fibrose-affiserte-organer"
      * prefix = "2.15.2"
      * type = #text
      * text = "Kan du spesifisere hvilke organer er affiserte?"




  * item[+]
    * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer"
    * prefix = "2.16"
    * type = #group
    * text = "Fordyret kosthold - Medfødte stoffskiftesykdommer"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-medfodte-stoffskiftesykdommer

    * item[+]
      * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer-sykdome"
      * prefix = "2.16.1"
      * type = #text
      * text = "Hvilke sykdommer bruker har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer-diet"
      * prefix = "2.16.2"
      * text = "Bruker går på proteinredusert diett"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer-diet"
      * prefix = "2.16.3"
      * text = "Bruker får ernæring via ernæringssonde"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer-followup"
      * prefix = "2.16.4"
      * text = "Bruker følges opp av sykehus / klinisk ernæringsfysiolog?"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"




  * item[+]
    * linkId = "fordyret-kosthold-epilepsi-ketogen"
    * prefix = "2.17"
    * type = #group
    * text = "Fordyret kosthold - Epilepsi/ketogen diett"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-epilepsi-ketogen

  
    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-sykdom"
      * prefix = "2.17.1"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-sykdom"
      * text = "medikamentell behandling har vært grundig utprøvd uten tilstrekkelig effekt eller at medikamentell behandling ikke kan benyttes på grunn av bivirkninger"
      * type = #text      

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-diet"
      * prefix = "2.17.2"
      * text = "Ketogen diett har gitt betydelig reduksjon av anfallsfrekvens?"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-spesialist"
      * prefix = "2.17.3"
      * text = "Utredning og behandlingsutprøving er gjennomført i spesialsykehus/-avdeling?"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-followup"
      * prefix = "2.17.4"
      * text = "Regelmessig kontroll eller oppfølging skjer ved hjelp av personell med spesialkompetanse?"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-other"
      * prefix = "2.17.5"
      * text = "Andre grunner til at ketogen diett er nødvendig?"
      * type = #text
    
    
