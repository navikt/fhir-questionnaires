Instance: grunnstonad
InstanceOf: Questionnaire
Usage: #definition
* url = "http://fhir.nav.no/Questionnaire/grunnstonad"
* title = "Grunnstønad"
* status = #draft
* subjectType = #Patient

* item[+]
  * linkId = "patient-group"
  * type = #group
  * text = "Pasients uttalelse"

  * item[+]
    * linkId = "patient-name"
    * type = #text
    * required = true
    * text = "Etternavn, fornavn"

  * item[+]
    * linkId = "patient-fnumber"
    * type = #text
    * text = "Fødselsnummer"

  * item[+]
    * linkId = "patient-age"
    * type = #text
    * required = true
    * text = "Alder"

  * item[+]
    * linkId = "grunnstonad-support-types"
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
  * type = #group
  * text = "Legens uttalelse"

  * item[+]
    * linkId = "diagnoses"
    * type = #open-choice
    * text = "Hvilke(n) diagnose(r) har søkeren?"
    * required = true
    * repeats = true

  * item[+]
    * linkId = "grunnstonad-duration"
    * type = #boolean
    * text = "(2) Er tilstanden varig (som hovedregel 2-3 år eller mer)?"
    * required = true
  * item[+]
    * linkId = "grunnstonad-duration-variation"
    * text = "Kan det ventes endring på kort eller lengre sikt?"
    * type = #boolean
    * required = true
    * item[+]
      * linkId = "grunnstonad-duration-variation-details"
      * enableWhen[+]
        * question = "grunnstonad-duration-variation"
        * operator = #=
        * answerBoolean = true
      * type = #text
      * text = "Når og hvorfor/hvordan?"

  * item[+]
    * linkId = "grunnstonad-assesment"
    * type = #text
    * text = "I hvilken grad bekrefter undersøkelsen(e) søkerens utsagn om egen funksjonsevne og ekstrautgiftene? (1)"
  * item[+]
    * linkId = "grunnstonad-hide-from-patient"
    * type = #boolean
    * text = "Er det noe i legeerklæringen som pasienten ikke bør få vite av medisinske grunner? (6)"
    * item[+]
      * linkId = "grunnstonad-hide-from-patient-details"
      * type = #text
      * text = "Oppgi hva pasienten ikke bør få vite:"
      * enableWhen[+]
        * question = "grunnstonad-hide-from-patient"
        * operator = #=
        * answerBoolean = true
  
  * item[+]
    * linkId = "transport-details"
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
    * type = #group
    * text = "Transport / Drift av bil"
    * enableWhen[+]
      * question = "transport-details"
      * operator = #=
      * answerCoding = #transport-general
    
    * item[+]
      * linkId = "1.1.2.3"
      * type = #boolean
      * text = "Bruker er avskåret fra å benytte offentlig transport av medisinske grunner."
      * required = true

    * item[+]
      * linkId = "1.1.2.2"
      * type = #choice
      * text = "Brukers forflytningsevne og funksjonsnivå. (4)"
      // TODO Value set? choice options?
      * answerOption[+].valueCoding = #low "Lav"
      * answerOption[+].valueCoding = #high "Høy"
      * required = true
      * repeats = false

    * item[+]
      * linkId = "1.1.2.5"
      * type = #boolean
      * required = true
      * text = "Bruker er helt avhengig av drosje/egen bil til transport."
    
    * item[+]
      * linkId = "1.1.2.6"
      * type = #text
      * text = "Hvilken behandling får bruker og hvilken effekt behandlingen har."
      * required = true
    
    * item[+]
      * linkId = "1.1.2.7"
      * type = #boolean
      * required = true
      * text = "det kan ventes endring i funksjonen? (5)"
      * item[+]
        * linkId = "1.1.2.7-explain"
        * type = #string
        * text = "redegjør nærmere."
        * enableWhen[+]
          * question = "1.1.2.7"
          * operator = #=
          * answerBoolean = true
    * item[+]
      * linkId = "1.1.2.8"
      * type = #quantity
      * required = true
      * text = "Hvor mange år det er forventet at funksjonen og transportbehovet vil vare. (5)"
    * item[+]
      * linkId = "1.1.2.9"
      * type = #text
      * text = "Det er noe mer vi bør vite for å vurdere søknaden."

  // END * linkId = "transport-general"




  * item[+]
    * linkId = "transport-psykisk"
    * type = #group
    * text = "Transport / Drift av bil - psykisk lidelse"
    * enableWhen[+]
      * question = "transport-details"
      * operator = #=
      * answerCoding = #transport-psykisk

    * item[+]
      * linkId = "transport-psykisk-1"
      * type = #boolean
      * text = "Bruker er avskåret fra å benytte offentlig transport av medisinske grunner."
      * required = true

    * item[+]
      * linkId = "transport-psykisk-2"
      * type = #choice
      * text = "Brukers forflytningsevne og funksjonsnivå. (4)"
      // TODO Value set? choice options?
      * answerOption[+].valueCoding = #low "Lav"
      * answerOption[+].valueCoding = #high "Høy"
      * required = true
      * repeats = false

    * item[+]
      * linkId = "transport-psykisk-terapi"
      * type = #choice
      * text = "Bruker har gjennomført eksponeringsterapi i  bruk av offentlig transport i regi av spesialist i klinisk psykologi eller psykiater?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"
      
      * item[+]
        * linkId = "transport-psykisk-terapi-ja"
        * type = #date
        * text = "Oppgi dato av epikrise"
        * enableWhen[+]
          * question = "transport-psykisk-terapi"
          * operator = #=
          * answerCoding = #ja

      * item[+]
        * linkId = "1.1.2.4.1-display"
        * type = #display
        * text = "(7) Hvis det ikke er gjennomført eksponeringsterapi må en spesialist i klinisk psykologi eller psykiater fraråde dette. Du må sende oss denne dokumentasjonen. Hvis du ikke har denne dokumentasjonen - oppgi navnet på spesialisten eller psykiateren."
        * enableWhen[+]
          * question = "transport-psykisk-terapi"
          * operator = #=
          * answerCoding = #nei
      * item[+]
        * linkId = "1.1.2.4.1.2"
        * type = #string
        * text = "Oppgi navnet på spesialisten eller psykiateren."
        * enableWhen[+]
          * question = "transport-psykisk-terapi"
          * operator = #=
          * answerCoding = #nei
      * item[+]
        * linkId = "1.1.2.4.1.3"
        * type = #date
        * text = "Oppgi dato av epikrise"
        * enableWhen[+]
          * question = "transport-psykisk-terapi"
          * operator = #=
          * answerCoding = #nei

    * item[+]
      * linkId = "transport-psykisk-5"
      * type = #boolean
      * required = true
      * text = "Bruker er helt avhengig av drosje/egen bil til transport."
    
    * item[+]
      * linkId = "transport-psykisk-6"
      * type = #text
      * text = "Hvilken behandling får bruker og hvilken effekt behandlingen har."
      * required = true
    
    * item[+]
      * linkId = "transport-psykisk-7"
      * type = #boolean
      * required = true
      * text = "det kan ventes endring i funksjonen? (5)"
      * item[+]
        * linkId = "1.1.2.7-explain"
        * type = #string
        * text = "redegjør nærmere."
        * enableWhen[+]
          * question = "1.1.2.7"
          * operator = #=
          * answerBoolean = true
    * item[+]
      * linkId = "transport-psykisk-8"
      * type = #quantity
      * required = true
      * text = "Hvor mange år det er forventet at funksjonen og transportbehovet vil vare. (5)"
    * item[+]
      * linkId = "1.1.2.9"
      * type = #text
      * text = "Det er noe mer vi bør vite for å vurdere søknaden."

  // END * linkId = "transport-psykisk"



  * item[+]
    * linkId = "klesslitasje-general"
    * type = #group
    * text = "Klesslitasje"
    * enableWhen[+]
      * question = "klesslitasje-details"
      * operator = #=
      * answerCoding = #klesslitasje-general

    * item[+]
      * linkId = "klesslitasje-general-1"
      * type = #text
      * text = "Hvilke sykdommer bruker har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "klesslitasje-general-2"
      * type = #text
      * text = "Spesifikasjon av brukers utfordringer som følge av diagnosen, for eksempel uro, utagering, konsentrasjonsvansker, impulsivitet, hyperaktivitet, søvnvansker, motoriske vansker og lignende."

    * item[+]
      * text = "Hvor alvorlig den medisinske tilstanden er."
      * type = #text
      * linkId = "klesslitasje-alvorlighet"

    * item[+]
      * text = "Hvilken behandling bruker får og hvilken effekt Behandlingen har"
      * type = #text
      * linkId = "klesslitasje-behandling"

    * item[+]
      * text = "Hvor mange år det er forventet at tilstanden og klesslitasjen vil vare?"
      * type = #text
      * linkId = "klesslitasje-general-duration"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * type = #boolean
      * linkId = "klesslitasje-general-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * type = #text
        * linkId = "klesslitasje-endringer-details"
        * enableWhen[+]
          * question = "klesslitasje-general-endringer"
          * operator = #=
          * answerBoolean = true
    
    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "klesslitasje-general-extra"




  * item[+]
    * linkId = "klesslitasje-adhd"
    * type = #group
    * text = "Klesslitasje - ADHD diagnose"
    * enableWhen[+]
      * question = "klesslitasje-details"
      * operator = #=
      * answerCoding = #klesslitasje-adhd

    * item[+]
      * linkId = "klesslitasje-adhd-1"
      * type = #boolean
      * text = "Det er en forutsetning at det fremgår av de medisinske opplysningene at personen har en hyperaktiv adferd. Bekrefter du at personen har en hyperaktiv adferd."





  * item[+]
    * linkId = "klesslitasje-hudlidelse"
    * type = #group
    * text = "Klesslitasje - hudlidelse"
    * enableWhen[+]
      * question = "klesslitasje-details"
      * operator = #=
      * answerCoding = #klesslitasje-hudlidelse
  
    * item[+]
      * linkId = "klesslitasje-hudlidelse-1"
      * type = #text
      * text = "Hvilke sykdommer bruker har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "klesslitasje-hudlidelse-karakterisering"
      * type = #text
      * text = "Hvordan hudlidelsen karakterisere"
    
    * item[+]
      * linkId = "klesslitasje-hudlidelse-hvor"
      * type = #text
      * text = "Hvor på kroppen den er lokalisert"
    
    * item[+]
      * linkId = "klesslitasje-hudlidelse-behandling"
      * type = #text
      * text = "Hvordan den behandles"
    
    * item[+]
      * linkId = "klesslitasje-hudlidelse-sesong"
      * type = #boolean
      * text = "Det er sesongvariasjoner?"

    * item[+]
      * linkId = "klesslitasje-hudlidelse-duration"
      * type = #text
      * text = "Hvor mange år det er forventet at tilstanden og klesslitasjen vil vare?"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * type = #boolean
      * linkId = "klesslitasje-hudlidelse-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * type = #text
        * linkId = "klesslitasje-hudlidelse-endringer-details"
        * enableWhen[+]
          * question = "klesslitasje-hudlidelse-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "klesslitasje-hudlidelse-extra"




  * item[+]
    * linkId = "fordyret-kosthold-general"
    * type = #group
    * text = "Fordyret kosthold"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-general

    * item[+]
      * linkId = "fordyret-kosthold-general-sykdom"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-general-findings"
      * type = #text
      * text = "Kliniske funn"

    * item[+]
      * linkId = "fordyret-kosthold-general-assesment-diet"
      * text = "Sykdommen medfører behov for en spesialdiett?"
      * type = #choice
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-diet-effectiveness"
      * type = #choice
      * text = "Dietten faktisk avhjelper lidelsen?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-diet-costs"
      * type = #text
      * text = "Hvilke elementer i dietten er dyrere enn et normalt kosthold?"

    * item[+]
      * linkId = "fordyret-kosthold-general-diet-document"
      * type = #choice
      * text = "Er dietten vitenskapelig dokumentert og alminnelig anerkjent i medisinsk praksis?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-specialist"
      * type = #choice
      * text = "Er diagnose og diett fastsatt av spesialist med allergologisk kompetanse?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-followup"
      * type = #choice
      * text = "Bruker følges opp av sykehus / klinisk ernæringsfysiolog?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-general-findings"
      * type = #choice
      * text = "Sykdommen medfører behov for en spesialdiett?"
      * answerOption[+].valueCoding = #ja "Ja"
      * answerOption[+].valueCoding = #nei "Nei"

    * item[+]
      * text = "Hvor mange år det er forventet at tilstanden og behovet for diett vil vare?"
      * type = #text
      * linkId = "fordyret-kosthold-general-duration"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * type = #boolean
      * linkId = "fordyret-kosthold-general-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * type = #text
        * linkId = "fordyret-kosthold-general-details"
        * enableWhen[+]
          * question = "fordyret-kosthold-general-endringer"
          * operator = #=
          * answerBoolean = true




  * item[+]
    * linkId = "fordyret-kosthold-coliaki"
    * type = #group
    * text = "Fordyret kosthold - Cøliaki"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-coliaki

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-sykdom"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-sykehistorie"
      * type = #text
      * text = "Sykehistorie"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-findings"
      * type = #text
      * text = "Kliniske funn"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-test"
      * type = #text
      * text = "Resultater fra blodprøver"
      * item[+]
        * linkId = "fordyret-kosthold-coliaki-test-ref"
        * type = #text
        * text = "Referanseverdi"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-test-vevstyping"
      * type = #text
      * text = "Resultater av vevstyping"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-test-biopsi"
      * type = #text
      * text = "Biopsiresultater"

    * item[+]
      * linkId = "fordyret-kosthold-coliaki-reaction-test"
      * type = #choice
      * text = "Har provokasjonsforsøk ble gjort?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-coliaki-reaction-test-type"
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
      * type = #choice
      * text = "Er du spesialisten som har stilt diagnosen?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-coliaki-specialist-name"
        * type = #text
        * text = "Hvilken spesialist som har stilt diagnosen?"
        * enableWhen[+]
          * question = "fordyret-kosthold-coliaki-specialist-question"
          * operator = #=
          * answerString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-coliaki-specialist-addreess"
        * type = #text
        * text = "Hvor spesialisten arbeider?"
        * enableWhen[+]
          * question = "fordyret-kosthold-coliaki-specialist-question"
          * operator = #=
          * answerString = "Nei"




  * item[+]
    * linkId = "fordyret-kosthold-hveteallergi"
    * type = #group
    * text = "Fordyret kosthold - Hveteallergi"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-hveteallergi

    * item[+]
      * linkId = "fordyret-kosthold-hveteallergi-sykdom"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-hveteallergi-findings"
      * type = #text
      * text = "Kliniske funn"

    * item[+]
      * linkId = "fordyret-kosthold-hveteallergi-test"
      * type = #text
      * text = "Resultater fra blodprøver"
      * item[+]
        * linkId = "fordyret-kosthold-hveteallergi-test-ref"
        * type = #text
        * text = "Referanseverdi"

    * item[+]
      * linkId = "fordyret-kosthold-hveteallergi-reaction-test"
      * type = #choice
      * text = "Har provokasjonsforsøk ble gjort?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-hveteallergi-reaction-test-type"
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
    * type = #group
    * text = "Fordyret kosthold - Hvete-/glutenintoleranse"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-hvete-glutenintoleranse

    * item[+]
      * linkId = "fordyret-kosthold-hvete-glutenintoleranse-sykdom"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-hvete-glutenintoleranse-findings"
      * type = #text
      * text = "Kliniske funn"

    * item[+]
      * linkId = "fordyret-kosthold-hvete-glutenintoleranse-findings"
      * type = #text
      * text = "Provokasjon i regi av spesialist"

    * item[+]
      * linkId = "fordyret-kosthold-hvete-glutenintoleranse-specialist-question"
      * type = #choice
      * text = "Er du spesialisten som har stilt diagnosen?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-hvete-glutenintoleranse-specialist-name"
        * type = #text
        * text = "Hvilken spesialist som har stilt diagnosen?"
        * enableWhen[+]
          * question = "fordyret-kosthold-hvete-glutenintoleranse-specialist-question"
          * operator = #=
          * answerString = "Nei"
      * item[+]
        * linkId = "fordyret-kosthold-hvete-glutenintoleranse-specialist-addreess"
        * type = #text
        * text = "Hvor spesialisten arbeider?"
        * enableWhen[+]
          * question = "fordyret-kosthold-hvete-glutenintoleranse-specialist-question"
          * operator = #=
          * answerString = "Nei"




  * item[+]
    * linkId = "fordyret-kosthold-cystisk-fibrose"
    * type = #group
    * text = "Fordyret kosthold - Cystisk fibrose"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-cystisk-fibrose

    * item[+]
      * linkId = "fordyret-kosthold-cystisk-fibrose-sykdom"
      * type = #text
      * text = "Opplysninger om sykdommen"

    * item[+]
      * linkId = "fordyret-kosthold-cystisk-fibrose-affiserte-organer"
      * type = #text
      * text = "Kan du spesifisere hvilke organer er affiserte?"




  * item[+]
    * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer"
    * type = #group
    * text = "Fordyret kosthold - Medfødte stoffskiftesykdommer"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-medfodte-stoffskiftesykdommer

    * item[+]
      * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer-sykdome"
      * type = #text
      * text = "Hvilke sykdommer bruker har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer-diet"
      * text = "Bruker går på proteinredusert diett"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer-diet"
      * text = "Bruker får ernæring via ernæringssonde"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer-followup"
      * text = "Bruker følges opp av sykehus / klinisk ernæringsfysiolog?"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"




  * item[+]
    * linkId = "fordyret-kosthold-epilepsi-ketogen"
    * type = #group
    * text = "Fordyret kosthold - Epilepsi/ketogen diett"
    * enableWhen[+]
      * question = "fordyret-kosthold-details"
      * operator = #=
      * answerCoding = #fordyret-kosthold-epilepsi-ketogen

  
    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-sykdom"
      * type = #text
      * text = "Påvist sykdom"

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-sykdom"
      * text = "medikamentell behandling har vært grundig utprøvd uten tilstrekkelig effekt eller at medikamentell behandling ikke kan benyttes på grunn av bivirkninger"
      * type = #text      

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-diet"
      * text = "Ketogen diett har gitt betydelig reduksjon av anfallsfrekvens?"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-spesialist"
      * text = "Utredning og behandlingsutprøving er gjennomført i spesialsykehus/-avdeling?"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-followup"
      * text = "Regelmessig kontroll eller oppfølging skjer ved hjelp av personell med spesialkompetanse?"
      * type = #choice
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "fordyret-kosthold-epilepsi-ketogen-other"
      * text = "Andre grunner til at ketogen diett er nødvendig?"
      * type = #text
    
    
