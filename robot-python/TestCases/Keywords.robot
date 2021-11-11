*** Settings ***
Library     SeleniumLibrary
Resource   ../Resources/Keywords_Resource.robot
Documentation   this file having test case for checking the user defined keywords with agrs and return value
#instead of using setup and teardown in the test case level we can do that in the settings section as Test Setup and
#Test Teardown so that it gets executed for each test case
Test Setup      Open Browser and Maximize  ${url}     ${browser}
Test Teardown   Close Browser Window
Suite Setup     Before each Test Suite
Suite Teardown  After each Test Suite
#Default Tags will only run if there is no tags included elsewhere in the Test Case Level
#Default Tags    DFLT
#Force Tags doesn't matter if we have any other tags applied or not , forced tags will be applied to each TC
Force Tags      FRC
*** Variables ***
${url}      http://www.thetestingworld.com/testings
${browser}  Firefox

*** Test Cases ***
User Defined keyword with arguments
    #to run any test case using tags use syntax "robot -i Smoke .\Keywords.robot"
    #control execution by Tags
    #Include Tags -i (use AND | OR | NOT). Syntax :- robot -i SmokeNOTSanity .\Keywords.robot
    #Exclude Tags -e . Syntax :- robot -e Sanity .\Keywords.robot
    #Execute particular Test Case -t. Syntax :- robot -t "User Defined keyword with arguments" .\Keywords.robot
    #Execute particular Test Suite -s. Syntax:- robot -s Keywords.robot  TestCases
    #Set Report | Output | log Folder .Syntax:- robot -r ./Report/Report.html  -o ./Report/output.xml -l ./Report/log.html .\Keywords.robot
    [Tags]      Smoke   Sanity
    #User defined keyword with Args using python code
    #Create Folder at Run Time   TestingWorld    TestingWorldIndia
    ##user defined keyword with args and return value using python code
    #Concatenate Username and Password   Testing     World
    [Documentation]     This test case used to check functionality of resource files & user-defined keywords with args and return value
    #timeout 50s means if the execution completes within 50s then its ok or else will throw error Test timeout 50 seconds exceeded.
    [Timeout]   50s
    #Test case level setup and teardown which is going to execute at the beginning and end of execution of a test case
    #[Setup]     Open Browser and Maximize  ${url}     ${browser}
    #[Teardown]  Close Browser Window
    ${res}=     Get the title of the page
    #${res} = Login & Sign Up Forms
    #Logs the given message with the given level.
    Log     ${res}
    #Typing text 'Login & Sign Up Forms' into text field 'name:fld_username'.
    input text  name:fld_username   ${res}
    #Close Browser Window
