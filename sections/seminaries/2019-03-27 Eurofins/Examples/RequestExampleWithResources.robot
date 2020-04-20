*** Settings ***
Resource  ./RequestResource.robot

*** Test Cases ***
Get Example
    ${postcode}=  Get Random Postcode
    Log  ${result}

Post Example
    ${response}=  Lookup postcodes
    Log  ${response.status_code} ${response.text}