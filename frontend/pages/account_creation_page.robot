*** Settings ***
Resource  ../resources/keywords.robot

*** Keywords ***
Quando preencho o formulário e crio a conta
    Selecionar sexo e incluir senha
    Incluir a data de nascimento
    Selecionar os radio button
    Preencher os dados pessoais
    Selecionar país
    Criar a conta
    
Então é exibida mensagem de sucesso na criação
    Validar a conta criada

