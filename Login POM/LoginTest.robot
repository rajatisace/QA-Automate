*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/LoginVar.robot
Resource    ${CURDIR}/LoginKey.robot



*** Test Cases ***
TC000-Show default page
    Open web browser
    Wait Until Page Contains    Welcome to Kru P' Beam! 👋🏻
    Close Browser

TC001-login pass
    Open web browser
    Input Data for login Pass
    Wait Until Page Contains    Search Filters
    Close Browser

TC002-Login Fail
    Open web browser
    Input Data for login Fail
    ${txt}    Get Text    ${locator_err_email}
    Should Be Equal As Strings    ${txt}    Email or Password is invalid
    Close Browser

T003-Login Web Kru P'Beam Input email fail
    Open web browser
    Input data for login email Fail
    ${txt}    Get Text    ${locator_err_email}
    Should Be Equal As Strings    ${txt}    email must be a valid email
    Close Browser

TC004 Login Web Kru P'Beam Password Fail
    Open web browser
    Input data for login password Fail
    ${txt}    Get Text    ${locator_err_pass}
    Should Be Equal As Strings    ${txt}    password must be at least 5 characters
    Close Browser

TC005 Verify Login Web Kru P'Beam required Field
    Open web browser
    Input Data for login require Field
    ${txt}    Get Text    ${locator_err_email}
    Should Be Equal As Strings    ${txt}    email is a required field
    Close Browser

TC006-Verify Login Web Kru P'Beam Register
    Open web browser
    Wait Until Element Is Visible    ${locator_register}    5s
    Click Element    ${locator_register}
    Wait Until Page Contains    Kru P' Beam    5s
    Close Browser
