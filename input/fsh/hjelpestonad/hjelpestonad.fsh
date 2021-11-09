Instance: hjelpestonad
InstanceOf: Questionnaire
Usage: #definition
* url = "http://fhir.nav.no/Questionnaire/hjelpestonad"
* title = "Hjelpstønad"
* status = #draft
* subjectType = #Patient
* version = "SNAPSHOT"

* item[+]
  * linkId = "patient-group"
  * prefix = "1"
  * type = #group
  * text = "Pasients uttalelse"

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
    * type = #integer
    * required = true
    * text = "Alder"

  * item[+]
    * linkId = "support-types"
    * prefix = "1.4"
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
      * prefix = "1.4.1"
      * text = "Hvis annet, spesifiere"
      * type = #text

* item[+]
  * linkId = "doctor-group"
  * prefix = "2"
  * type = #group
  * text = "Legens uttalelse"

  * item[+]
    * linkId = "diagnoses"
    * prefix = "2.1"
    * type = #open-choice
    * text = "Hvilke(n) diagnose(r) har søkeren?"
    * required = true
    * repeats = true

  * item[+]
    * linkId = "hjelpestonad-duration"
    * prefix = "2.2"
    * type = #boolean
    * text = "Er tilstanden varig (som hovedregel 2-3 år eller mer)?"
    * required = true
  * item[+]
    * linkId = "hjelpestonad-duration-variation"
    * prefix = "2.3"
    * text = "Kan det ventes endring på kort eller lengre sikt?"
    * type = #boolean
    * required = true
    * item[+]
      * linkId = "hjelpestonad-duration-variation-details"
      * prefix = "2.3.1"
      * enableWhen[+]
        * question = "hjelpestonad-duration-variation"
        * operator = #=
        * answerBoolean = true
      * type = #text
      * text = "Når og hvorfor/hvordan?"

  * item[+]
    * linkId = "hjelpestonad-assesment"
    * prefix = "2.4"
    * type = #text
    * text = "I hvilken grad bekrefter undersøkelsen(e) søkerens utsagn om egen funksjonsevne og behov for ekstra tilsyn/pleie?"
  * item[+]
    * linkId = "hjelpestonad-hide-from-patient"
    * prefix = "2.5"
    * type = #boolean
    * text = "Er det noe i legeerklæringen som pasienten ikke bør få vite av medisinske grunner?"
    * item[+]
      * linkId = "hjelpestonad-hide-from-patient-details"
      * prefix = "2.5.1"
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
    * prefix = "2.6"
    * text = "Vennligst velg skjema som er mest relevant"
    * type = #choice
    * answerOption[+].valueCoding = #general "Annet"
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
    * prefix = "2.7"
    * type = #group
    * text = "Generell - voksen"
    * enableWhen[+]
      * question = "patient-age"
      * operator = #>=
      * answerInteger = 18

    * item[+]
      * linkId = "general-adult-sykdomer"
      * prefix = "2.7.1"
      * type = #text
      * text = "Hvilke sykdommer bruker har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "general-adult-behov"
      * prefix = "2.7.2"
      * type = #text
      * text = "Beskriv brukers behov for tilsyn og pleie"

    * item[+]
      * linkId = "general-adult-challenges"
      * prefix = "2.7.3"
      * type = #text
      * text = "Beskriv brukers utfordringer som følge av sykdommen. Dette kan være  uro, utagering, konsentrasjonsvansker, impulsivitet, søvnvansker, motoriske vansker og lignende."

    * item[+]
      * linkId = "general-adult-medicine"
      * prefix = "2.7.4"
      * type = #choice
      * text = "Bruker er medisinert?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "general-adult-medicine-details"
        * prefix = "2.7.4.1"
        * type = #text
        * text = "Hvis ja - ber vi deg redegjøre for effekt / bivirkninger"
        * enableWhen[+]
          * question = "general-adult-medicine"
          * operator = #=
          * answerString = "Ja"

    * item[+]
      * text = "Hvor mange år det er forventet at tilstanden og hjelpebehovet vil vare?"
      * prefix = "2.7.5"
      * type = #text
      * linkId = "fordyret-kosthold-general-duration"

    * item[+]
      * linkId = "general-adult-endringer"
      * prefix = "2.7.6"
      * type = #boolean
      * text = "Det kan ventes endring av tilstanden"
      * item[+]
        * text = "Redegjør nærmere"
        * prefix = "2.7.6.1"
        * type = #text
        * linkId = "general-adult-details"
        * enableWhen[+]
          * question = "general-adult-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * prefix = "2.7.7"
      * type = #text
      * linkId = "general-adult-extra"




  * item[+]
    * linkId = "general-child"
    * prefix = "2.8"
    * type = #group
    * text = "Generell - barn"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #general

    * item[+]
      * linkId = "general-child-sykdomer"
      * prefix = "2.8.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "general-child-behov"
      * prefix = "2.8.2"
      * type = #text
      * text = "Beskriv barnets behov for tilsyn og pleie sammenlignet med andre barn?"

    * item[+]
      * linkId = "general-child-challenges"
      * prefix = "2.8.3"
      * type = #text
      * text = "Beskriv barnets utfordringer som følge av sykdommen.. Dette kan være uro, utagering, konsentrasjonsvansker, impulsivitet, søvnvansker, motoriske vansker og lignende."

    * item[+]
      * linkId = "general-child-medicine"
      * prefix = "2.8.4"
      * type = #choice
      * text = "Barnet er medisinert?"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"
      * item[+]
        * linkId = "general-child-medicine-details"
        * prefix = "2.8.4.1"
        * type = #text
        * text = "Hvis ja - ber vi deg redegjøre for effekt / bivirkninger"
        * enableWhen[+]
          * question = "general-child-medicine"
          * operator = #=
          * answerString = "Ja"      

    * item[+]
      * text = "Hvor mange år det er forventet at tilstanden og hjelpebehovet vil vare?"
      * prefix = "2.8.5"
      * type = #text
      * linkId = "general-child-duration"

    * item[+]
      * linkId = "general-child-endringer"
      * prefix = "2.8.6"
      * type = #boolean
      * text = "Det kan ventes endring av tilstanden"
      * item[+]
        * text = "Redegjør nærmere"
        * prefix = "2.8.6.1"
        * type = #text
        * linkId = "general-child-details"
        * enableWhen[+]
          * question = "general-child-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * prefix = "2.8.7"
      * type = #text
      * linkId = "general-child-extra"






  * item[+]
    * linkId = "hudlidelse"
    * prefix = "2.9"
    * type = #group
    * text = "Hudliselse"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #hudlidelse

    * item[+]
      * linkId = "hudlidelse-sykdomer"
      * prefix = "2.9.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "hudlidelse-karakterisering"
      * prefix = "2.9.2"
      * type = #text
      * text = "Hvordan hudlidelsen karakterisere"

    * item[+]
      * linkId = "hudlidelse-hvor"
      * prefix = "2.9.3"
      * type = #text
      * text = "Hvor på kroppen den er lokalisert"
    
    * item[+]
      * linkId = "hudlidelse-behandling"
      * prefix = "2.9.4"
      * type = #text
      * text = "Hvordan den behandles"
    
    * item[+]
      * linkId = "hudlidelse-sesong"
      * prefix = "2.9.5"
      * type = #boolean
      * text = "Det er sesongvariasjoner?"

    * item[+]
      * linkId = "hudlidelse-hantere-selv"
      * prefix = "2.9.6"
      * type = #text
      * text = "I hvilken grad barnet kan håndtere hudlidelsen selv?"
      * enableWhen[+]
        * question = "patient-age"
        * operator = #>=
        * answerInteger = 13

    * item[+]
      * linkId = "hudlidelse-duration"
      * prefix = "2.9.7"
      * type = #text
      * text = "Hvor mange år det er forventet at tilstanden vil vare?"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * prefix = "2.9.8"
      * type = #boolean
      * linkId = "hudlidelse-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * prefix = "2.9.8.1"
        * type = #text
        * linkId = "hudlidelse-endringer-details"
        * enableWhen[+]
          * question = "hudlidelse-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * prefix = "2.9.9"
      * type = #text
      * linkId = "hudlidelse-extra"






  * item[+]
    * linkId = "astma"
    * prefix = "2.10"
    * type = #group
    * text = "Astma"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #astma

    * item[+]
      * linkId = "astma-sykdomer"
      * prefix = "2.10.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "astma-grad"
      * prefix = "2.10.2"
      * type = #choice
      * text = "Astmaen er å anse som:"
      * answerOption[+].valueString = "Mild"
      * answerOption[+].valueString = "Moderat"
      * answerOption[+].valueString = "Alvorlig"

    * item[+]
      * linkId = "astma-behandling"
      * prefix = "2.10.3"
      * type = #text
      * text = "Hvordan astmaen behandles"

    * item[+]
      * linkId = "astma-sesong"
      * prefix = "2.10.4"
      * type = #boolean
      * text = "Det er sesongvariasjoner?"

    * item[+]
      * linkId = "astma-hantere-selv"
      * prefix = "2.10.5"
      * type = #text
      * text = "I hvilken grad barnet kan håndtere astmaen selv?"
      * enableWhen[+]
        * question = "patient-age"
        * operator = #>=
        * answerInteger = 13

    * item[+]
      * linkId = "astma-duration"
      * prefix = "2.10.6"
      * type = #text
      * text = "Hvor mange år det er forventet at tilstanden vil vare?"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * prefix = "2.10.7"
      * type = #boolean
      * linkId = "astma-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * prefix = "2.10.7.1"
        * type = #text
        * linkId = "astma-endringer-details"
        * enableWhen[+]
          * question = "astma-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * prefix = "2.10.8"
      * type = #text
      * linkId = "astma-extra"





  * item[+]
    * linkId = "blodersykdom"
    * prefix = "2.11"
    * type = #group
    * text = "Blødersykdom"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #blodersykdom

    * item[+]
      * linkId = "blodersykdom-sykdomer"
      * prefix = "2.11.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "blodersykdom-skrev-ut-dato"
      * prefix = "2.11.2"
      * type = #date
      * text = "Når barnet ble skrevet ut fra sykehuset"

    * item[+]
      * linkId = "blodersykdom-alvorlighet"
      * prefix = "2.11.3"
      * type = #text
      * text = "Alvorlighetsgraden"

    * item[+]
      * linkId = "blodersykdom-behandling"
      * prefix = "2.11.4"
      * type = #text
      * text = "Hvordan sykdommen behandles"

    * item[+]
      * linkId = "blodersykdom-extra"
      * prefix = "2.11.5"
      * type = #text
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"





  * item[+]
    * linkId = "cystisk-fibrose"
    * prefix = "2.12"
    * type = #group
    * text = "Cystisk fibrose"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #cystisk-fibrose

    * item[+]
      * linkId = "cystisk-fibrose-sykdomer"
      * prefix = "2.12.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "cystisk-fibrose-affected-organs"
      * prefix = "2.12.2"
      * type = #choice
      * text = "Det er affeksjon av"
      * answerOption[+].valueString = "Mage"
      * answerOption[+].valueString = "Lunge"
      * answerOption[+].valueString = "Begge deler"

    * item[+]
      * linkId = "cystisk-fibrose-behandling"
      * prefix = "2.12.3"
      * type = #text
      * text = "Hvordan sykdommen behandles"

    * item[+]
      * linkId = "cystisk-fibrose-hantere-selv"
      * prefix = "2.12.4"
      * type = #text
      * text = "I hvilken grad barnet kan håndtere sykdommen selv?"
      * enableWhen[+]
        * question = "patient-age"
        * operator = #>=
        * answerInteger = 16

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * prefix = "2.12.5"
      * type = #text
      * linkId = "cystisk-fibrose-extra"






  * item[+]
    * linkId = "diabetes"
    * prefix = "2.13"
    * type = #group
    * text = "Diabetes"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #diabetes

    * item[+]
      * linkId = "diabetes-sykdomer"
      * prefix = "2.13.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne søknaden"

    * item[+]
      * linkId = "diabetes-diagnosis-date"
      * prefix = "2.13.2"
      * type = #date
      * text = "Når sykdommen ble oppdaget"

    * item[+]
      * linkId = "diabetes-checkout-date"
      * prefix = "2.13.3"
      * type = #date
      * text = "Når barnet ble skrevet ut fra sykehuset"

    * item[+]
      * linkId = "diabetes-hvordan-reguleres"
      * prefix = "2.13.4"
      * type = #text
      * text = "Hvordan sykdommen er regulert"

    * item[+]
      * linkId = "diabetes-pump"
      * prefix = "2.13.5"
      * type = #choice
      * text = "Barnet bruker insulinpumpe"
      * answerOption[+].valueString = "Ja"
      * answerOption[+].valueString = "Nei"

    * item[+]
      * linkId = "diabetes-oppfoling"
      * prefix = "2.13.6"
      * type = #text
      * text = "Hvilken medisinsk oppfølging barnet får og hvilken effekt dette har"

    * item[+]
      * linkId = "diabetes-extra-help"
      * prefix = "2.13.7"
      * type = #text
      * text = "Er det andre medisinske forhold som fører til et ekstra hjelpebehov?"





  * item[+]
    * linkId = "dovhet"
    * prefix = "2.14"
    * type = #group
    * text = "Døvhet / sterkt tunghørt"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #dovhet

    * item[+]
      * linkId = "dovhet-sykdom"
      * prefix = "2.14.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "dovhet-omfanget-alvorlighet"
      * prefix = "2.14.2"
      * type = #text
      * text = "Omfanget og alvorlighetsgraden av hørselssvekkelsen"

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * prefix = "2.14.3"
      * type = #text
      * linkId = "dovhet-extra"

    * item[+]
      * text = "Du må også legge ved et audiogram (Kan vi bare spørre det vi trenger fra testet?)"
      * prefix = "2.14.4"
      * type = #text
      * linkId = "dovhet-audiogram"





  * item[+]
    * linkId = "epilepsi"
    * prefix = "2.15"
    * type = #group
    * text = "Epilepsi"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #epilepsi

    * item[+]
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"
      * prefix = "2.15.1"
      * type = #text
      * linkId = "epilepsi-sykdommer"

    * item[+]
      * text = "Hva slags anfall har barnet"
      * prefix = "2.15.2"
      * type = #text
      * linkId = "epilepsi-anfall"

    * item[+]
      * text = "Hva slags hjelpebehov har barnet som følge av anfallene"
      * prefix = "2.15.3"
      * type = #text
      * linkId = "epilepsi-anfall-behover"

    * item[+]
      * text = "Hvordan behandles sykdommen"
      * prefix = "2.15.4"
      * type = #text
      * linkId = "epilepsi-behandling"

    * item[+]
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"
      * prefix = "2.15.5"
      * type = #text
      * linkId = "epilepsi-sykdommer"

    * item[+]
      * linkId = "epilepsi-duration"
      * prefix = "2.15.6"
      * type = #text
      * text = "Hvor mange år det er forventet at tilstanden vil vare?"

    * item[+]
      * text = "Det kan ventes endring av tilstanden"
      * prefix = "2.15.7"
      * type = #boolean
      * linkId = "epilepsi-endringer"
      * item[+]
        * text = "Redegjør nærmere"
        * prefix = "2.15.7.1"
        * type = #text
        * linkId = "epilepsi-endringer-details"
        * enableWhen[+]
          * question = "epilepsi-endringer"
          * operator = #=
          * answerBoolean = true

    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * prefix = "2.15.8"
      * type = #text
      * linkId = "epilepsi-extra"






  * item[+]
    * linkId = "fenylketonuri"
    * prefix = "2.16"
    * type = #group
    * text = "Fenylketonuri (PKU/Føllings) – barn under 16"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #fenylketonuri

    * item[+]
      * linkId = "fenylketonuri-sykdommer"
      * prefix = "2.16.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"
    
    * item[+]
      * linkId = "fenylketonuri-diagnosis-date"
      * prefix = "2.16.2"
      * type = #date
      * text = "Når sykdommen ble oppdaget"
    
    * item[+]
      * linkId = "fenylketonuri-skrev-ut-dato"
      * prefix = "2.16.3"
      * type = #date
      * text = "Når barnet ble skrevet ut fra sykehuset"
    
    * item[+]
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
      * prefix = "2.16.4"
      * type = #text
      * linkId = "fenylketonuri-extra"





  * item[+]
    * linkId = "hofteleddsdysplasi"
    * prefix = "2.17"
    * type = #group
    * text = "Hofteleddsdysplasi / hofteleddslukasjon / Calvé-Legg-Perthes sykdom"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #hofteleddsdysplasi

    * item[+]
      * linkId = "hofteleddsdysplasi-sykdomer"
      * prefix = "2.17.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "hofteleddsdysplasi-behandling"
      * prefix = "2.17.2"
      * type = #text
      * text = "Hvordan barnet behandles"

    * item[+]
      * linkId = "hofteleddsdysplasi-varighet"
      * prefix = "2.17.3"
      * type = #text
      * text = "Hvor lang tid vil behandlingsperioden og opptreningsperioden vil vare"

    * item[+]
      * linkId = "hofteleddsdysplasi-extra"
      * prefix = "2.17.4"
      * type = #text
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"






  * item[+]
    * linkId = "kreft"
    * prefix = "2.18"
    * type = #group
    * text = "Kreft"
    * enableWhen[+]
      * question = "hjelpestonad-questionnaire-child"
      * operator = #=
      * answerCoding = #kreft

    * item[+]
      * linkId = "kreft-sykdomer"
      * prefix = "2.18.1"
      * type = #text
      * text = "Hvilke sykdommer barnet har som er aktuelle for denne saken"

    * item[+]
      * linkId = "kreft-behandling"
      * prefix = "2.18.2"
      * type = #text
      * text = "Hvordan barnet behandles"

    * item[+]
      * linkId = "kreft-varighet"
      * prefix = "2.18.3"
      * type = #text
      * text = "Hvor lang tid vil behandlingsperioden vil vare"

    * item[+]
      * linkId = "kreft-extra"
      * prefix = "2.18.4"
      * type = #text
      * text = "Er det noe mer vi bør vite for å vurdere søknaden?"
