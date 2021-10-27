Instance: hjelpestonad
InstanceOf: Questionnaire
Usage: #definition
* url = "http://fhir.nav.no/Questionnaire/hjelpestonad"
* title = "Hjelpstønad"
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
    * type = #integer
    * required = true
    * text = "Alder"

  * item[+]
    * linkId = "support-types"
    * text = "Hvilke oppgavene bruker trenger hjelp til:"
    * type = #choice
    * answerOption[+].valueCoding = #av-po-kledning "Av-/på-kledning"
    * answerOption[+].valueCoding = #staa-opp-legge-seg "Stå opp/legge seg"
    * answerOption[+].valueCoding = #personlig-hygiene "Personlig hygiene"
    * answerOption[+].valueCoding = #daglig-tilsyn "Daglig tilsyn"
    * answerOption[+].valueCoding = #nattlig-tilsyn "Nattlig tilsyn"
    * answerOption[+].valueCoding = #spise "Spise"
    * answerOption[+].valueCoding = #annet "Annet"
    * required = true
    * repeats = true
    * item[+]
      * linkId = "support-types-other"
      * text = "Hvis annet, spesifiere"
      * type = #text

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
    * linkId = "hjelpestonad-duration"
    * type = #boolean
    * text = "Er tilstanden varig (som hovedregel 2-3 år eller mer)?"
    * required = true
  * item[+]
    * linkId = "hjelpestonad-duration-variation"
    * text = "Kan det ventes endring på kort eller lengre sikt?"
    * type = #boolean
    * required = true
    * item[+]
      * linkId = "hjelpestonad-duration-variation-details"
      * enableWhen[+]
        * question = "hjelpestonad-duration-variation"
        * operator = #=
        * answerBoolean = true
      * type = #text
      * text = "Når og hvorfor/hvordan?"

  * item[+]
    * linkId = "hjelpestonad-assesment"
    * type = #text
    * text = "I hvilken grad bekrefter undersøkelsen(e) søkerens utsagn om egen funksjonsevne og behov for ekstra tilsyn/pleie?"
  * item[+]
    * linkId = "hjelpestonad-hide-from-patient"
    * type = #boolean
    * text = "Er det noe i legeerklæringen som pasienten ikke bør få vite av medisinske grunner?"
    * item[+]
      * linkId = "hjelpestonad-hide-from-patient-details"
      * type = #text
      * text = "Oppgi hva pasienten ikke bør få vite:"
      * enableWhen[+]
        * question = "hjelpestonad-hide-from-patient"
        * operator = #=
        * answerBoolean = true


  // * item[+]
  //   * linkId = "hjelpestonad-questionnaire-adult"
  //   * text = "Vennligst velg sjkema som passer best dette søknad"
  //   * type = #choice
  //   * answerOption[+].valueCoding = #general "Generell"
  //   * answerOption[+].valueCoding = #hofteleddsdysplasi "Hofteleddsdysplasi / hofteleddslukasjon / Calvé-Legg-Perthes sykdom"

  //   * enableWhen[+]
  //     * question = "patient-age"
  //     * operator = #>=
  //     * answerInteger = 18
    
  * item[+]
    * linkId = "hjelpestonad-questionnaire-child"
    * text = "Vennligst velg sjkema som passer best dette søknad"
    * type = #choice
    * answerOption[+].valueCoding = #general "Generell"
    * answerOption[+].valueCoding = #hudlidelse "Hudlidelse"
    * answerOption[+].valueCoding = #astma "Astma"
    * answerOption[+].valueCoding = #blodersykdom "Blødersykdom"
    * answerOption[+].valueCoding = #cystisk-fibrose "Cystisk fibrose"
    * answerOption[+].valueCoding = #diabetes "Diabetes"
    * answerOption[+].valueCoding = #dovhet "Døvhet / sterkt tunghørt"
    * answerOption[+].valueCoding = #epilepsi "Epilepsi"
    * answerOption[+].valueCoding = #fenylketonuri "Fenylketonuri (PKU/Føllings) – barn under 16"
    * answerOption[+].valueCoding = #hofteleddsdysplasi "Hofteleddsdysplasi / hofteleddslukasjon / Calvé-Legg-Perthes sykdom"
    * answerOption[+].valueCoding = #kreft "Kreft"

    * enableWhen[+]
      * question = "patient-age"
      * operator = #<
      * answerInteger = 18

  * item[+]
    * linkId = "general-adult"
    * type = #group
    * text = "Generell - voksen"
    * enableWhen[+]
      * question = "patient-age"
      * operator = #>=
      * answerInteger = 18

    * item[+]
      * linkId = "general-adult-sykdomer"
      * type = #text
      * text = "Hvilke sykdommer bruker har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "general-adult-behov"
      * type = #text
      * text = "Beskriv brukers behov for tilsyn og pleie"

    * item[+]
      * linkId = "general-adult-challenges"
      * type = #text
      * text = "Beskriv brukers utfordringer som følge av sykdommen. Dette kan være  uro, utagering, konsentrasjonsvansker, impulsivitet, søvnvansker, motoriske vansker og lignende."

    * item[+]
      * linkId = "general-adult-medicine"
      * type = #choice
      * text = "Bruker er medisinert?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "general-adult-medicine-details"
        * type = #text
        * text = "Hvis ja - ber vi deg redegjøre for effekt / bivirkninger"
        * enableWhen[+]
          * question = "general-adult-medicine"
          * operator = #=
          * answerString = "Ja"

    * item[+]
      * text = "Hvor mange år det er forventet at tilstanden og hjelpebehovet vil vare?"
      * type = #text
      * linkId = "fordyret-kosthold-general-duration"

    * item[+]
      * linkId = "general-adult-endringer"
      * type = #boolean
      * text = "Det kan ventes endring av tilstanden"
      * item[+]
        * text = "Redegjør nærmere"
        * type = #text
        * linkId = "general-adult-details"
        * enableWhen[+]
          * question = "general-adult-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "general-adult-extra"




  * item[+]
    * linkId = "general-child"
    * type = #group
    * text = "Generell - barn"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #general

    * item[+]
      * linkId = "general-child-sykdomer"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "general-child-behov"
      * type = #text
      * text = "Beskriv barnets behov for tilsyn og pleie sammenlignet med andre barn?"

    * item[+]
      * linkId = "general-child-challenges"
      * type = #text
      * text = "Beskriv barnets utfordringer som følge av sykdommen.. Dette kan være uro, utagering, konsentrasjonsvansker, impulsivitet, søvnvansker, motoriske vansker og lignende."

    * item[+]
      * linkId = "general-child-medicine"
      * type = #choice
      * text = "Barnet er medisinert?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "general-child-medicine-details"
        * type = #text
        * text = "Hvis ja - ber vi deg redegjøre for effekt / bivirkninger"
        * enableWhen[+]
          * question = "general-child-medicine"
          * operator = #=
          * answerString = "Ja"      

    * item[+]
      * text = "Hvor mange år det er forventet at tilstanden og hjelpebehovet vil vare?"
      * type = #text
      * linkId = "general-child-duration"

    * item[+]
      * linkId = "general-child-endringer"
      * type = #boolean
      * text = "Det kan ventes endring av tilstanden"
      * item[+]
        * text = "Redegjør nærmere"
        * type = #text
        * linkId = "general-child-details"
        * enableWhen[+]
          * question = "general-child-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "general-child-extra"






  * item[+]
    * linkId = "hudlidelse"
    * type = #group
    * text = "Hudliselse"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #hudlidelse

    * item[+]
      * linkId = "hudlidelse-sykdomer"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "hudlidelse-karakterisering"
      * type = #text
      * text = "Hvordan hudlidelsen karakterisere"

    * item[+]
      * linkId = "hudlidelse-hvor"
      * type = #text
      * text = "Hvor på kroppen den er lokalisert"
    
    * item[+]
      * linkId = "hudlidelse-behandling"
      * type = #text
      * text = "Hvordan den behandles"
    
    * item[+]
      * linkId = "hudlidelse-sesong"
      * type = #boolean
      * text = "Det er sesongvariasjoner?"

    * item[+]
      * linkId = "hudlidelse-hantere-selv"
      * type = #text
      * text = "I hvilken grad barnet kan håndtere hudlidelsen selv?"
      * enableWhen[+]
        * question = "patient-age"
        * operator = #>=
        * answerInteger = 13

    * item[+]
      * linkId = "hudlidelse-duration"
      * type = #text
      * text = "Hvor mange år det er forventet at tilstanden vil vare?"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * type = #boolean
      * linkId = "hudlidelse-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * type = #text
        * linkId = "hudlidelse-endringer-details"
        * enableWhen[+]
          * question = "hudlidelse-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "hudlidelse-extra"






  * item[+]
    * linkId = "astma"
    * type = #group
    * text = "Astma"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #astma

    * item[+]
      * linkId = "astma-sykdomer"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "astma-grad"
      * type = #choice
      * text = "Astmaen er å anse som:"
      * answerOption[+].valueString = "Mild"
      * answerOption[+].valueString = "Moderat"
      * answerOption[+].valueString = "Alvorlig"

    * item[+]
      * linkId = "astma-behandling"
      * type = #text
      * text = "Hvordan astmaen behandles"

    * item[+]
      * linkId = "astma-sesong"
      * type = #boolean
      * text = "Det er sesongvariasjoner?"

    * item[+]
      * linkId = "astma-hantere-selv"
      * type = #text
      * text = "I hvilken grad barnet kan håndtere astmaen selv?"
      * enableWhen[+]
        * question = "patient-age"
        * operator = #>=
        * answerInteger = 13

    * item[+]
      * linkId = "astma-duration"
      * type = #text
      * text = "Hvor mange år det er forventet at tilstanden vil vare?"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * type = #boolean
      * linkId = "astma-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * type = #text
        * linkId = "astma-endringer-details"
        * enableWhen[+]
          * question = "astma-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "astma-extra"





  * item[+]
    * linkId = "blodersykdom"
    * type = #group
    * text = "Blødersykdom"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #blodersykdom

    * item[+]
      * linkId = "blodersykdom-sykdomer"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "blodersykdom-skrev-ut-dato"
      * type = #date
      * text = "Når barnet ble skrevet ut fra sykehuset"

    * item[+]
      * linkId = "blodersykdom-alvorlighet"
      * type = #text
      * text = "Alvorlighetsgraden"

    * item[+]
      * linkId = "blodersykdom-behandling"
      * type = #text
      * text = "Hvordan sykdommen behandles"

    * item[+]
      * linkId = "blodersykdom-extra"
      * type = #text
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"





  * item[+]
    * linkId = "cystisk-fibrose"
    * type = #group
    * text = "Cystisk fibrose"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #cystisk-fibrose

    * item[+]
      * linkId = "cystisk-fibrose-sykdomer"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "cystisk-fibrose-affected-organs"
      * type = #choice
      * text = "Det er affeksjon av"
      * answerOption[+].valueString = "Mage"
      * answerOption[+].valueString = "Lunge"
      * answerOption[+].valueString = "Begge deler"

    * item[+]
      * linkId = "cystisk-fibrose-behandling"
      * type = #text
      * text = "Hvordan sykdommen behandles"

    * item[+]
      * linkId = "cystisk-fibrose-hantere-selv"
      * type = #text
      * text = "I hvilken grad barnet kan håndtere sykdommen selv?"
      * enableWhen[+]
        * question = "patient-age"
        * operator = #>=
        * answerInteger = 16

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "cystisk-fibrose-extra"






  * item[+]
    * linkId = "diabetes"
    * type = #group
    * text = "Diabetes"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #diabetes

    * item[+]
      * linkId = "diabetes-sykdomer"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "diabetes-diagnosis-date"
      * type = #date
      * text = "Når sykdommen ble oppdaget"

    * item[+]
      * linkId = "diabetes-checkout-date"
      * type = #date
      * text = "Når barnet ble skrevet ut fra sykehuset"

    * item[+]
      * linkId = "diabetes-hvordan-reguleres"
      * type = #text
      * text = "Hvordan sykdommen er regulert"

    * item[+]
      * linkId = "diabetes-pump"
      * type = #choice
      * text = "Barnet bruker insulinpumpe"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "diabetes-oppfoling"
      * type = #text
      * text = "Hvilken medisinsk oppfølging barnet får og hvilken effekt dette har"

    * item[+]
      * linkId = "diabetes-extra-help"
      * type = #text
      * text = "Er det andre medisinske forhold som fører til et ekstra hjelpebehov?"





  * item[+]
    * linkId = "dovhet"
    * type = #group
    * text = "Døvhet / sterkt tunghørt"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #dovhet

    * item[+]
      * linkId = "dovhet-sykdom"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "dovhet-omfanget-alvorlighet"
      * type = #text
      * text = "Omfanget og alvorlighetsgraden av hørselssvekkelsen"

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "dovhet-extra"

    * item[+]
      * text = "Du må også legge ved et audiogram (Kan vi bare spørre det vi trenger fra testet?)"
      * type = #text
      * linkId = "dovhet-audiogram"





  * item[+]
    * linkId = "epilepsi"
    * type = #group
    * text = "Epilepsi"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #epilepsi

    * item[+]
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"
      * type = #text
      * linkId = "epilepsi-sykdommer"

    * item[+]
      * text = "Hva slags anfall har barnet"
      * type = #text
      * linkId = "epilepsi-anfall"

    * item[+]
      * text = "Hva slags hjelpebehov har barnet som følge av anfallene"
      * type = #text
      * linkId = "epilepsi-anfall-behover"

    * item[+]
      * text = "Hvordan behandles sykdommen"
      * type = #text
      * linkId = "epilepsi-behandling"

    * item[+]
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"
      * type = #text
      * linkId = "epilepsi-sykdommer"

    * item[+]
      * linkId = "epilepsi-duration"
      * type = #text
      * text = "Hvor mange år det er forventet at tilstanden vil vare?"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * type = #boolean
      * linkId = "epilepsi-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * type = #text
        * linkId = "epilepsi-endringer-details"
        * enableWhen[+]
          * question = "epilepsi-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "epilepsi-extra"






  * item[+]
    * linkId = "fenylketonuri"
    * type = #group
    * text = "Fenylketonuri (PKU/Føllings) – barn under 16"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #fenylketonuri

    * item[+]
      * linkId = "fenylketonuri-sykdommer"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"
    
    * item[+]
      * linkId = "fenylketonuri-diagnosis-date"
      * type = #date
      * text = "Når sykdommen ble oppdaget"
    
    * item[+]
      * linkId = "fenylketonuri-skrev-ut-dato"
      * type = #date
      * text = "Når barnet ble skrevet ut fra sykehuset"
    
    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * type = #text
      * linkId = "fenylketonuri-extra"





  * item[+]
    * linkId = "hofteleddsdysplasi"
    * type = #group
    * text = "Hofteleddsdysplasi / hofteleddslukasjon / Calvé-Legg-Perthes sykdom"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #hofteleddsdysplasi

    * item[+]
      * linkId = "hofteleddsdysplasi-sykdomer"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "hofteleddsdysplasi-behandling"
      * type = #text
      * text = "Hvordan barnet behandles"

    * item[+]
      * linkId = "hofteleddsdysplasi-varighet"
      * type = #text
      * text = "Hvor lang tid vil behandlingsperioden og opptreningsperioden vil vare"

    * item[+]
      * linkId = "hofteleddsdysplasi-extra"
      * type = #text
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"






  * item[+]
    * linkId = "kreft"
    * type = #group
    * text = "Kreft"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #kreft

    * item[+]
      * linkId = "kreft-sykdomer"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "kreft-behandling"
      * type = #text
      * text = "Hvordan barnet behandles"

    * item[+]
      * linkId = "kreft-varighet"
      * type = #text
      * text = "Hvor lang tid vil behandlingsperioden vil vare"

    * item[+]
      * linkId = "kreft-extra"
      * type = #text
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
