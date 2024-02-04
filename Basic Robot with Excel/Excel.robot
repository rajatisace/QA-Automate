*** Settings ***
Library    ExcelRobot
Library    SeleniumLibrary

*** Variables ***
${path}    ${EXECDIR}/Book1.xls
${sheetName}    Sheet1
${url}                  https://automate-test.stpb-digital.com/login/
${browser}              gc
${locator_email}        id=email
${locator_pass}         name=password
${locator_btn}          id=btn-login
${locator_register}     xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[4]/p[2]/a
${locator_err_email}    xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[1]/p
${locator_err_pass}     xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[2]/p

*** Keywords ***
Open Web browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input data for Test login
    [Arguments]    ${user}    ${pass}    ${msg}
    Open Web browser
    Wait Until Element Is Visible    ${locator_email}
    Input Text                      ${locator_email}    ${user}
    Input Text                      ${locator_pass}     ${pass}
    Click Element                   ${locator_btn}
    ${txt}    Get Text    ${locator_err_email}
    Should Be Equal As Strings    ${txt}    ${msg}
    Close Browser


Get data from excel
    Open Excel    ${path}
    #นับจำนวนแถว
    ${rowcount}    Get Row Count    ${sheetName}
    FOR  ${item}  IN RANGE    0    ${rowcount}
        ${user}    Read Cell Data    ${sheetName}    0    ${item}
        ${pass}    Read Cell Data    ${sheetName}    1    ${item}
        ${msg}    Read Cell Data    ${sheetName}     2    ${item}
        Input data for Test login    ${user}    ${pass}    ${msg}
    END
    
*** Test Cases ***
Test run
    Get data from excel