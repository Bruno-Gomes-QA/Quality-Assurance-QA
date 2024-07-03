*** Settings ***
Library    SeleniumLibrary
Suite Setup    Abrir Navegador  
Suite Teardown    Fechar Navegador

*** Variables ***
${URL}    http://localhost:8501
${BROWSER}    chrome

# Buttons, Inputs, and other elements
${DELAY}    10s
${NOT_PRODUTOS}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[3]/div/div/div/div/div/div/p
${BUTTON_PRODUTOS}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[6]/div[1]/div/div/div/div/div/button
${INPUT_PRODUTO}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[2]/div/div/div
${INPUT_NOME_PRODUTO}    ${INPUT_PRODUTO}/div[1]
${INPUT_DESCRICAO_PRODUTO}    ${INPUT_PRODUTO}/div[2]
${INPUT_PRECO_COMPRA}    ${INPUT_PRODUTO}/div[3]
${INPUT_PRECO_VENDA}    ${INPUT_PRODUTO}/div[4]
${INPUT_DEPARTAMENTO}    ${INPUT_PRODUTO}/div[5]
${INPUT_ESTOQUE}    ${INPUT_PRODUTO}/div[6]
${SUBMIT_PRODUTO}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[2]/div/div/div/div[7]/div/div/button
${TABLE_ROWS}    //*[@id="root"]/div[1]/div[1]/div/div/div/section/div[1]/div/div/div/div[6]/div/div/div[2]/div[1]/div/div/div[1]/canvas[1]/table/tbody

# Array Departamentos
@{PRODUTOS}    
...    Banana    Banana Nanica    1.00    2.00    1 - FLV'S    100
...    Maçã    Maçã Gala    1.50    2.50    1 - FLV's    59
...    Coca-Cola    Coca-Cola 2L    5.00    7.00    2 - Bebidas    278
...    Sabão em Pó    Omo    10.00    15.00    3 - LIMPEZA    97
...    Shampoo    Seda    5.00    10.00    4 - HIGIENE    30
...    Camiseta    Camiseta Branca    10.00    20.00    6 - VESTUÁRIO    20
...    Calça    Calça Jeans    20.00    40.00    6 - VESTUÁRIO    56
...    Tênis    Tênis Nike    100.00    200.00    6 - VESTUÁRIO    42
...    Celular    Samsung Galaxy    500.00    1000.00    5 - ELETRÔNICOS    23
...    Notebook    Dell Inspiron    2000.00    3000.00    5 - ELETRÔNICOS    14
...    Mochila    Mochila Escolar    50.00    100.00    6 - VESTUÁRIO    17

*** Keywords ***
Abrir Navegador
    Open Browser    ${URL}    ${BROWSER}

Fechar Navegador
    Close Browser

Adicionar Produto
    [Arguments]    ${nome}    ${descricao}    ${preco_compra}    ${preco_venda}    ${departamento}    ${estoque}
    Wait Until Page Contains Element    ${INPUT_DEPARTAMENTO}    ${DELAY}
    Input Text    xpath=${INPUT_NOME_PRODUTO}    ${nome}
    Input Text    xpath=${INPUT_DESCRICAO_PRODUTO}    ${descricao}
    Input Text    xpath=${INPUT_PRECO_COMPRA}    ${preco_compra}
    Input Text    xpath=${INPUT_PRECO_VENDA}    ${preco_venda}
    Input Text    xpath=${INPUT_DEPARTAMENTO}    ${departamento}
    Input Text    xpath=${INPUT_ESTOQUE}    ${estoque}

    Click Button    xpath=${SUBMIT_PRODUTO}


*** Test Cases ***
Verificar Página Inicial
    [Documentation]    Este teste verifica o título da página inicial
    Wait Until Page Contains Element   ${BUTTON_PRODUTOS}    ${DELAY}
    Title Should Be    Início
    Click Button    xpath=${BUTTON_PRODUTOS}
    Wait Until Element Contains    ${NOT_PRODUTOS}    Nenhum produto cadastrado

Adicionar Produtos
    [Documentation]    Este teste adiciona produtos 
    FOR    ${nome}    ${descricao}    ${preco_compra}    ${preco_venda}    ${departamento}    ${estoque}    IN    @{PRODUTOS}
        Adicionar Produto    ${nome}    ${descricao}    ${preco_compra}    ${preco_venda}    ${departamento}    ${estoque}
    END
