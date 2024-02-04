*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/LoginpageVar.robot
Resource    ${CURDIR}/LoginpageKey.robot
Suite Setup    Set Selenium Speed    0.5s
Test Setup    Open web browser
Test Teardown    Close Browser
Suite Teardown    Close All Browsers

*** Test Cases ***
TC_login Pass
    [Documentation]    ใช้สำหรับหน้าจอ Login Pass
    [Tags]    login pass
    Input Data for login Pass
    
TC_Login Fail
    [Documentation]    ใช้สำหรับหน้าจอ Login Fail
    [Tags]    login fail
    [Setup]
    [Template]    Input Data for login Fail - Template
    userAutomate@krupbeam.com    123456789    ${locator_err_email}    Email or Password is invalid
    user.test@.com               123456789    ${locator_err_email}    email must be a valid email
    user.test@krupebeam.com      122          ${locator_err_pass}         password must be at least 5 characters
    ${EMPTY}                     ${EMPTY}     ${locator_err_email}    email is a required field
    [Teardown]
    
TC_Verify Login Web Kru P'Beam Register
    [Documentation]    ใช้สำหรับหน้าจอไปยังหน้า Register 
    [Tags]    register
    Wait Until Element Is Visible    ${locator_register}    5s
    Click Element    ${locator_register}
    Wait Until Page Contains    Kru P' Beam    5s