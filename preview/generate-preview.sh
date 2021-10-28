#!/bin/sh
die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "argument required, provide location of json file"
[ -f "$1" ] || die "$1 does not exist"


content=$(jq @json < "$1") || die "Could not process json content from $1"
title=$(jq -r '.title' < "$1") || die "Could not extract title from $1"

cat << EOF
<html>
<head>
    <link
       href="https://clinicaltables.nlm.nih.gov/lforms-versions/27.1.0/styles/lforms.min.css"
       media="screen" rel="stylesheet" />
    <title>$title</title>
</head>
<body>
  <div id=formContainer></div>
  
  <script
   src="https://clinicaltables.nlm.nih.gov/lforms-versions/27.1.0/lforms.min.js"></script>
  <script
   src="https://clinicaltables.nlm.nih.gov/lforms-versions/27.1.0/fhir/R4/lformsFHIR.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/fhirclient@2.3.10/build/fhir-client.min.js"></script>
   
   <script>
    // var fhirAPI = FHIR.client({serverUrl: 'http://localhost:8090/fhir'});
    // LForms.Util.setFHIRContext(fhirAPI);

    var obj = JSON.parse($content);
    
    LForms.Util.addFormToPage(obj, 'formContainer');
 
    document.getElementById('file').addEventListener('change', onChange);    
   </script>
</body>
</html>
EOF