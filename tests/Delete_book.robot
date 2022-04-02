*** Settings ***
Suite Setup       Open Book Store page
Suite Teardown    Close Browser
Test Setup        Login    ${username}    ${password}
Test Teardown     Logout
Test Template     Delete
Library           SeleniumLibrary
Resource          ../pageobjects/Share/common.resource
Library           DataDriver    file=../Testdata/delete_book_data.xlsx
Resource          ../pageobjects/ProfilePage.resource

*** Test Cases ***    book_name
Delete Book           ${book_name}

*** Keywords ***
Delete
    [Arguments]    ${book_name}
    Add Book To Profile    ${book_name}
    Go to    ${home}/profile
    Find Book    ${book_name}
    Click On Delete Icon
    Close Message
    Verify Delete Successfully    ${book_name}
