
*** Variables ***
${url}                          https://automate-test.stpb-digital.com/register/
${browser}                      gc
${locator_firstname}            id=firstname
${locator_lastname}             id=lastname
${locator_gender}               validation-basic-radio
${locator_chkSQL}               name=courses.SQL
${locator_chkTestMa}            name=courses.Test Manual
${locator_chkTestAu1}           name=courses.Automate Test
${locator_chkTestAu2}           name=courses.Automate Test2
${locator_select-role}          id=select-role
${locator_select-role-li}       xpath=//*[@id="menu-"]/div[3]/ul/li[3]
${locator_select-nation}        id=nationality
${locator_select-nation-li}     xpath=//*[@id="menu-"]/div[3]/ul/li[6]
${locator_select-plan}          id=select-plan
${locator_select-plan-li}       xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_signup}               id=btn-sign-up
${locator_resetbtn}             id=reset
${locator_email}                id=email
${locator_password}             id=password
${locator_mobile}               id=mobile-phone
${locator_btnok}                id=btn-ok
${locator_err_fname}            id=error-firstname
${locator_err_lname}            id=error-lastname
${locator_err_email}            id=error-email
${locator_err_pass}             id=error-password
${locator_err_phone}            id=error-mobile-phone
${locator_err_gender}           id=validation-basic-gender
${locator_err_check}            id=validation-basic-courses
${locator_err_nation}           id=validation-basic-nationality
${locator_err_role}             id=validation-role
${locator_err_plan}             id=validation-plan