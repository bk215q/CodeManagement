#*** Settings ***
#Library     SeleniumLibrary
#
#*** Variables ***
#
#
#*** Test Cases ***
#Login & Sign Up Forms test
#    Open Browser    https://www.thetestingworld.com/testings/    Firefox
#    Input Text    //input[@name="fld_username"]    testing
#    Input Text    //input[@name="fld_email"]    testingworld@gmail.com
#    Input Text    //input[@name="fld_password"]    ***
#    Input Text    //input[@name="fld_cpassword"]    ***
#    Click Link    xpath=(//a[@href="#"])[12]
#    Input Text    //input[@name="phone"]    98044764355
#    Input Text    //input[@name="address"]    sarat road
#    Click Element    //input[@name="add_type"]
#    Select From List By Value    //select[@name="sex"]    1
#    Select From List By Value    //select[@name="country"]    101
#    Select From List By Value    //select[@name="state"]    41
#    Select From List By Value    //select[@name="city"]    5583
#    Input Text    //input[@name="zip"]    700032
#    Click Element    //input[@name="terms"]
#    Click Element    xpath=(//input)[14]
#
#    Close Browser

*** Settings ***
Documentation     A test suite with a single test for Login & Sign Up Forms
...               Created by hats' Robotcorder
Library           SeleniumLibrary    timeout=10

*** Variables ***
${BROWSER}    Firefox
${SLEEP}    3

*** Test Cases ***
Login & Sign Up Forms test
    Open Browser    https://www.thetestingworld.com/testings/    ${BROWSER}
    Input Text    //input[@name="fld_username"]    testing
    Input Text    //input[@name="fld_email"]    testingworld@gmail.com
    Input Text    //input[@name="fld_password"]    ***
    Input Text    //input[@name="fld_cpassword"]    ***
    Click Link    xpath=(//a[@href="#"])[12]
    Input Text    //input[@name="phone"]    98044764355
    Input Text    //input[@name="address"]    sarat road
    Click Element    //input[@name="add_type"]
    Select From List By Value    //select[@name="sex"]    1
    Select From List By Value    //select[@name="country"]    101
    Select From List By Value    //select[@name="state"]    41
    Select From List By Value    //select[@name="city"]    5583
    Input Text    //input[@name="zip"]    700032
    Click Element    //input[@name="terms"]
    Click Element    xpath=(//input)[14]

    Close Browser