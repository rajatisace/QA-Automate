*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/LoginVar.robot


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

Input Data for login Fail
    # ใช้คำสั่ง        ส่ง locator         ส่งข้อความ text
    Wait Until Element Is Visible        ${locator_email}
    Input Text                      ${locator_email}    userAutomate@krupbeam.com
    Input Text                      ${locator_pass}     123456789
    Click Element                   ${locator_btn}

Input data for login email Fail
    Wait Until Element Is Visible    ${locator_email}
    Input Text                       ${locator_email}    user.test@.com
    Input Text                       ${locator_pass}     123456789
    Click Element                    ${locator_btn}

Input data for login password Fail
    Wait Until Element Is Visible    ${locator_email}
    Input Text                       ${locator_email}    user.test@krupebeam.com
    Input Text                       ${locator_pass}     122
    Click Element                    ${locator_btn}

Input Data for login require Field
    Wait Until Element Is Visible    ${locator_email}
    Input Text                       ${locator_email}    ${EMPTY}
    Input Text                       ${locator_pass}     ${EMPTY}
    Click Element                    ${locator_btn}