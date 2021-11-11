*** Settings ***
Library     ../ExternalFiles/DataDriven.py
Library     SeleniumLibrary

*** Variables ***



*** Keywords ***
Read Number of rows
    [Arguments]     ${Sheetname}
    ${maxr}=    fetch_number_of_rows    ${Sheetname}
    [Return]    ${maxr}

Read Cell Data
    [Arguments]     ${Sheetname}    ${row}  ${col}
    ${cell_data}=   fetch_cell_data     ${Sheetname}    ${row}  ${col}
    [Return]    ${cell_data}