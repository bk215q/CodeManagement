*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${Browser}  Firefox
${URL}  https://www.thetestingworld.com/testings/
${URL1}  https://www.thetestingworld.com/

*** Test Cases ***
Browser_Start_Login_and_Close
    Open Browser    ${URL}  ${Browser}
    #Maximizes current browser window
    Maximize Browser Window
    #Sets the delay that is waited after each Selenium command
    #Sleep   10 seconds
    #fetches the selenium speed ,dafault:- 0s
#    ${speed}=       get selenium speed
#    log to console  ${speed}
#    Set Selenium Speed  1 seconds
    #Sets the timeout that is used by various keywords.
#    set selenium timeout    20 seconds
#    #Gets the timeout that is used by various keywords.
#    ${tm}   get selenium timeout
#    log to console  ${tm}
    ${default_tm}   get selenium implicit wait
    log to console  ${default_tm}
    #Sets the implicit wait value used by Selenium. If the value is found in first 5 seconds then it'll not wait for rest 15s and will go to the next line
    set selenium implicit wait  20 seconds
    ${default_tm}   get selenium implicit wait
    log to console  ${default_tm}
    #Waits until text appears on the current page.
    wait until page contains    Testing
    #calling the user-defined keyword with 4 args
    Enter Username Email and Password   Testing     bishalsaha623@gmail.com     Abcv54#     Abcv54#
    #clicking radio button we need group i.e add_type here and value i.e home/office.Sets the radio button group group_name to value.
    Select Radio Button  add_type   home
    #selects the checkbox identified by locator
    Select CheckBox  name:terms
    #click Link
    #Click Link      xpath://a[text()='Read Detail']
    #Clicks the button identified by locator.
    Click Button    xpath://input[@type='submit' and @value='Sign up']
    #to clear the inserted text
    #Clear Element Text  name:fld_username
    #work with list and dropdown .In dropdown you can select only 1 value but in list we can select more than one value
    #but automating list or dropdown in ronotframework follows the same approach
    #Selects options from selection list locator by indexes.
    Select From List By Index   name:sex    2
    #Get Selected List Value Returns the value of selected option from selection list locator.o/p :-${list_val1} = 2
    ${list_val1}=   Get Selected List Value     name:sex
    log to console    ${list_val1}
    #Selects options from selection list locator by values.
    Select From List By Value   name:sex    1
    #Selecting options from selection list 'name:sex' by label Female.
    Select From List By Label   name:sex    Female
    #Get Selected List Label Returns the label of selected option from selection list locator.o/p :-${list_val2} = Female
    ${list_val2}=   Get Selected List Label     name:sex
    log to console  ${list_val2}
    #Get List Items Returns all labels or values of selection list locator. o/p:-${All_labels} = ['Choose Gender', 'Male', 'Female']
    ${All_labels}=  Get List Items  name:sex
    log to console  ${All_labels}
#    ${speed}=       get selenium speed
#    log to console  ${speed}
    #Get Value will fetch the value of the xpath element at run time, Returns the value attribute of the element
    #identified by locator.o/p :- ${value} = Sign up
    ${value}=   Get Value   xpath://input[@type='submit']
    Log to console  ${value}
    #Get Text Returns the text value of the element identified by locator.o/p :-${text} = Read Detail
    ${text}=    Get Text    xpath://a[@class='displayPopup']
    Log     ${text}
    #used to captrue screenshot of the page
    capture page screenshot     ./../Snapshots/Browser_Start_Login_and_Close.png
    #Closes the current browser.
    Close Browser
    #close all browser

Browser Related Keywords
    open browser    ${URL}  ${Browser}
    #go to Navigates the current browser window to the provided url
    go to   https://google.com/
    #get location Returns the current browser window URL
    ${location}     get location
    log to console  ${location}
    #go back Simulates the user clicking the back button on their browser.
    go back
    ${location}     get location
    log to console  ${location}
    #Get Source Returns the entire HTML source of the current page or frame.o/p:- ${Page_HTML} = <html prefix="og: http://ogp.me/ns#" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-gb" slick-uniqueid="3" lang="en-gb"><head>
                                                                                      #
                                                                                      #    <script src="https://embed.tawk.to/_s/v4/app/618258f5439/js/twk-m...
    ${Page_HTML}=   Get Source
    Log to console   ${Page_HTML}
    #Get Element Attribute Returns the value of attribute from the element locator.o/p :- ${ele_attr} = field
    ${ele_attr}=    Get Element Attribute   name:fld_username   class
    log     ${ele_attr}
    #Get Element Count Returns the number of elements matching locator.o/p:- 	${ele_count} = 6
    ${ele_count}=   Get Element Count   class:field
    log to console  ${ele_count}
    close browser

Execute javascript at runtime
    open browser    ${URL1}  ${Browser}
    maximize browser window
    #Executes the given JavaScript code with possible arguments
    execute javascript  window.scrollTo(0,1000)
    sleep   2 seconds
    close browser

Mouse Operations
    open browser    ${URL1}  ${Browser}
    maximize browser window
    #Opens the context menu on the element identified by locator
    #open context menu   xpath://span[contains(text(),'VIDEOS')]
    #Double clicks the element identified by locator.
    #double click element    xpath://a[text()='Login']
    #Simulates releasing the left mouse button on the element locator.
    #mouse up    xpath://a[text()='Login'] #Simulating Mouse Up on element 'xpath://a[text()='Login']'.
    #Simulates pressing the left mouse button on the element locator.
    #mouse down  xpath://a[text()='Login'] #Simulating Mouse Down on element 'xpath://a[text()='Login']'.
    mouse over      xpath://span[contains(text(),'VIDEOS')]
    sleep   2 seconds
    click link  xpath://a[text()='Login']
    #Keyword 'SeleniumLibrary.Press Key' is deprecated. use `Press Keys` instead.
    #Simulates the user pressing key(s) to an element or on the active browser.
    press keys  name:username   hello #	Sending keys hello
    press keys   xpath://button[@type='submit']  \\13 #Sending key(s) ('\\13',) to xpath://button[@type='submit'] element.
                                                      #\\13 is the ASCII value of enter key in keyboard
    close browser

Wait keyword commands
    open browser    ${URL1}  ${Browser}
    maximize browser window
    #Waits until the element locator appears on the current page.
    #wait until page contains element    xpath://span[contains(text(),'VIDEOS')]
    #Click the element identified by locator.
    #click element   xpath://span[contains(text(),'VIDEOS')]
    #Waits until the element locator contains text.
    wait until element contains     xpath://a[text()='Login']   Login
    #Click the element identified by locator.
    click element   xpath://a[text()='Login'] #Clicking element 'xpath://a[text()='Login']'.



*** Keywords ***
Enter Username Email and Password
    [Arguments]     ${username}     ${email}        ${password}     ${cpassword}
    #Types the given text into the text field identified by locator.
    Input Text  name:fld_username   ${username}
    #used to insert text by xpath. Types the given text into the text field identified by locator.
    Input Text  xpath://input[@name='fld_email']    ${email}
    Input Text  name:fld_password   ${password}
    Input Text  name:fld_cpassword  ${cpassword}