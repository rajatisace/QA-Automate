*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/LoginpageVar.robot


*** Keywords ***
Open web browser
    Set Selenium Speed    0.5s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input Data for login Pass
    # ใช้คำสั่ง        ส่ง locator         ส่งข้อความ text
    Wait Until Element Is Visible        ${locator_email}
    Input Text                      ${locator_email}    user.test@krupbeam.com
    Input Text                      ${locator_pass}     123456789
    Click Element                   ${locator_btn}

Verify error msg 
    [Arguments]    ${locator}    ${msg}=${EMPTY}
    ${txt}                        Get Text    ${locator}
    Should Be Equal As Strings    ${txt}      ${msg}


Input Data for login Fail - Template
    [Arguments]    ${email}    ${pass}    ${locator_err}    ${msg}
    Open web browser
    Wait Until Element Is Visible    ${locator_email}    5s
    Wait Until Element Is Visible    ${locator_pass}    5s
    Input Text    ${locator_email}    ${email}
    Input Text    ${locator_pass}    ${pass}
    Click Element    ${locator_btn}
    Verify error msg    ${locator_err}    ${msg}
    Close Browser