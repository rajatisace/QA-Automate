*** Settings ***
Library                SeleniumLibrary
Resource               ${CURDIR}/searchVariable.robot

*** Keywords ***
Open Web browser
    Open Browser      ${url}                ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible           ${login_locator}
    Wait Until Element Is Visible           ${password_locator}
    

login Page
    Input Text        ${login_locator}      ${login_email}
    Input Text        ${password_locator}   ${login_password}
    Click Element     ${login_btn}
    Wait Until Page Contains                Search Filters

Role Select
    [Arguments]      ${option}
    Click Element    ${locator_role}
    Wait Until Element Is Visible    ${select_role}${option}
    Click Element    ${select_role}${option}

Plan Select
    [Arguments]      ${option}
    Click Element    ${locator_plan}
    Wait Until Element Is Visible    ${select_plan}${option}
    Click Element    ${select_plan}${option}

Status Select
    [Arguments]      ${option}
    Click Element    ${locator_status}
    Wait Until Element Is Visible    ${select_status}${option}
    Click Element    ${select_status}${option}


Verify Role
    [Arguments]            ${msg}
    ${txt}    Get Text    ${role_check}
    Should Be Equal As Strings    ${txt}    ${msg}

Verify Plan
    [Arguments]            ${msg}
    ${txt}    Get Text    ${plan_check}
    Should Be Equal As Strings    ${txt}    ${msg}

Verify Status
    [Arguments]            ${msg}
    ${txt}    Get Text    ${status_check}
    Should Be Equal As Strings    ${txt}    ${msg}

Verify zero
    Role Select        1
    Plan Select        2
    Status Select      2
    Click Element      ${search_btn}
    Click Element      ${locator_clearbtn}
    ${txt}    Get Text    ${result_number}
    Should Be Equal As Strings    ${txt}    0–0 of 0
    
List Select
    Open Web browser
    login Page
    [Arguments]    ${role}        ${plan}        ${status}
    Role Select                   ${role}
    Plan Select                   ${plan}
    Status Select                 ${status}
    Click Element    ${search_btn}
    IF  ${role}!=0
        Verify Role        Admin
    END

    IF  ${plan}!=0
        Verify Plan        Company
    END

    IF  ${status}!=0
        Verify Status      Active
    END
    
    Close Browser
    

Select List SQL
    Click Element                    ${locator_select-role}
    Wait Until Element Is Visible    ${locator_select-role-li}
    Click Element                    ${locator_select-role-li}

Select List Nationality
    Click Element                     ${locator_nationality}
    Wait Until Element Is Visible     ${locator_selectnation}    5s
    Click Element                     ${locator_selectnation}

Select list Plan
    Click Element                    ${locator_select-Plan}
    Wait Until Element Is Visible    ${locator_select-Plan2}    5s
    Click Element                    ${locator_select-Plan2}

Verify error msg 
    [Arguments]    ${locator}    ${msg}=${EMPTY}
    ${txt}    Get Text    ${locator}
    Should Be Equal As Strings    ${txt}    ${msg}

Input data
    Input Text             ${locator_firstname}    กนกนวล     
    Input Text             ${locator_lastname}     อินขาน
    Input Text             ${locator_email}        textAutomate@gmail.com
    Input Text             ${locator_password}     12345678
    Input Text             ${locator_mobile}       000000000

Input data for register pass
    Input Text             ${locator_firstname}    กนกนวล     
    Input Text             ${locator_lastname}     อินขาน
    Input Text             ${locator_email}        textAutomate@gmail.com
    Input Text             ${locator_password}     12345678
    Input Text             ${locator_mobile}       000000000
    Select Radio Button    ${locator_radio}       female
    Select Checkbox        ${locator_chkSQL}
    Select Checkbox        ${locator_chkManual}
    Select Checkbox        ${locator_chkAutomate}
    Select List Nationality
    Select List SQL
    Select list Plan

Verify Reset
    FOR  ${data}  IN  ${locator_firstname}    ${locator_lastname}    ${locator_email}    ${locator_password}    ${locator_mobile}
    ${txt}    Get Text    ${data}
    Should Be Equal As Strings    ${txt}    ${EMPTY}
    END
    
    ${txt}                Get Text                  ${locator_lastname}
    Should Be Equal As Strings    ${txt}            ${EMPTY}


Input data fail - Test Template
    Open Web browser
    login Page
    Click Element                               ${locator_addUser}
    Wait Until Page Contains                    Kru P' Beam
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${mobile}    ${gender}    ${checkbox}    ${nation}    ${role}    ${plan}    ${locator}    ${msg}
    Input Text             ${locator_firstname}    ${firstname}     
    Input Text             ${locator_lastname}     ${lastname}
    Input Text             ${locator_email}        ${email}
    Input Text             ${locator_password}     ${password}
    Input Text             ${locator_mobile}       ${mobile}

    IF  "${gender}" != "emp"
        Select Radio Button    ${locator_radio}       ${gender}
    END
    

    IF  ${checkbox} == 1
        Select Checkbox        ${locator_chkSQL}
    ELSE IF  ${checkbox} == 2
        Select Checkbox        ${locator_chkSQL}
        Select Checkbox        ${locator_chkManual}
    ELSE IF  ${checkbox} == 3
        Select Checkbox        ${locator_chkSQL}
        Select Checkbox        ${locator_chkManual}
        Select Checkbox        ${locator_chkAutomate}
    ELSE IF  ${checkbox} == 4
        Select Checkbox        ${locator_chkSQL}
        Select Checkbox        ${locator_chkManual}
        Select Checkbox        ${locator_chkAutomate}
        Select Checkbox        ${locator_chkAutomate2}
    END

    IF  ${nation} == 1
        Select List Nationality
    END

    IF  ${role} == 1
        Select List SQL
    END

    IF  ${plan} == 1
        Select list Plan
    END
    Click Element          ${locator_btn-signup}
    Verify error msg       ${locator}    ${msg}
    Close Browser


Verify Row
    [Arguments]    ${num}
    ${txt}    Get Text    ${locator_of53}
    Should Be Equal As Strings    ${txt}    1–${num} of 53

Select Row
    [Arguments]    ${num}
    Open Web browser
    login Page
    Click Element                    ${search_btn}
    IF  ${num}==10
        Click Element                    ${locator_rownumbtn}
        Wait Until Element Is Visible    ${locator_rownum10}
        Click Element                    ${locator_rownum10}
        Verify Row                       ${num}
    END

    IF  ${num}==25
        Click Element                    ${locator_rownumbtn}
        Wait Until Element Is Visible    ${locator_rownum25}
        Click Element                    ${locator_rownum25}
        Verify Row                       ${num}
    END

    IF  ${num}==50
        Click Element                    ${locator_rownumbtn}
        Wait Until Element Is Visible    ${locator_rownum50}
        Click Element                    ${locator_rownum50}
        Verify Row                       ${num}
    END
    Close Browser
    
Verify Page
    Click Element                            ${search_btn}
    Click Element                            ${locator_nextpg}
    Wait Until Element Is Visible            ${locator_firstUser}
    ${txt}    Get Text                       ${locator_firstUser}
    Should Be Equal As Strings    ${txt}        Jonah Wharlton
    Click Element                            ${locator_prevpg}
    Wait Until Element Is Visible            ${locator_firstUser}
    ${txt1}    Get Text                       ${locator_firstUser}
    Should Be Equal As Strings    ${txt1}        Galen Slixby