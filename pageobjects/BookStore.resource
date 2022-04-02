*** Settings ***
Library           SeleniumLibrary
Library           String

*** Keywords ***
Open Book Store page
    Open Browser    \    ${browser}
    Maximize Browser Window
    Go To    ${home}/books

Verify Add Book Successfully
    [Arguments]    ${book_name}
    Alert Should Be Present    Book added to your collection.
    Go To    ${home}/profile
    Element Should Be Visible    xpath: //a[text()="${book_name}"]

Click On Book Link
    [Arguments]    ${book_name}
    Click Element    xpath: //a[text()="${bookName}"]

Click On Add Book To Collection Button
    [Arguments]    ${book_name}
    Execute Javascript    window.scrollTo(0,1500)
    Click Button    xpath: //button[text()="Add To Your Collection"]

Add Book To Profile
    [Arguments]    ${book_name}
    Wait Until Element Is Visible    xpath: //a[text()="${bookName}"]
    Click Element    xpath: \ //a[text()="${bookName}"]
    Execute Javascript    window.scrollTo(0,1500)
    Click Button    xpath: //button[text()="Add To Your Collection"]
    Alert Should Be Present    Book added to your collection.

Input Keyword
    [Arguments]    ${name}
    Input Text    id: searchBox    ${name}

Verify Search Result
    [Arguments]    ${name}
    ${search_results}=    Get WebElements    xpath= //div[@class="rt-tbody"]//a
    FOR    ${result}    IN    @{search_results}
        ${text}=    Get Text    ${result}
        Should Contain    ${text}    ${name}    ignore_case=True
    END
