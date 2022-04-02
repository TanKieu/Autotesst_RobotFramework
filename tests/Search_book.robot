*** Settings ***
Suite Setup       Open Book Store page
Suite Teardown    Close Browser
Test Template     Search
Library           SeleniumLibrary
Resource          ../pageobjects/Share/common.resource
Library           DataDriver    file=../Testdata/search_data.xlsx
Resource          ../pageobjects/BookStore.resource

*** Test Cases ***    name
Search Book With Design In Name
                      ${name}

*** Keywords ***
Search
    [Arguments]    ${name}
    Input Keyword    ${name}
    Verify Search Result    ${name}
