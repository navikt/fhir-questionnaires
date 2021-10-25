Instance: pleiepenger-livets-sluttfase
InstanceOf: Questionnaire
Usage: #definition
* url = "http://fhir.nav.no/Questionnaire/pleiepenger-livets-sluttfase"
* title = "Søknad om pleiepenger ved pleie i hjemmet av nærstående i livets sluttfase"
* status = #draft
* subjectType = #Patient

* item[+]
  * linkId = "legeerklaring"
  * type = #group
  * text = "Legeerklæring"

  * item[+]
    * linkId = "livets-sluttfase"
    * type = #choice
    * text = "Er pasienten er i livets sluttfase, det vil si at dødsfallet er ventet i nær fremtid"
    * answerOption[+].valueString = "Ja"
    * answerOption[+].valueString = "Nei"
  
  * item[+]
    * linkId = "pleiebehov"
    * type = #text
    * text = "Hvilket pleiebehov den pleietrengende har"

  * item[+]
    * linkId = "oppholder-hjemme"
    * type = #choice
    * text = "Skal den pleietrengende oppholder seg hjemme"
    * answerOption[+].valueString = "Ja"
    * answerOption[+].valueString = "Nei"