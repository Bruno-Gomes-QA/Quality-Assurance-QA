*** Settings ***
Library    SeleniumLibrary
Suite Setup    Abrir Navegador  
Suite Teardown    Fechar Navegador

*** Variables ***
${URL}    http://localhost:8501
${BROWSER}    chrome

# Buttons, Inputs, and other elements
${DELAY}    10s
${NOT_DEPARTAMENTOS}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[4]/div/div/p
${BUTTON_DEPARTAMENTO}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[6]/div[2]/div/div/div/div/div/button
${INPUT_NOME_DEPARTAMENTO}    //*[@id="text_input_1"]
${INPUT_DESCRICAO_DEPARTAMENTO}    //*[@id="text_input_2"]
${SUBMIT_DEPARTAMENTO}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[2]/div/div/div/div[3]/div/div/button
${TABLE_ROWS}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[6]/div/div/div[2]/div[1]/div/div/div[1]/canvas[1]/table/tbody

# Array Departamentos
@{DEPARTAMENTOS}    
...    FLV's    Frutas Legumes e Verduras
...    Bebidas    Bebidas Alcoólicas e Não Alcoólicas
...    Limpeza    Produtos de Limpeza
...    Higiene    Produtos de Higiene Pessoal
...    Eletrônicos    Produtos Eletrônicos
...    Vestuário    Roupas e Acessórios

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

Verificar Departamento
    [Arguments]    ${id}    ${nome}    ${descricao}
    Element Text Should Be    xpath=${TABLE_ROWS}/tr[${id}]/td[2]    ${nome}
    Element Text Should Be    xpath=${TABLE_ROWS}/tr[${id}]/td[2]    ${descricao}

*** Test Cases ***
Verificar Página Inicial
    [Documentation]    Este teste verifica o título da página inicial
    Wait Until Page Contains Element   ${BUTTON_DEPARTAMENTO}    ${DELAY}
    Title Should Be    Início
    Click Button    xpath=${BUTTON_DEPARTAMENTO}
    Wait Until Element Contains    ${NOT_DEPARTAMENTOS}    Nenhum departamento cadastrado

Adicionar Departamentos
    [Documentation]    Este teste adiciona departamentos 
    FOR    ${element1}    ${element2}    IN    @{DEPARTAMENTOS}
        adicionar departamento    ${element1}    ${element2}
    END
