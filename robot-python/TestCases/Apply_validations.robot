*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${var1}     https://www.thetestingworld.com/
${var2}     https://www.thetestingworld.com/testings/

*** Test Cases ***
Page Contains and Page should not contains
    open browser    ${var1}     Firefox
    maximize browser window
    #Verifies that current page contains text
    page should contain     VIDEOS
    #erifies the current page does not contain text.
    page should not contain     VIDEOS11
    click element   xpath://a[text()='Login']
    #Verifies text field locator is found from current page .Current page contains text field 'name:username'.
    page should contain textfield  name:username
    #Verifies text field locator is not found from current page.Current page does not contain text field 'name:username11'.
    page should not contain textfield   name:username11
    input text  name:username   testingworld@gmail.com
    #Selects the checkbox identified by locator.	Selecting checkbox 'name:remember'
    select checkbox     name:remember
    #Verifies checkbox locator is selected/checked.Verifying checkbox 'name:remember' is selected.
    checkbox should be selected     name:remember
    #Click the element identified by locator.Clicking element 'name:remember'.
    click element   name:remember
    #Verifies checkbox locator is not selected/checked.	Verifying checkbox 'name:remember' is not selected.
    checkbox should not be selected     name:remember
    close browser

Element text validation
    open browser    ${var2}     Firefox
    maximize browser window
    #Verifies that element locator contains exact the text expected.Verifying element 'xpath://div[@id='tab-content1']/p' contains exact text 'Register now and kick start your career as a Software Testing Pro!'.
    element text should be  xpath://div[@id='tab-content1']/p     Register now and kick start your career as a Software Testing Pro!
    #Verifies that element locator contains text expected.Element 'xpath://div[@id='tab-content1']/p' contains text 'Software Testing Pro!'.
    element should contain    xpath://div[@id='tab-content1']/p        Software Testing Pro!
    input text  name:fld_username   HelloWorld@gmail.com
    close browser

validate title and element enable and visible
    open browser    ${var2}     Firefox
    maximize browser window
    #Verifies that the current page title equals title.Page title is 'Login & Sign Up Forms'.
    title should be     Login & Sign Up Forms
    #Verifies that element identified by locator is enabled.
    element should be enabled   name:fld_username
    #Element with locator 'name:fld_username12' not found.
    #element should be disabled   name:fld_username12
    #Verifies that the element identified by locator is visible.Element 'name:fld_username' is displayed.
    element should be visible   name:fld_username

