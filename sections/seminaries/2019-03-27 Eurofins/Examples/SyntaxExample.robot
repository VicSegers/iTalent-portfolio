*** Settings ***
Resource  ./Resources/ExampleResource.robot

*** Variables ***
${Message}=  Hello World!

*** Keywords ***
Multiply Numbers
    [Documentation]  This keyword multiplies 2 numbers, logs & returns the result
    [Arguments]  ${number1}  ${number2}
    ${result}=  Evaluate  ${number1} * ${number2}
    Log  ${result}
    [Return]  ${result}
 
*** Test Cases ***
Test case 1
    [Tags]  Sanity Test
    Log  ${Message}
    ${result}=  Multiply numbers  ${3}  ${5}
    Log  ${result}
    #This line is a comment
    ${result}=  Add two strings  String1  String2
    Log  ${result}