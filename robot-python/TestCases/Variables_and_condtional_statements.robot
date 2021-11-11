*** Settings ***
Library     SeleniumLibrary
Library     Collections

*** Variables ***


*** Test Cases ***
Vaiable Test
    ${var1}=    set variable    Hello World
    Log to Console  ${var1}

Creating List Variable Test
    @{list1}    create list     Hello   22  23.23   World   Abcd124
    ${list_length}  get length  ${list1}
    Log to Console  ${list_length}
    ${list_data}    get from list   ${list1}    2
    Log to Console  ${list_data}
    :for    ${i}     IN    @{list1}
    \   log to console  ${i}

Create For Loop and prining
    : FOR    ${i}    IN RANGE    1   10
    \   log to console  ${i}

Run keyword stored into variable
    ${key_var}=     set variable    log to console
    run keyword     ${key_var}      TestingWorld@gmail.com

Run keyword conditionally
    ${key_var1}=    set variable    NO
    run keyword if      '${key_var1}'=='YES'   log to console  Value Found
    run keyword if      '${key_var1}'=='NO'   log to console  Value Not Found
*** Keywords ***