*** Settings ***
Library     SeleniumLibrary
Library     Collections

*** Variables ***
${var1}     https://www.thetestingworld.com/
${var2}     https://www.google.com
${var3}     https://robotframework.org/

*** Test Cases ***
Handle Multiple Browser
    open browser    ${var1}     Firefox
    maximize browser window
    open browser    ${var2}     Firefox
    maximize browser window
    #Switches between active browsers using index_or_alias.
    switch browser  1
    ${url1}=    get location
    log to console  ${url1}
    click link  xpath://a[text()='Login']
    #Switches between active browsers using index_or_alias.
    switch browser   2
    ${url2}=    get location
    log to console  ${url2}
    input text  name:q      Hello World
    close all browsers

Handle Multuple Tabs
    open browser    ${var3}     Firefox
    maximize browser window
    click element   xpath://a[text()='Installation instructions']
    #get window handles Returns all child window handles of the selected browser as a list. o/p:- @{list1} = [ 8356181e-8000-4680-aa8b-1af61aa57324 ]
    @{list1}    get window handles
    #syntax of for loop
    FOR   ${win}  IN  @{list1}
        log to console     ${win}
    END