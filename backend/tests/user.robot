*** Settings ***
Library           Collections
Library           BuiltIn
Resource          ../pages/user_page.robot

*** Variables ***
${NAME}    Estevão
${JOB}     QA

*** Test Cases ***
Criar um usuário e validar a resposta
    [Documentation]  Teste de criação de usuário
    
    Dado que eu tenho os dados do usuário para criação    ${NAME}    ${JOB}
    Quando eu envio a solicitação para criar o usuário    ${NAME}    ${JOB}
    Então eu devo ver a resposta com os detalhes do usuário criado

Consultar o Usuário Cadastrado
    [Documentation]  Teste de consulta do usuário
    
    Quando eu envio a solicitação para consultar o usuário cadastrado
    Então eu devo ver a resposta com os detalhes do usuário consultado

Alterar o Usuário Cadastrado
    [Documentation]  Teste de alteração de usuário
    
    Quando eu envio a solicitação para alterar o usuário cadastrado    QA Banco ABC
    Então eu devo ver a resposta com os detalhes do usuário alterado


*** Keywords ***
Dado que eu tenho os dados do usuário para criação
    [Arguments]    ${name}    ${job}
    # Preparar dados do usuário, se necessário.
    Log    Dados do usuário preparados: ${name}, ${job}

Quando eu envio a solicitação para criar o usuário
    [Arguments]    ${name}    ${job}
    Create User    ${name}    ${job}

Então eu devo ver a resposta com os detalhes do usuário criado
    Validar Usuario Cadastrado    ${name}    ${job}
    
Quando eu envio a solicitação para consultar o usuário cadastrado
    Consultar Usuário    ${ID_USER}

Então eu devo ver a resposta com os detalhes do usuário consultado
    Validar Usuario Consultado    ${ID_USER}

Quando eu envio a solicitação para alterar o usuário cadastrado
    [Arguments]    ${new_job}
    Atualizar Usuário    ${ID_USER}    ${new_job}

Então eu devo ver a resposta com os detalhes do usuário alterado
    Validar Usuario Atualizado    ${ID_USER}    QA Banco ABC