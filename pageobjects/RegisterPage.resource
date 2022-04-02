*** Settings ***
Library           SeleniumLibrary

*** Keywords ***
Open Registerpage
    Open Browser    \    ${browser}
    Maximize Browser Window
    Go to    ${registerPage}

Input Subject Register
    [Arguments]    ${subject}
    Input Text    id: subjectsInput    ${subject}
    Click Element    xpath: (//div[text()="${subject}"])[2]

Fill Register Form
    [Arguments]    ${firstName}    ${lastName}    ${email}    ${gender}    ${mobile}    ${day}    ${month}    ${year}    ${subject}    ${hobby}    ${address}    ${state}    ${city}
    Input Text    id:firstName    ${firstName}
    Input Text    id:lastName    ${lastName}
    Input Text    id:userEmail    ${email}
    Click Element    xpath: //label[text()="Male"]
    Input Text    id:userNumber    ${mobile}
    Input Date of Birth    ${day}    ${month}    ${year}
    Input subject register    ${subject}
    Click Element    xpath: //label[text()="${hobby}"]
    Input Text    id: currentAddress    ${address}
    Execute Javascript    window.scrollTo(0,1500)
    Click Element    xpath: //div[@id="state"]/div
    Click Element    xpath: //div[@id="state"]/div[2]/div/div[text()="${state}"]
    Click Element    xpath: //div[@id="city"]/div
    Click Element    xpath: //div[@id="city"]/div[2]/div/div[text()="${city}"]

Check Register Infor
    [Arguments]    ${Name}    ${email}    ${gender}    ${mobile}    ${dob}    ${subject}    ${hobby}    ${address}    ${state&city}
    Element Text Should Be    xpath: (//tbody/tr/td[text()="Student Name"] /following :: td) [1]    ${Name}
    Element Text Should Be    xpath: (//tbody/tr/td[text()="Student Email"] /following :: td) [1]    ${email}
    Element Text Should Be    xpath: (//tbody/tr/td[text()="Gender"] /following :: td) [1]    ${gender}
    Element Text Should Be    xpath: (//tbody/tr/td[text()="Mobile"] /following :: td) [1]    ${mobile}
    Element Text Should Be    xpath: (//tbody/tr/td[text()="Date of Birth"] /following :: td) [1]    ${dob}
    Element Text Should Be    xpath: (//tbody/tr/td[text()="Subjects"] /following :: td) [1]    ${subject}
    Element Text Should Be    xpath: (//tbody/tr/td[text()="Hobbies"] /following :: td) [1]    ${hobby}
    Element Text Should Be    xpath: (//tbody/tr/td[text()="Address"] /following :: td) [1]    ${address}
    Element Text Should Be    xpath: (//tbody/tr/td[text()="State and City"] /following :: td) [1]    ${state&city}

Input Date of Birth
    [Arguments]    ${day}    ${month}    ${year}
    Click Element    id: dateOfBirthInput
    Click Element    xpath: //option[@value="${year}"]
    Click Element    xpath: //option[text()="${month}"]
    Click Element    css: div .react-datepicker__day--0${day}

Click On Submit Button
    Click Button    id: submit

Verify Submit Successfully
    Element Text Should Be    id: example-modal-sizes-title-lg    Thanks for submitting the form
