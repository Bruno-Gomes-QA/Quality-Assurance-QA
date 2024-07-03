<p align="center">
<b></b>
</p>
<div>
  <h2 id="Introdução">Introdução ☕</h2>
O aplicativo para o Gestor de Produtos e Departamentos foi construído utilizando Streamlit. Este front-end permite uma interação intuitiva com a API, facilitando a execução de operações CRUD para a gestão de produtos e departamentos. A interface amigável do Streamlit oferece uma maneira eficiente e acessível de visualizar e manipular dados, garantindo uma experiência de usuário fluida e prática.

<div>
<img src="./.github/swagger.png" width="600px">
<img src="./.github/pytest.png" width="600px">
</div>

</div>

<div>
  <h2 id="Estrutura">Estrutura 🛠️</h2>
  <p>Dividida em uma estrutura de pastas para concentrar as responsabilidades de forma organizada segue um padrão modular com as seguintes funções:
  </p>
  <div>
    <h3>./app.py</h3>
    <p>- Contem a lógica de inicialização da aplicação.</p>
    <h3>./functions</h3>
    <p>- Responsável pelas configurações e conexões com o banco de dados. Utilizando SQLAlchemy para criar e gerenciar as sessões.</p>
    <h3>./models</h3>
    <p>- Usado para definir esquemas de dados, para validação e serialização. Utilizando pydantic permite gerar modelos para as requisições e repostas da API</p>
    <h3>./pages</h3>
    <p>- Módulo onde ficam as páginas da aplicação</p>
    <h3>./services</h3>
    <p>- Responsável pela conexão com a API, obter respostas e fazer requisições</p>
  </div>
</div>
<div>
  <h2 id="Rodando">Rodando o APP 🏃</h2>
  <p>Para executar este projeto é necessário seguir as etapas listadas abaixo:</p>
  <h3>Pré requisitos</h3>
</div>

- Python 🐍
```bash
sudo apt install python3
sudo apt install python3-pip
```
- Poetry 📎
```bash
pip install poetry
```
- API 

Para rodar o app a api deve estar de pé, para isso siga as instruções no README.md abaixo

- Iniciar o ambiente com Poetry
```bash
poetry shell
poetry install
```
- Criar .env em ./app
```bash
API_URL=http://localhost:5000
```
- Rodar o APP
```bash
cd ./app
streamlit run ./app.py
```

- Rodar os testes
```bash
cd ./tests
robot .
```