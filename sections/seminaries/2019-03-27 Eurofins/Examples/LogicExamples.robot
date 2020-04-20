*** Keywords ***
Nested For
    [Documentation]  Keyword which contains a for loop used in a nested for loop
    [Arguments]  ${list}
    Log  Logging items in list:
    :FOR  ${item}  IN  @{list}
    \   Log  ${item}

Optional parameters
    [Documentation]  Keyword with optional parameters
    [Arguments]  ${arg1}  ${optionalValue}=Default
    Log  ${arg1} ${optionalValue}

Multiple returns
    [Documentation]  Keyword with mutliple returns
    [Return]  ${1}  ${2}  ${3}

*** Test Cases ***
If Statement
    [Tags]  if
    [Documentation]  This test case demonstrates an if statement
    ${life}=  Set Variable  ${30}
    Run keyword if  ${life} == ${42}  Log  "The answer to the ultimate question"  ELSE  Log  "Try again"
    ${life}=  Run keyword unless  ${life} == ${42}  Set variable  ${42}
    Run keyword if  ${life} == ${42}  Log  "The answer to the ultimate question"  ELSE  Log  "Try again"

For Loop Test
    [Tags]  for
    [Documentation]  This test case demonstrates a for loop    
    :FOR  ${i}  IN RANGE  ${10}
    \   Log  ${i}

    ${list}=  Create list  String1  String2  String3  String4
    :FOR  ${item}  IN  ${list}
    \   Log  ${item}

    :FOR  ${item}  IN  @{list}
    \   Log  ${item}

Nested For Loop
    [Tags]  for
    [Documentation]  For loops cannot be nested with Robot Framework, instead a new keyword needs to be defined
    ${list1}=  Create list  String1-1  String1-2  String1-3  String1-4
    ${list2}=  Create list  String2-1  String2-2  String2-3  String2-4
    ${list3}=  Create list  String3-1  String3-2  String3-3  String3-4
    ${list4}=  Create list  ${list1}  ${list2}  ${list3}

    :FOR  ${item}  IN  @{list4}
    \   Log  Logging list
    \   Log  ${item}
    \   Nested for  ${item}

Passing Tests
    [Tags]  result
    [Documentation]  This test case will always pass
    Pass Execution  This keyword will pass the test case and skip the rest of the test case
    Log  This keyword is not executed

Failing Tests
    [Tags]  result
    [Documentation]  This test case will always fail
    ${exampleString}=  Set variable  This is an example string
    Should be empty  ${exampleString}
    Length should be  ${exampleString}  ${26}
    Should be true  ${FALSE}
    Should be equal  ${exampleString}  Another string
    Fail  This keyword immediately fails the test case
    Log  The end of the test case

Keyword Tests
    [Tags]  Keywords
    [Documentation]  This test case will handle additional keyword options
    Optional parameters  ${1} 
    Optional parameters  ${1}  ${2}

    ${list}=  Multiple returns
    ${return1}  ${return2}  ${return3}=  Multiple returns
