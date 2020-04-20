*** Keywords ***
Add two strings
    [Documentation]  This function adds 2 strings, logs and returns the result
    [Arguments]  ${string1}  ${string2}
    ${result}=  Catenate  ${string1}${string2}
    Log  ${result}
    [Return]  ${result}