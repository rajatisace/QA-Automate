*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${url}                 file:///D:/ep01_material%20(2)/ep01/ep01_small_excercise.html
${browser}             gc
${locator_username}    id=username-box
${locator_pass}        xpath=//div[@v='password']/input
${locator_nickname}    xpath=//div/input[@doppio='nickname']
${locator_list}        id=company
${locator_checkbox}    id=op1
${locator_btn}         id=use-me
${locator_script}      xpath=/html/body/script/text()

*** Keywords ***
Open Web Browser
    Set Selenium Speed               0.5
    Open Browser                     ${url}    ${browser}
    Maximize Browser Window

Input Data
    Wait Until Element Is Visible    ${locator_username}
    Input Text                       ${locator_username}    Sorata
    Input Text                       ${locator_pass}        my_password
    Input Text                       ${locator_nickname}    TA
    Select From List By Value        ${locator_list}        doppio     
    Select Checkbox                  ${locator_checkbox}

*** Test Cases ***
TC000-Enter input and click Finish
    Open Web Browser
    Input Data
    Click Element                    ${locator_btn}
    Alert Should Be Present          Congratulation you pass the assignment of EP01
    Close Browser