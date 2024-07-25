*** Settings ***
Resource  ../environment/browser_settings.robot
Resource  ../pages/signup_page.robot
Resource  ../pages/account_creation_page.robot

*** Test Cases ***
Criação de Usuário
    Dado que acesso a URL
    E clico em Signup após preencher os campos nome e email
    Quando preencho o formulário e crio a conta
    Então é exibida mensagem de sucesso na criação