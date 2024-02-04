*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Speed    0.5

*** Variables ***
${url}    https://www.saucedemo.com/v1/index.html
${browser}    gc
${locator_user}    id=user-name
${locator_pass}    id=password
${locator_err_msg}    xpath=//*[@id="login_button_container"]/div/form/h3
${locator_btnlogin}    id=login-button

*** Keywords ***
Open web browser
    [Arguments]    ${link}    ${webbrowser}
    Open Browser    ${link}    ${webbrowser}
    Maximize Browser Window

input data
    #สร้าง Arguments 3 ตัวแปร 
    [Arguments]    ${user}    ${pass}    ${msg}
    # เปิด Browser
    Open web browser    ${url}    ${browser}
    # ตรวจสอบการแสดงช่องกรอกของ user
    Wait Until Element Is Visible    ${locator_user}
    # ตรวจสอบในส่วนของการกรอก password 
    Wait Until Element Is Visible    ${locator_pass}
    # กรอกข้อมูล User และ Pass 
    Input Text    ${locator_user}    ${user}
    Input Text    ${locator_pass}    ${pass}
    # กดปุ่ม Login
    Click Element    ${locator_btnlogin}
    # ตรวจสอบว่า msg แสดงผลมั้ย โดยรอให้ตำแหน่งของตัว Msg ปรากฎ
    Wait Until Element Is Visible    ${locator_err_msg}
    # รับข้อมูลจากเว็บไซต์ โดยดึงข้อมูลของ Error msg
    ${txt}    Get Text    ${locator_err_msg}
    # เปรียบเทียบค่าระหว่าง ข้อมูลใน Web กับ ข้อมูลในตัว Requirement 
    Should Be Equal As Strings    ${txt}    ${msg}
    # ปิด Browser 
    Close Browser


*** Test Cases ***
Verify input data fail
    [Template]    input data
    ${EMPTY}    ${EMPTY}    Epic sadface: Username is required
    ${EMPTY}    ${EMPTY}    Epic sadface: Username is required
    kkkkkkk     ${EMPTY}    Epic sadface: Password is required
    kkkkkkk     zzzzzzzz    Epic sadface: Username and password do not match any user in this service    
