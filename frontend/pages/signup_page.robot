*** Settings ***
Resource  ../resources/keywords.robot

*** Keywords ***
E clico em Signup após preencher os campos nome e email
    Incluir nome e email
    Click Button  //div[3]/div/form/button 
    Wait Until Page Contains Element  //*[ text() = "Enter Account Information"]