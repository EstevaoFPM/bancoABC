*** Settings ***
Library           RequestsLibrary
Library           Collections
Library           OperatingSystem
Library           BuiltIn
Library    json
Suite Setup       Setup Suite
Suite Teardown    Teardown Suite

*** Variables ***
${BASE_URL}       https://reqres.in/api
${CREATE_USER_URL}    ${BASE_URL}/users
${ID_USER}    ${EMPTY}

*** Keywords ***
Setup Suite
    Create Session    reqres    ${BASE_URL}

Teardown Suite
    Delete All Sessions

Create User
    [Arguments]    ${name}    ${job}
    ${user_data}=    Create Dictionary    name=${name}    job=${job}
    ${response}=    POST    ${CREATE_USER_URL}    ${user_data}

    Should Be Equal As Strings   ${response.status_code}  201
    
    Set Test Variable   ${RESPONSE}

Validar Usuario Cadastrado
    [Arguments]    ${name}    ${job}
    Dictionary Should Contain Item  ${RESPONSE.json()}  name   ${name}
    Dictionary Should Contain Item  ${RESPONSE.json()}  job   ${job}
    Dictionary Should Contain Key  ${RESPONSE.json()}  id
    Dictionary Should Contain Key  ${RESPONSE.json()}  createdAt

    ${user_id}=    Get From Dictionary    ${RESPONSE.json()}    id
    Set Global Variable    ${ID_USER}    ${user_id}

Consultar Usuário
    [Arguments]    ${user_id}
    ${response}    GET    ${BASE_URL}/users/${ID_USER}
    Should Be Equal As Strings    ${response.status_code}    200
    Set Test Variable    ${RESPONSE}

Validar Usuario Consultado
    [Arguments]    ${user_id}
    Dictionary Should Contain Key    ${RESPONSE.json()}    id
    ${consulted_user_id}=    Get From Dictionary    ${RESPONSE.json()}    id
    Should Be Equal As Strings    ${consulted_user_id}    ${ID_USER}

Atualizar Usuário
    [Arguments]    ${user_id}    ${new_job}
    ${user_data}=    Create Dictionary    job=${new_job}
    ${response}=    PUT    ${BASE_URL}/users/${ID_USER}    ${user_data}
    Should Be Equal As Strings    ${response.status_code}    200
    Set Test Variable    ${RESPONSE}
    Log    ${RESPONSE.json()}

Validar Usuario Atualizado
    [Arguments]    ${user_id}    ${new_job}
    Dictionary Should Contain Item    ${RESPONSE.json()}    job    ${new_job}
    Dictionary Should Contain Key  ${RESPONSE.json()}  updatedAt