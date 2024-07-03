*** Settings ***
Library    SeleniumLibrary
Suite Setup    Abrir Navegador  
Suite Teardown    Fechar Navegador

*** Variables ***
${URL}    http://localhost:8501
${BROWSER}    chrome

${DELAY}    10s
${DEPARTAMENTO}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[6]/div[2]/div/div/div/div/div/button
${INPUT_NOME_DEPARTAMENTO}    //*[@id="text_input_1"]
${INPUT_DESCRICAO_DEPARTAMENTO}    //*[@id="text_input_2"]
${SUBMIT_DEPARTAMENTO}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[2]/div/div/div/div[3]/div/div/button

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}

Fechar Navegador
    Close Browser

Adicionar Departamento
    [Arguments]    ${nome}    ${descricao}
    Wait Until Page Contains Element    ${INPUT_NOME_DEPARTAMENTO}    ${DELAY}
    Input Text    xpath=${INPUT_NOME_DEPARTAMENTO}    ${nome}
    Input Text    xpath=${INPUT_DESCRICAO_DEPARTAMENTO}    ${descricao}
    Click Button    xpath=${SUBMIT_DEPARTAMENTO}

*** Test Cases ***
Verificar Página Inicial
    [Documentation]    Este teste verifica o título da página inicial
    Wait Until Page Contains Element   ${DEPARTAMENTO}    ${DELAY}
    Title Should Be    Início

Adicionar Departamentos
    [Documentation]    Este teste adiciona departamentos
    Click Button    xpath=${DEPARTAMENTO}
    Adicionar Departamento    FLV's    Frutas Legumes e Verduras
    Adicionar Departamento    Bebidas    Bebidas Alcoólicas e Não Alcoólicas
    Adicionar Departamento    Limpeza    Produtos de Limpeza
    Adicionar Departamento    Higiene    Produtos de Higiene Pessoal
    Adicionar Departamento    Eletrônicos    Produtos Eletrônicos
    Adicionar Departamento    Vestuário    Roupas e Acessórios
    

    

