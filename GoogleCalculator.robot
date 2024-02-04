*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Speed    0.5s
Test Setup    Open Web Browser
Test Teardown    Close Browser

*** Variables ***
${url}                    https://www.google.com/
${browser}                gc
${locator_inputSearch}    name=q
${locator_no2}            xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[2]/div/div
${locator_no4}            xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[1]/div/div
${locator_plus}           xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[4]/div/div
${locator_minus}          xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[4]/div/div
${locator_multi}          xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[4]/div/div
${locator_div}            xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[2]/td[4]/div/div
${locator_eq}             xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[3]/div/div
${locator_result}         id=cwos

*** Keywords ***
Open Web Browser
    [Documentation]    ทำการเปิด webbrowser
    [Tags]    OpenBrowser
    # เรียกใช้คำสั่ง Open Browser เพื่อทำการเปิด Google Chrome     
    # โดยการส่ง       url และ   ชื่อ browser ที่จะใช้
    Open Browser    ${url}    ${browser}
    #ใช้คำสั่งเพื่อทำการขยายหน้าเว็บ
    Maximize Browser Window

Input Keywords for Search
    [Documentation]    ใช้สำหรับกรอก Keyword ที่ต้องการค้นหา
    [Tags]    Search
    #รอจนกว่า search input Field จะแสดงยังหน้าจอของ Website 
    Wait Until Element Is Visible    ${locator_inputSearch}
    # ทำการกรอกข้อมูลที่ต้องการค้นหาลงไปในตัวของ Search input Field 
    Input Text    ${locator_inputSearch}    calculator
    # สั่งให้ตัวของโปรแกรมกด Enter อัตโนมัติ
    Press Keys    ${locator_inputSearch}    ENTER
    # รอจนกว่าหน้าจอจะแสดงคำว่า Calculator
    Wait Until Page Contains    calculator

Verify Check Result Calculator - Plus
    [Documentation]    ใช้สำหรับการบวก +
    [Tags]             plus
    # ให้ทำการกดปุ่ม เลข 4 ในหน้า website
    Click Element    ${locator_no4}
    # ให้ทำการกดปุ่ม + ในหน้า website
    Click Element    ${locator_plus}
    # ให้ทำการกดปุ่ม เลข 2 ในหน้า website
    Click Element    ${locator_no2}
    # ให้ทำการกดปุ่ม = ในหน้า website
    Click Element    ${locator_eq}
    # ทำการดึงข้อมูลผลัพธ์ที่ได้มาเก็บไว้ในตัวแปรที่ชื่อว่า ans
    ${ans}    Get Text    ${locator_result}
    #ทำการตรวจสอบค่าผลลัพธ์ที่ได้โดยการเทียบกับคำตอบที่ถูกต้อง 
    Should Be Equal As Integers    ${ans}    6

Verify Check Result Calculator - Minus
    [Documentation]    ใช้สำหรับการลบ - 
    [Tags]             minus
    # ให้ทำการกดปุ่ม เลข 4 ในหน้า website
    Click Element    ${locator_no4}
    # ให้ทำการกดปุ่ม - ในหน้า website
    Click Element    ${locator_minus}
    # ให้ทำการกดปุ่ม เลข 2 ในหน้า website
    Click Element    ${locator_no2}
    # ให้ทำการกดปุ่ม = ในหน้า website
    Click Element    ${locator_eq}
    # ทำการดึงข้อมูลผลัพธ์ที่ได้มาเก็บไว้ในตัวแปรที่ชื่อว่า ans
    ${ans}    Get Text    ${locator_result}
    #ทำการตรวจสอบค่าผลลัพธ์ที่ได้โดยการเทียบกับคำตอบที่ถูกต้อง 
    Should Be Equal As Integers    ${ans}    2


Verify Check Result Calculator - Multi
    [Documentation]    ใช้สำหรับการคูณ *
    [Tags]             multi
    # ให้ทำการกดปุ่ม เลข 4 ในหน้า website
    Click Element    ${locator_no4}
    # ให้ทำการกดปุ่ม x ในหน้า website
    Click Element    ${locator_multi}
    # ให้ทำการกดปุ่ม เลข 2 ในหน้า website
    Click Element    ${locator_no2}
    # ให้ทำการกดปุ่ม = ในหน้า website
    Click Element    ${locator_eq}
    # ทำการดึงข้อมูลผลัพธ์ที่ได้มาเก็บไว้ในตัวแปรที่ชื่อว่า ans
    ${ans}    Get Text    ${locator_result}
    #ทำการตรวจสอบค่าผลลัพธ์ที่ได้โดยการเทียบกับคำตอบที่ถูกต้อง 
    Should Be Equal As Integers    ${ans}    8


Verify Check Result Calculator - Divide
    [Documentation]    ใช้สำหรับการหาร /
    [Tags]             divide
    # ให้ทำการกดปุ่ม เลข 4 ในหน้า website
    Click Element    ${locator_no4}
    # ให้ทำการกดปุ่ม / ในหน้า website
    Click Element    ${locator_div}
    # ให้ทำการกดปุ่ม เลข 2 ในหน้า website
    Click Element    ${locator_no2}
    # ให้ทำการกดปุ่ม = ในหน้า website
    Click Element    ${locator_eq}
    # ทำการดึงข้อมูลผลัพธ์ที่ได้มาเก็บไว้ในตัวแปรที่ชื่อว่า ans
    ${ans}    Get Text    ${locator_result}
    #ทำการตรวจสอบค่าผลลัพธ์ที่ได้โดยการเทียบกับคำตอบที่ถูกต้อง 
    Should Be Equal As Integers    ${ans}    2


*** Test Cases ***
Verify Open Web Browser
    [Documentation]    ทดสอบการเปิด webbrowser
    Input Keywords for Search


Verify Check Result Calculator - Plus
    [Documentation]    ทดสอบการคำนวณตัวเลข Case บวก
    Input Keywords for Search
    Verify Check Result Calculator - Plus

Verify Check Result Calculator - Minus
    [Documentation]    ทดสอบการคำนวณตัวเลข Case ลบ
    Input Keywords for Search
    Verify Check Result Calculator - Minus

Verify Check Result Calculator - Multi
    [Documentation]    ทดสอบการคำนวณตัวเลข Case คูณ
    Input Keywords for Search
    Verify Check Result Calculator - Multi

Verify Check Result Calculator - Div
    [Documentation]    ทดสอบการคำนวณตัวเลข Case หาร
    Input Keywords for Search
    Verify Check Result Calculator - Divide
