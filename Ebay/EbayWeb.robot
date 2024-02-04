*** Settings ***
Library           SeleniumLibrary
Resource          ${CURDIR}/EbayWebVar.robot
Resource          ${CURDIR}/EbayWebKey.robot
Suite Setup       Set Selenium Speed    0.5s
Test Setup        Open Ebay browser
Test Teardown     Close Browser
Suite Teardown    Close All Browsers
Default Tags      Pass


*** Test Cases ***
Verify input text - key
    [Documentation]    ตรวจสอบการกรอกข้อมูล
    [Tags]    error
    Verify input Search Data - press key

Verify input text - btn
    Verify input Search Data - click button

Verify Result Data
    Verify input Search Data - press key
    Wait Until Element Is Visible       ${locator_resultNumber}
    Verify Result Data                  ${locator_resultNumber}
    

Verify Result - Checkbox Brand
    Verify input Search Data - click button
    Wait Until Element Is Visible       ${locator_resultNumber}
    Select Checkbox                     ${locator_checkboxBrand}
    Verify Result Data                  ${locator_resultNumber}

Verify Result - Checkbox Condition
    Verify input Search Data - press key
    Wait Until Element Is Visible       ${locator_resultNumber}
    Select Checkbox                     ${locator_checkboxCondition}
    Verify Result Data                  ${locator_resultNumber}
    

Verify Result -Checkbox Price
    Verify input Search Data - press key
    Wait Until Element Is Visible       ${locator_resultNumber}
    Select Checkbox                     ${locator_checkboxPrice}
    Verify Result Data                  ${locator_resultNumber}

Verify Result Data to Keywords
    [Documentation]    ตรวจสอบการกรอกหลายข้อมูล
    [Tags]    temp
    [Setup]
    [Template]    Verify input Search Data - press key Template
    iphone
    huawei
    samsung
    Oppo
    [Teardown]
