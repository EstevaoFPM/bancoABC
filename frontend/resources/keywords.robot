*** Settings ***
Library  SeleniumLibrary
Library  String
Resource  ./variables.robot
Resource  ../environment/browser_settings.robot

*** Keywords ***
Dado que acesso a URL
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

Close Browser
    Close All Browsers

Check Text Including Pseudo Element
    [Arguments]  ${element}  ${expected_text}
    ${script}=  Set Variable  return document.querySelector('${element}').innerText.includes('${expected_text}')
    ${result}=  Execute JavaScript  ${script}
    Should Be True  ${result}  Text '${expected_text}' not found in element or pseudo-element

Incluir nome e email
    ${RANDOM_INTEGER} =  Generate Random String  5  [NUMBERS]
    ${RANDOM_EMAIL} =  Set Variable  test${RANDOM_INTEGER}.email@example.com
    Input Text  //input[@name="name"]  ${NAME}
    Input Text  //div[3]/div/form/input[3]  ${RANDOM_EMAIL}

Selecionar sexo e incluir senha
    Click Element  //input[@id="id_gender1"]
    Input Text  //input[@id="password"]  ${PASSWORD}

Incluir a data de nascimento
    Select From List By Value  //select[@id="days"]  11
    ${STRING}    Get Value    //select[@id="days"]
    Should Be Equal    ${STRING}        11

    Select From List By Value  //select[@id="months"]  4
    ${STRING}    Get Value    //select[@id="months"]
    Should Be Equal    ${STRING}        4
    
    Select From List By Value  //select[@id="years"]  1990
    ${STRING}    Get Value    //select[@id="years"]
    Should Be Equal    ${STRING}        1990

Selecionar os radio button
    Scroll Element Into View    //*[@id="form"]/div/div/div/div[1]/form/button
    Click Element  //*[@id="newsletter"]
    Click Element  //input[@id="optin"]

Preencher os dados pessoais
    Input Text  //input[@id="first_name"]  ${FIRST_NAME}
    ${STRING}    Get Value    //input[@id="first_name"]
    Should Be Equal    ${STRING}        ${FIRST_NAME}

    Input Text  //input[@id="last_name"]  ${LAST_NAME}
    ${STRING}    Get Value    //input[@id="last_name"]
    Should Be Equal    ${STRING}        ${LAST_NAME}

    Input Text  //input[@id="company"]  ${COMPANY}
    ${STRING}    Get Value    //input[@id="company"]
    Should Be Equal    ${STRING}        ${COMPANY}

    Input Text  //input[@id="address1"]  ${ADDRESS}
    ${STRING}    Get Value    //input[@id="address1"]
    Should Be Equal    ${STRING}        ${ADDRESS}

    Input Text  //input[@id="state"]  ${STATE}
    ${STRING}    Get Value    //input[@id="state"]
    Should Be Equal    ${STRING}        ${STATE}

    Input Text  //input[@id="city"]  ${CITY}
    ${STRING}    Get Value    //input[@id="city"]
    Should Be Equal    ${STRING}        ${CITY}

    Input Text  //input[@id="zipcode"]  ${ZIPCODE}
    ${STRING}    Get Value    //input[@id="zipcode"]
    Should Be Equal    ${STRING}        ${ZIPCODE}

    Input Text  //input[@id="mobile_number"]  ${MOBILE_NUMBER}
    ${STRING}    Get Value    //input[@id="mobile_number"]
    Should Be Equal    ${STRING}        ${MOBILE_NUMBER}

Selecionar país
    Select From List By Label  //select[@id="country"]  ${COUNTRY}
    ${STRING}    Get Value    //select[@id="country"]
    Should Be Equal    ${STRING}        ${COUNTRY}

Criar a conta
    Click Button  //*[@id="form"]/div/div/div/div[1]/form/button

Validar a conta criada
    Page Should Contain  ${SUCCESS_MESSAGE}
