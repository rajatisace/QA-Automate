*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/RegisterVar.robot
Resource    ${CURDIR}/RegisterKey.robot
Suite Setup    Set Selenium Speed    0.5s
Suite Teardown    Close All Browsers
Test Setup    Open Web Browser
Test Teardown    Close Browser


*** Test Cases ***
TC001- Input Data Pass
    [Documentation]    ใช้สำหรับทดสอบในกรณีกรอกข้อมูลถูกต้องครบถ้วน
    [Tags]    test pass
    Input Data for register pass

TC002-Reset Data
    [Documentation]    ใช้สำหรับทดสอบในกรณีล้างข้อมูล
    [Tags]    test fail
    Input Data for register
    Click Element    ${locator_resetbtn}

TC003-Verify case fail
    [Setup]
    [Documentation]    ใช้สำหรับทดสอบในกรณีกรอกข้อมูลไม่ครบถ้วน
    [Tags]    test
    [Template]    Input Data Fail - Test Template
    ${EMPTY}    Makoto        sorata@gmail.com    123456789    5555555    male    2    1    1    1    ${locator_err_fname}    This field is required
    Sorata    ${EMPTY}        sorata@gmail.com    123456789    5555555    male    2    1    1    1    ${locator_err_lname}    This field is required
    Sorata    Makoto          ${EMPTY}            123456789    5555555    male    2    1    1    1    ${locator_err_email}    This field is required
    Sorata    Makoto        sorata@gmail.com      ${EMPTY}     5555555    male    2    1    1    1    ${locator_err_pass}    This field is required
    Sorata    Makoto        sorata@gmail.com      123456789    ${EMPTY}   male    2    1    1    1    ${locator_err_phone}    This field is required
    Sorata    Makoto        sorata@gmail.com      123456789    5555555    emp     2    1    1    1    ${locator_err_gender}    This field is required 
    Sorata    Makoto        sorata@gmail.com      123456789    5555555    male    0    1    1    1    ${locator_err_check}    This field is required
    Sorata    Makoto        sorata@gmail.com      123456789    5555555    male    1    0    1    1    ${locator_err_role}    This field is required
    Sorata    Makoto        sorata@gmail.com      123456789    5555555    male    1    1    0    1    ${locator_err_nation}    This field is required
    Sorata    Makoto        sorata@gmail.com      123456789    5555555    male    1    1    1    0    ${locator_err_plan}    This field is required
    [Teardown]
