*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}         http://the-internet.herokuapp.com/basic_auth
${browser}     gc
${username}    admin
${password}    admin

*** Keywords ***
Open Authentication
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Sentdata
    #เรียกใช้คำสั่งไปยัง Url          ใส่ url    Username    pass    เชื่อมด้วย @ แล้วตามด้วยชื่อ Website 
    Go To                       http://${username}:${password}@the-internet.herokuapp.com/basic_auth
    Wait Until Page Contains    Congratulations
    Close Browser

*** Test Cases ***
Verify Authentication
    Open Authentication
    Sentdata
