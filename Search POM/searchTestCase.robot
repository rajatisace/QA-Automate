*** Settings ***
Library                    SeleniumLibrary
Resource                   ${CURDIR}/searchVariable.robot
Resource                   ${CURDIR}/searchKeyword.robot
Suite Setup                Set Selenium Speed    0.5
Suite Teardown             Close All Browsers
Test Setup                 Open Web browser
Test Teardown              Close Browser

*** Test Cases ***
TC001-Login pass
    [Documentation]            ใช้สำหรับทดสอบกรณีเข้าสู่ระบบผ่าน
    [Tags]                     login
    login Page


TC002-Log out Button Check
    [Documentation]            ใช้สำหรับการทดสอบกรณีออกจากระบบ
    [Tags]                     logout
    login Page
    Click Element                        ${locator_icon}
    Click Element                        ${locator_logout}
    Wait Until Element Is Visible        ${login_locator}

TC003-Search select
    [Documentation]            ใช้สำหรับการทดสอบการค้นหาสมาชิกจากฐานข้อมูล
    [Tags]                     search
    [Setup]
    [Template]    List Select
    0    0    0
    1    0    0
    0    2    0
    0    0    2
    1    2    0
    1    0    2
    0    2    2
    1    2    2
    [Teardown]

TC004-Clear Button Check
    [Documentation]            ใช้สำหรับการรีเซ็ทการค้นหา
    [Tags]                     reset
    login Page
    Verify zero

TC005-Add user pass
    [Documentation]            ใช้สำหรับการเพิ่มผู้ใช้งานจากหน้าค้นหา
    [Tags]                     register
    login Page
    Click Element                           ${locator_addUser}
    Wait Until Page Contains                Kru P' Beam
    Input data for register pass
    Click Element                           ${locator_btn-signup}
    Wait Until Page Contains                Register Success           5s
    Click Element                           ${locator_btnok}
    Wait Until Page Contains                Search Filters             5s


TC006-Verify case fail
    [Documentation]            ใช้สำหรับทดสอบกรณีกรอกข้อมูลไม่ครบถ้วน
    [Tags]                     loginFail
    [Setup]
    [Template]    Input data fail - Test Template
    ${EMPTY}    อินขาน    kanok@gmail.com    123456    02543876    female    1    1    1    1    ${locator_firstname_error}    This field is required
    กนกนวล    ${EMPTY}    kanok@gmail.com    123456    02543876    female    1    1    1    1    ${locator_lastname_error}    This field is required
    กนกนวล    อินขาน    ${EMPTY}    123456    02543876    female    1    1    1    1    ${locator_email_error}    This field is required
    กนกนวล    อินขาน    kanok@gamil.com    ${EMPTY}    02543876    female    1    1    1    1    ${locator_password_error}    This field is required
    กนกนวล    อินขาน    kanok@gamil.com    123456    ${EMPTY}    female    1    1    1    1    ${locator_mobile_error}    This field is required
    กนกนวล    อินขาน    kanok@gamil.com    123456    02546976    emp    1    1    1    1    ${locator_radio_error}    This field is required
    กนกนวล    อินขาน    kanok@gamil.com    123456    02546976    female    0    1    1    1    ${locator_chk_error}    This field is required
    กนกนวล    อินขาน    kanok@gamil.com    123456    02546976    female    1    0    1    1    ${locator_nationality_error}    This field is required
    กนกนวล    อินขาน    kanok@gamil.com    123456    02546976    female    1    1    0    1    ${locator_role_error}    This field is required
    กนกนวล    อินขาน    kanok@gamil.com    123456    02546976    female    1    1    1    0    ${locator_plan_error}    This field is required
    [Teardown]

TC007-reset Button Check
    [Documentation]                    ใช้สำหรับทดสอบปุ่มรีเซ็ทในหน้าสมัครสมาชิก
    [Tags]                             reset
    login Page
    Click Element                           ${locator_addUser}
    Wait Until Page Contains                Kru P' Beam
    Input data
    Click Element                           ${locator_resetbtn}  
    Verify Reset 
    

TC008-Back from add User Page
    [Documentation]                         ใช้สำหรับการทดสอบปุ่มย้อนกลับจากหน้าสร้างสมาชิก
    [Tags]                                  back
    login Page
    Click Element                           ${locator_addUser}
    Click Element                           ${locator_back}
    Wait Until Page Contains                Search Filters
    

TC009-Notification Button
    [Documentation]                         ใช้สำหรับทดสอบการกดปุ่มแจ้งเตือน
    [Tags]                                  noti
    login Page
    Click Element                           ${locator_notibtn}
    Wait Until Page Contains                Notifications


TC010-Verify Row per Page
    [Documentation]                        ใช้สำหรับการดูจำนวนแถวที่แสดงต่อหน้า
    [Tags]                                 row
    [Setup]
    [Template]    Select Row
    10
    25
    50
    [Teardown]

TC011-Verify Next Page
    [Documentation]                        ใช้สำหรับการทดสอบการกดหน้าถัดไปและย้อนกลับ
    [Tags]                                 page
    login Page
    Verify Page
    



