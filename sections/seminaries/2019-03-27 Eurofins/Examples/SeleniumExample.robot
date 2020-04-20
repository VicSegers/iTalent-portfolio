*** Settings ***
Library  SeleniumLibrary

Suite Setup  open Browser  http://www.google.be  Google Chrome
Suite Teardown  Close browser

*** Test Cases ***
Google search
    [Documentation]  This test case will search for "Graspop Metal Meeting" using Google and clicks the first link
    Input Text  css:.gLFyf.gsfi  Graspop Metal Meeting
    ${form}=  Set variable  css:form#tsf.tsf
    Submit Form  ${form}
    ${links}=  Get Webelements  css:a>h3.LC20lb
    :FOR  ${link}  IN  @{links}
    \   ${title}=  Get text  ${link}
    \   Log  ${title}
    \   Run keyword if  "${title}" == "Graspop Metal Meeting 2019"  Click element  ${link}
    \   Exit For Loop If  "${title}" == "Graspop Metal Meeting 2019"
    Sleep  5s