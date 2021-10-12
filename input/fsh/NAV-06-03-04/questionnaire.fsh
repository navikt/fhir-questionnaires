Instance: NAV-06-03-04
InstanceOf: Questionnaire
Usage: #definition
* url = "http://fhir.nav.no/Questionnaire/grunn-og-hjelpstonad-legeerklaring"
* title = "Grunn-og-hjelpstønad - Legens uttalelse"
* status = #draft
* subjectType = #Patient

* item[+]
  * linkId = "diagnoser"
  * type = #choice
  * text = "Hvilke diagnoser bruker har som er aktuelle for denne søknaden?"
  // TODO add code to help interpret questionnaire response
  // * answerValueSet = "http://fhir.nav.no/ValueSet/icd10"
  * answerOption[+].valueCoding = #ex1 "W20.8xxA"
  * answerOption[+].valueCoding = #ex2 "Eksample 2"
  * answerOption[+].valueCoding = #ex3 "Eksample 3"
  * required = true
  * repeats = true
* item[+]
  * linkId = "alder"
  * type = #quantity
  * text = "Alder (3)"
  * required = true

  // Add revurdering spørsmål

* item[+]
  * linkId = "grunnstonad-group"
  * type = #group
  * text = "Grunnstønad"
  * item[+]
    * type = #display
    * linkId = "grunnstonad-description"
    * text = """
      Grunnstønad skal dekke nødvendige ekstrautgifter på grunn av varig skade, sykdom, funksjonshemning eller medfødte funksjonsnedsettelser.

      
      Ekstrautgiftene må som hovedregel vare i 2-3 år eller mer på grunn av den medisinske tilstanden. Utgifter til medisiner dekkes ikke av grunnstønad.

      
      Det gis bare grunnstønad hvis pasienten har ekstrautgifter til: drift av tekniske hjelpemidler; transport; førerhund; servicehund; fordyret kosthold på grunn av spesialdiett; litasje på klær, sengetøy, sko og støvler som følge av uvanlig ofte vasking eller ekstra slitasje på grunn av bruken.

      Les mer: https://www.nav.no/no/person/familie/grunn-og-hjelpestonad/grunnstonad
    """
  * item[+]
    * linkId = "grunnstonad-application"
    * type = #boolean
    * text = "Pasienten skal søke om grunnstønad."
    * item[+]
      * linkId = "grunnstonad-group"
      * type = #group
      * enableWhen[+]
        * question = "grunnstonad-application"
        * operator = #=
        * answerBoolean = true
      
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
        * linkId = "fordyret-kosthold"
        * type = #group
        * text = "Fordyret kosthold"
        * enableWhen[+]
          * question = "grunnstonad-support-types"
          * operator = #=
          * answerCoding = #fordyret-kosthold
        * item[+]
          * linkId = "fordyret-kosthold-sykdom"
          * type = #choice
          * text = "Påvist sykdom"
          * answerOption[+].valueCoding = #coliaki "Cøliaki"
          * answerOption[+].valueCoding = #hveteallergi "Hveteallergi"
          * answerOption[+].valueCoding = #hvete-grutenintoleranse "Hvete-/glutenintoleranse"
          * answerOption[+].valueCoding = #cystisk-fibrose "Cystik fibrose"
          * answerOption[+].valueCoding = #medfodte-stoffskiftesykdommer "Medfødte stoffskiftesykdommer"
          * answerOption[+].valueCoding = #familiær-hyperkolesterolemi "Familiær hyperkolesterolemi (FH)"
          * answerOption[+].valueCoding = #epilepsi-ketogen "Epilepsi/ketogen"
          * answerOption[+].valueCoding = #annet "Annet"
          * item[+]
            * linkId = "fordyret-kosthold-annet"
            * type = #group
            * text = "Generell (8)"
            * enableWhen[+]
              * question = "fordyret-kosthold-sykdom"
              * operator = #=
              * answerCoding = #annet
            * item[+]
              * linkId = "fordyret-kosthold-annet-1"
              * type = #display
              * text = "Innhold av Fordyret kosthold – generell AS"

          * item[+]
            * linkId = "fordyret-kosthold-coliaki"
            * type = #group
            * text = "Cøliaki"
            * enableWhen[+]
              * question = "fordyret-kosthold-sykdom"
              * operator = #=
              * answerCoding = #coliaki
            * item[+]
              * linkId = "fordyret-kosthold-coliaki-1"
              * type = #display
              * text = "Innhold av Fordyret kosthold – Cøliaki AS"

          * item[+]
            * linkId = "fordyret-kosthold-hveteallergi"
            * type = #group
            * text = "Hvetallergi"
            * enableWhen[+]
              * question = "fordyret-kosthold-sykdom"
              * operator = #=
              * answerCoding = #hveteallergi
            * item[+]
              * linkId = "fordyret-kosthold-hveteallergi-1"
              * type = #display
              * text = "Innhold av Fordyret kosthold – søknad hveteallergi AS"

          * item[+]
            * linkId = "fordyret-kosthold-hvete-grutenintoleranse"
            * type = #group
            * text = "Hvete-/glutenintoleranse"
            * enableWhen[+]
              * question = "fordyret-kosthold-sykdom"
              * operator = #=
              * answerCoding = #hvete-grutenintoleranse
            * item[+]
              * linkId = "fordyret-kosthold-hvete-grutenintoleranse-1"
              * type = #display
              * text = "Innhold av Fordyret kosthold – søknad hvete-/glutenintoleranse  AS"

          * item[+]
            * linkId = "fordyret-kosthold-cystisk-fibrose"
            * type = #group
            * text = "Cystik fibrose"
            * enableWhen[+]
              * question = "fordyret-kosthold-sykdom"
              * operator = #=
              * answerCoding = #cystisk-fibrose
            * item[+]
              * linkId = "fordyret-kosthold-cystisk-fibrose-1"
              * type = #display
              * text = "Innhold av Fordyret kosthold – cystisk fibrose AS"

          * item[+]
            * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer"
            * type = #group
            * text = "Medfødte stoffskiftesykdommer"
            * enableWhen[+]
              * question = "fordyret-kosthold-sykdom"
              * operator = #=
              * answerCoding = #medfodte-stoffskiftesykdommer
            * item[+]
              * linkId = "fordyret-kosthold-medfodte-stoffskiftesykdommer-1"
              * type = #display
              * text = "Innhold av Fordyret kosthold – medfødte stoffskiftesykdommer AS"

          * item[+]
            * linkId = "fordyret-kosthold-epilepsi-ketogen"
            * type = #group
            * text = "Epilepsi/ketogen"
            * enableWhen[+]
              * question = "fordyret-kosthold-sykdom"
              * operator = #=
              * answerCoding = #epilepsi-ketogen
            * item[+]
              * linkId = "fordyret-kosthold-epilepsi-ketogen-1"
              * type = #display
              * text = "Innhold av Fordyret kosthold – søknad – epilepsi/ketogen diett AS"
      
      * item[+]
        * linkId = "1.1.2"
        * text = "Transport"
        * type = #group
        * enableWhen[+]
          * question = "grunnstonad-support-types"
          * operator = #=
          * answerCoding = #transport

        * item[+]
          * linkId = "1.1.2.3"
          * type = #boolean
          * text = "Bruker er avskåret fra å benytte offentlig transport av medisinske grunner."
          * required = true
        * item[+]
          * linkId = "transport-lidelser"
          * type = #choice
          * text = "Hvilke sykdommer/lidelser bruker har som er aktuelle for denne søknaden:"
          * answerOption[+].valueCoding = #psykisk "Psykisk"
          * answerOption[+].valueCoding = #annet "Annet"
          * item[+]
            * linkId = "transport-lidelser-annent"
            * type = #text
            * text = "Hvis annet, Redegjør nærmere"
            * enableWhen[+]
              * question = "transport-lidelser"
              * operator = #=
              * answerCoding = #annet
          * item[+]
            * linkId = "transport-lidelser-psykisk"
            * type = #text
            * text = "Hvis annet, Redegjør nærmere"
            * enableWhen[+]
              * question = "transport-lidelser"
              * operator = #=
              * answerCoding = #psykisk
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
          * type = #string
          * text = "Hvilken behandling får bruker og hvilken effekt behandlingen har."
        
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
          * type = #string
          * text = "Det er noe mer vi bør vite for å vurdere søknaden."
      
        
      * item[+]
        * linkId = "1.1.1"
        * type = #group
        * text = "Klesslitasje"
        * enableWhen[+]
          * question = "grunnstonad-support-types"
          * operator = #=
          * answerCoding = #klesslitasje
        * item[+]
          * text = "Oppgi en spesifikasjon av brukers utfordringer som følge av diagnosen, for eksempel uro, utagering, konsentrasjonsvansker, impulsivitet, hyperaktivitet, søvnvansker, motoriske vansker og lignende."
          * type = #choice
          * repeats = true
          * linkId = "klesslitasje-utfordringer"
          * answerOption[+].valueCoding = #uro "Uro"
          * answerOption[+].valueCoding = #hudlidelse "Hudlidelse"
          * answerOption[+].valueCoding = #konsentrasjonsvansker "Konsentrasjonsvansker"
          * answerOption[+].valueCoding = #impulsivitet "Impulsivitet"
          * answerOption[+].valueCoding = #hyperaktivitet "Hyperaktivitet (9)"
          * answerOption[+].valueCoding = #sovnvansker "Søvnvansker"
          * answerOption[+].valueCoding = #motoriske-vansker "Motoriske vansker og lignende"
          * answerOption[+].valueCoding = #annet "Annet"
          * item[+]
            * linkId = "klesslitasje-annet"
            * type = #text
            * text = "Hvis annet, Redegjør nærmere"
            * enableWhen[+]
              * question = "klesslitasje-utfordringer"
              * operator = #=
              * answerCoding = #annet

        * item[+]
          * linkId = "klesslitasje-hudlidelse"
          * type = #group
          * text = "Hudlidelse"
          * enableWhen[+]
            * question = "klesslitasje-utfordringer"
            * operator = #=
            * answerCoding = #hudlidelse
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
            * linkId = "klesslitasje-hudlidelse-karakterisering"
            * type = #text
            * text = "Hvordan hudlidelsen karakterisere"
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
          * linkId = "klesslitasje-generell"
          * type = #group
          * text = "Generell"
          * item[+]
            * text = "Hvor alvorlig den medisinske tilstanden er."
            * type = #text
            * linkId = "klesslitasje-alvorlighet"
          * item[+]
            * text = "Hvilken behandling bruker får og hvilken effekt Behandlingen har"
            * type = #text
            * linkId = "klesslitasje-behandling"
          * item[+]
            * text = "Det kan ventes endring av tilstanden"
            * type = #boolean
            * linkId = "klesslitasje-endringer"
            * item[+]
              * text = "Redegjør nærmere"
              * type = #text
              * linkId = "klesslitasje-endringer-details"
              * enableWhen[+]
                * question = "klesslitasje-endringer"
                * operator = #=
                * answerBoolean = true

* item[+]
  * linkId = "1.2"
  * type = #group
  * text = "Hjelpstønad"
  * item[+]
    * linkId = "hjelpstonad-description"
    * type = #display
    * text = """
      Hvis pasienten trenger langvarig, privat pleie og tilsyn på grunn av en sykdom, skade eller medfødt funksjonshemning, kan pasienten ha rett til hjelpestønad.

      Les mer: https://www.nav.no/no/person/familie/grunn-og-hjelpestonad/hjelpestonad
    """
  * item[+]
    * linkId = "hjelpstonad-application"
    * type = #boolean
    * text = "Pasienten skal søke om hjelpstønad."
    * item[+]
      * linkId = "hjelpstonad-group"
      * type = #group
      * enableWhen[+]
        * question = "hjelpstonad-application"
        * operator = #=
        * answerBoolean = true

      * item[+]
        * linkId = "1.2-support-types"
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
        * linkId = "hjelpstonad-sykdom"
        * text = "Hvilke sykdommer bruker har som er aktuelle for denne saken"
        * type = #choice
        * answerOption[+].valueCoding = #astma "Astma"
        * answerOption[+].valueCoding = #hudlidelse "Hudlidelse"
        * answerOption[+].valueCoding = #blodersykdom "Blødersykdom"
        * answerOption[+].valueCoding = #cystisk-fibrose "Cystisk fibrose"
        * answerOption[+].valueCoding = #diabetes "Diabetes"
        * answerOption[+].valueCoding = #epilepsi "Epilepsi"
        * answerOption[+].valueCoding = #fenylketonuri "Fenylketonuri (PKU/Føllings) (10)"
        * answerOption[+].valueCoding = #kreft "Kreft"
        * answerOption[+].valueCoding = #annet "Annet"
      * item[+]
        * linkId = "hjelpstonad-generell"
        * text = "Generell"
        * type = #group
        * enableWhen[+]
          * question = "hjelpstonad-sykdom"
          * operator = #=
          * answerCoding = #annet
        * item[+]
          * linkId = "hjelpstonad-generell-1"
          * type = #display
          * text = "Generell – voksen AS/ Generell – barn AS"
      * item[+]
        * linkId = "hjelpstonad-kreft"
        * text = "Kreft"
        * type = #group
        * enableWhen[+]
          * question = "hjelpstonad-sykdom"
          * operator = #=
          * answerCoding = #kreft
        * item[+]
          * linkId = "hjelpstonad-kreft-1"
          * type = #display
          * text = "Kreft søknad – barn AS"

      // TODO: expand all other options