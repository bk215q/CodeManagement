*** Settings ***
Library   SeleniumLibrary
Library     ../ExternalFiles/Element_locator.py

*** Variables ***
${url}      https://www.thetestingworld.com/testings/

*** Test Cases ***
Advanced Robot Skills
    [Tags]      Smoke
    open browser    ${url}  Firefox
    maximize browser window
    #passing actual jsonpath from Element.json file as a parameter while calling the keyword Read locator from json file
    ${username}=   Read locator from json file     Registration.username_textbox_name
    ${pass}=    Read locator from json file     Registration.password_textbox_name
    ${email}=   Read locator from json file     Registration.email_textbox_name
    input text  name:${username}   Testing
    input text  name:${email}      Testing@gmail.com
    input text  name:${pass}   mnb123
    close browser

*** Keywords ***
Read locator from json file
    [Arguments]  ${elementpath}
    #read_locator_from_json will call the method from Element_locator.py with with parameter ${elementpath}
    ${result}=  read_locator_from_json  ${elementpath}
    [Return]  ${result}