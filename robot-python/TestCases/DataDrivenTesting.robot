*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/DataDrivenResource.robot


*** Variables ***
${URL}      https://www.thetestingworld.com/


*** Test Cases ***
Data Driven Testing
    open browser    ${URL}  Firefox
    maximize browser window
    click element   xpath://a[text()='Login']
    ${row}=  Read Number of rows   Sheet1
    log to console  ${row}
    FOR  ${i}  IN RANGE    1  ${row}+1
       ${username}=    Read Cell Data  Sheet1  ${i}   1
       ${password}=    Read Cell Data  Sheet1  ${i}   2
       input text  name:username   ${username}
       input text  name:password   ${password}
       click button   xpath://button[@type='submit']
       sleep   5s
    END

    close browser









