*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary

*** Test Cases ***
Get Example
    Create session  APIUt  http://postcodes.io
    ${response}=  Get request  APIUt  /random/postcodes
    Log  ${response.status_code} ${response.text}
    ${response}=  To Json  ${response.text}
    ${result}=  Get value from json  ${response}  $.result.postcode
    Log  ${result}

Post Example
    Create session  APIUt  http://postcodes.io
    ${request}=  Set variable  {"postcodes" : ["OX49 5NU", "M32 0JG", "NE30 1DP"]}
    &{headers}=  Create Dictionary  Content-Type=application/JSON
    ${response}=  Post request  APIUt  /postcodes  data=${request}  headers=${headers}
    Log  ${response.status_code} ${response.text}