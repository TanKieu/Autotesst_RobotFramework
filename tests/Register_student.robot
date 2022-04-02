*** Settings ***
Suite Setup       Open registerPage
Suite Teardown    Close Browser
Test Template     Successfull Register
Library           SeleniumLibrary
Resource          ../pageobjects/Share/common.resource
Library           DataDriver    file=../Testdata/register_data.xlsx
Resource          ../pageobjects/RegisterPage.resource

*** Test Cases ***    first_name       last_name       full_name       email       gender       mobile       day_of_birth       month_of_birth       year_of_birth       dob       subject       hobby       address       state       city       state&city
Register Student      ${first_name}    ${last_name}    ${full_name}    ${email}    ${gender}    ${mobile}    ${day_of_birth}    ${month_of_birth}    ${year_of_birth}    ${dob}    ${subject}    ${hobby}    ${address}    ${state}    ${city}    ${state&city}

*** Keywords ***
Successfull Register
    [Arguments]    ${first_name}    ${last_name}    ${full_name}    ${email}    ${gender}    ${mobile}    ${day_of_birth}    ${month_of_birth}    ${year_of_birth}    ${dob}    ${subject}    ${hobby}    ${address}    ${state}    ${city}    ${state&city}
    Fill Register Form    ${first_name}    ${last_name}    ${email}    ${gender}    ${mobile}    ${day_of_birth}    ${month_of_birth}    ${year_of_birth}    ${subject}    ${hobby}    ${address}    ${state}    ${city}
    Click On Submit Button
    Verify Submit Successfully
    Check Register Infor    ${full_name}    ${email}    ${gender}    ${mobile}    ${dob}    ${subject}    ${hobby}    ${address}    ${state&city}
