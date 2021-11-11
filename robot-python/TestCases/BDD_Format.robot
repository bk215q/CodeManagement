*** Settings ***
Library     ../Resources/Keywords_Resource.robot


*** Variables ***
${url}      https://www.thetestingworld.com/testings/
${browser}  Firefox

*** Test Cases ***
Test Case in BDD Format
    Given Open Browser and Maximize   ${url}  ${browser}
    When Get the title of the page
    Then  Close Browser Window