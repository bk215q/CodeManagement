*** Settings ***
Library     SeleniumLibrary
Library     ../ExternalFiles/UserKeyword.py

*** Variables ***

*** Keywords ***
Open Browser and Maximize
    [Documentation]    This keyword is used to open a browser with the given url and maximize it's window
    [Arguments]     ${user_url}     ${input_browser}
    open browser    ${user_url}  ${input_browser}
    maximize browser window
Get the title of the page
    [Documentation]     This keyword  fetches the title of the page anf returns it back
    ${title}=   get title
    #log to console  ${title}
    [Return]    ${title}

Close Browser Window
    [Documentation]     This keyword is used to close the browser at the end of execution
    close browser

Before each Test Suite
    log to console  Before each Test Suite

After each Test Suite
    log to console  After each Test Suite

#user defined keyword with args using python code
Create Folder at Run Time
    [Arguments]     ${foldername}   ${subfoldername}
    #create_folder will call the method from UserKeyword.py
    create_folder   ${foldername}
    create_sub_folder   ${subfoldername}
    Log to Console  "Task done successfully"

#user defined keyword with args and return value using python code
Concatenate Username and Password
    [Arguments]     ${username}     ${password}
    ${result_val}=  concatenate_two_values  ${username}  ${password}
    log to console  ${result_val}
