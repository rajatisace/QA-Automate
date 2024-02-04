*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/RegisterVar.robot



*** Keywords ***
Open Web Browser
    Open Browser    ${url}    ${browser}
    Wait Until Page Contains    Kru P' Beam    5s
    Maximize Browser Window

Input Data for register pass
    Input Text                 ${locator_firstname}        Sorata
    Input Text                 ${locator_lastname}         Makoto
    Input Text                 ${locator_email}            testAutomate@gmail.com
    Input Text                 ${locator_password}         123456789
    Input Text                 ${locator_mobile}           05314587632
    Select Radio Button        ${locator_gender}           female
    Select Checkbox            ${locator_chkSQL}
    Select Checkbox            ${locator_chkTestMa}
    Select Checkbox            ${locator_chkTestAu1}
    Select Checkbox            ${locator_chkTestAu2}
    Select list role
    Select list nation
    Select list plan
    Click Element              ${locator_signup}
    Wait Until Page Contains    Register Success        5s
    Click Element               ${locator_btnok}
    Wait Until Page Contains    Welcome to Kru P' Beam! 👋🏻    5s
    Wait Until Element Is Visible    ${locator_email}    5s



Select list role
    Click Element                                       ${locator_select-role}
    Wait Until Element Is Visible                       ${locator_select-role-li}
    Click Element                                       ${locator_select-role-li}

Select list nation
    Click Element                                       ${locator_select-nation}
    Wait Until Element Is Visible                       ${locator_select-nation-li}
    Click Element                                       ${locator_select-nation-li}

Select list plan
    Click Element                                       ${locator_select-plan}
    Wait Until Element Is Visible                       ${locator_select-plan-li}
    Click Element                                       ${locator_select-plan-li}

Input Data for register
    Input Text                 ${locator_firstname}        Sorata
    Input Text                 ${locator_lastname}         Makoto
    Input Text                 ${locator_email}            testAutomate@gmail.com
    Input Text                 ${locator_password}         123456789
    Input Text                 ${locator_mobile}           05314587632
    Select Radio Button        ${locator_gender}           female
    Select Checkbox            ${locator_chkSQL}
    Select Checkbox            ${locator_chkTestMa}
    Select Checkbox            ${locator_chkTestAu1}
    Select Checkbox            ${locator_chkTestAu2}
    Select list role
    Select list nation
    Select list plan

Input Data Fail - Test Template
    [Arguments]    ${fname}    ${lname}    ${email}    ${pass}    ${mobile}    ${gender}    ${Checkbox}    ${role}    ${nation}    ${plan}    ${locator}    ${msg}
    Open Web Browser
    Input Text                 ${locator_firstname}        ${fname}
    Input Text                 ${locator_lastname}         ${lname}
    Input Text                 ${locator_email}            ${email}
    Input Text                 ${locator_password}         ${pass}
    Input Text                 ${locator_mobile}           ${mobile}

    IF  '${gender}' != 'emp'
        Select Radio Button        ${locator_gender}           ${gender}
    END
    IF  ${Checkbox} ==1
        Select Checkbox            ${locator_chkSQL}
    ELSE IF  ${Checkbox}==2
        Select Checkbox            ${locator_chkSQL}
        Select Checkbox            ${locator_chkTestMa}
    ELSE IF  ${Checkbox}==3
        Select Checkbox            ${locator_chkSQL}
        Select Checkbox            ${locator_chkTestMa}
        Select Checkbox            ${locator_chkTestAu1}
    ELSE IF  ${Checkbox}==4
        Select Checkbox            ${locator_chkSQL}
        Select Checkbox            ${locator_chkTestMa}
        Select Checkbox            ${locator_chkTestAu1}
        Select Checkbox            ${locator_chkTestAu2}
    END

    IF  ${role}==1
        Select list role
    END
    
    IF  ${nation}==1
        Select list nation
    END
    
    IF  ${plan}==1
        Select list plan
    END
    Click Element              ${locator_signup}
    Verify error msg    ${locator}    ${msg}
    Close Browser

Verify error msg 
    [Arguments]    ${locator}    ${msg}=${EMPTY}
    ${txt}                        Get Text    ${locator}
    Should Be Equal As Strings    ${txt}      ${msg}
