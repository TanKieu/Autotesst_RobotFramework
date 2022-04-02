*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${registerPage}    https://demoqa.com/automation-practice-form
${browser}        chrome
${home}           https://demoqa.com
${username}       TanKieu
${password}       Tanne123!@#

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Click Button    id: login
    Element Should Be Visible    id: userForm
    Input Text    id: userName    ${username}
    Input Password    id: password    ${password}
    Click Button    id: login

Logout
    Click Button    id: submit
