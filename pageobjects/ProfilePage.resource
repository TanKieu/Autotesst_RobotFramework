*** Settings ***
Library           SeleniumLibrary
Resource          Share/common.resource
Resource          BookStore.resource

*** Keywords ***
Delete Book
    [Arguments]    ${book_name}
    Input Text    id: searchBox    ${book_name}
    Click Element    id: delete-record-undefined
    Click Element    id: closeSmallModal-ok
    Alert Should Be Present    Book deleted.

Find Book
    [Arguments]    ${book_name}
    Input Text    id: searchBox    ${book_name}

Click On Delete Icon
    Click Element    id: delete-record-undefined

Close Message
    Click Element    id: closeSmallModal-ok

Verify Delete Successfully
    [Arguments]    ${book_name}
    Alert Should Be Present    Book deleted.
    Element Should Not Be Visible    xpath: //a[text()="${book_name}"]
