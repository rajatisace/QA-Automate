*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/EbayWebVar.robot


*** Keywords ***
Open Ebay browser
    Open Browser                         ${url}               ${browser}
    Maximize Browser Window
    Wait Until Element Is Enabled        ${locator_search}

Verify input Search Data - press key
    Wait Until Element Is Visible        ${locator_search}
    Input Text                           ${locator_search}        iphone
    Select Category
    Press Keys                           ${locator_search}        ENTER


Verify input Search Data - click button
    Wait Until Element Is Visible        ${locator_search}
    Input Text                           ${locator_search}        iphone
    Select Category
    Click Element                        ${locator_searchbtn}

Select Category
    Wait Until Element Is Visible        ${locator_cat_list}
    Click Element                        ${locator_cat_list}
    Select From List By Value            ${locator_cat_list}      58058

Select Product
    Wait Until Element Is Visible        ${locator_productname}
    Click Element                        ${locator_productname}
    Wait Until Page Contains             SD Card Reader,3in1 Memory Card Reader for iPhone/iPad
    Close Browser

Select Product2
    Wait Until Element Is Visible        ${locator_productname2}
    Click Element                        ${locator_productname2}
    Wait Until Page Contains             Apple 29W USB-C Power Adapter Charger for MacBook
    Close Browser

Verify Result Data
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
    ${num}    Get Text    ${locator}
    IF  ${num}>0
        Log To Console    PASS
    END

Verify input Search Data - press key Template
    [Arguments]    ${txt}
    Open Ebay browser
    Wait Until Element Is Visible        ${locator_search}
    Input Text                           ${locator_search}        ${txt}
    Select Category
    Press Keys                           ${locator_search}        ENTER
    Close Browser