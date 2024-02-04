*** Variables ***
${url}                https://automate-test.stpb-digital.com/login/
${browser}            gc
${login_locator}      id=email
${login_email}        user.test@krupbeam.com
${password_locator}   name=password
${login_password}     123456789
${login_btn}          btn-login
${locator_role}       id=select-role
${select_role}        id=option-select-role-
${locator_plan}       id=select-plan
${select_plan}        id=option-select-plan-
${locator_status}     id=select-status
${select_status}      id=option-select-status-
${search_btn}         id=btn-search
${role_check}         xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[3]/div/p
${plan_check}         xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[4]/h6
${status_check}       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[5]/div/span
${result_number}      xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/p[2]
${locator_clearbtn}   id=btn-clear
${locator_icon}       xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div/img
${locator_logout}     css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li

${locator_firstname}          id=firstname
${locator_lastname}           id=lastname
${locator_email}              id=email
${locator_password}           id=password
${locator_mobile}             id=mobile-phone
${locator_radio}              validation-basic-radio
${locator_chkSQL}             courses.SQL
${locator_chkManual}          name=courses.Test Manual
${locator_chkAutomate}        name=courses.Automate Test
${locator_chkAutomate2}       name=courses.Automate Test2
${locator_select-role}        id=select-role
${locator_select-role-li}     xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_nationality}        id=nationality
${locator_selectnation}       xpath=//*[@id="menu-"]/div[3]/ul/li[221]
${locator_select-Plan}        id=select-plan
${locator_select-Plan2}       xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_btn-signup}         xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[3]/div/div/div/form/button
${locator_resetbtn}           id=reset
${locator_firstname_error}    id=error-firstname
${locator_lastname_error}     id=error-lastname
${locator_email_error}        id=error-email
${locator_password_error}     id=error-password
${locator_mobile_error}       id=error-mobile-phone
${locator_radio_error}        id=validation-basic-gender
${locator_chk_error}          id=validation-basic-courses
${locator_nationality_error}  id=validation-basic-nationality
${locator_role_error}         id=validation-role
${locator_plan_error}         id=validation-plan
${locator_btnok}              id=btn-ok
${locator_addUser}            xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a
${locator_back}               xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button

${locator_notibtn}            xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/button
${locator_rownumbtn}             xpath=//*[@id=":r2:"]
${locator_rownum10}           xpath=//*[@id="menu-"]/div[3]/ul/li[1]
${locator_rownum25}           xpath=//*[@id="menu-"]/div[3]/ul/li[2]
${locator_rownum50}           xpath=//*[@id="menu-"]/div[3]/ul/li[3]
${locator_of53}               xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/p[2]
${locator_nextpg}             xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[2]
${locator_prevpg}             xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[3]/div/div[2]/div/div[3]/button[1]
${locator_firstUser}          xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[1]/div/div[2]/a[1]





