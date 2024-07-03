*** Settings ***
Library    SeleniumLibrary
Suite Setup    Abrir Navegador  
Suite Teardown    Fechar Navegador

*** Variables ***
${URL}    http://localhost:8501
${BROWSER}    chrome

${DELAY}    10s
${BUTTON_PRODUTOS}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[6]/div[1]/div/div/div/div/div/button
${BUTTON_ADICIONAR_DEPARTAMENTO}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[4]/div/button

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}

Fechar Navegador
    Close Browser

*** Test Cases ***
Verificar Página Inicial
    [Documentation]    Este teste verifica o título da página inicial
    Wait Until Page Contains Element   ${BUTTON_PRODUTOS}    ${DELAY}
    Title Should Be    Início

Verificar se não tem produtos
    [Documentation]    Este teste valida se não tiver nenhum produto cadastrado
    Click Button    xpath=${BUTTON_PRODUTOS}
    Wait Until Page Contains Element    ${BUTTON_ADICIONAR_DEPARTAMENTO}    ${DELAY}
    Click Button    xpath=${BUTTON_ADICIONAR_DEPARTAMENTO}
    
    

    

