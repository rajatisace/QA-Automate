

*** Variables ***
${url}                  https://automate-test.stpb-digital.com/login/
${browser}              gc
${locator_email}        id=email
${locator_pass}         name=password
${locator_btn}          id=btn-login
${locator_register}     xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[4]/p[2]/a
${locator_err_email}    xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[1]/p
${locator_err_pass}     xpath=//*[@id="__next"]/div[1]/div/div/div[2]/div/div/form/div[2]/p