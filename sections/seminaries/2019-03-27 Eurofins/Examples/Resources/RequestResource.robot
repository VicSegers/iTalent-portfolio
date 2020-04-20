*** Settings ***
Library  RequestsLibrary
Library  JSONLibrary

*** Keywords ***
Get Random Postcode
    [Documentation]  This keyword will query the postcode database and returns a random postcode
    Create session  APIUt  http://postcodes.io
    ${response}=  Get request  APIUt  /random/postcodes
    ${response}=  To Json  ${response.text}
    ${result}=  Get value from json  ${response}  $.result.postcode
    [Return]  ${result}

Lookup postcodes
    [Documentation]  This keyword will lookup 3 different postcodes and return the response of the query
    Create session  APIUt  http://postcodes.io
    ${request}=  Set variable  {"postcodes" : ["OX49 5NU", "M32 0JG", "NE30 1DP"]}
    &{headers}=  Create Dictionary  Content-Type=application/JSON
    ${response}=  Post request  APIUt  /postcodes  data=${request}  headers=${headers}
    [Return]  ${response}