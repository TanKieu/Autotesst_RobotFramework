*** Settings ***
Suite Setup       Open Book Store page
Suite Teardown    Close Browser
Test Setup        Login    ${username}    ${password}
Test Teardown     Logout
Test Template     Successfull Add Book
Library           SeleniumLibrary
Resource          ../pageobjects/Share/common.resource
Library           DataDriver    file=../Testdata/add_book_data.xlsx
Resource          ../pageobjects/BookStore.resource
Resource          ../pageobjects/ProfilePage.resource

*** Test Cases ***    book_name
Add Book              ${book_name}

*** Keywords ***
Successfull Add Book
    [Arguments]    ${book_name}
    Wait Until Element Is Visible    xpath: //a[text()="${bookName}"]
    Click On Book Link    ${book_name}
    Click On Add Book To Collection Button    ${book_name}
    Verify Add Book Successfully    ${book_name}
    Delete Book    ${book_name}
