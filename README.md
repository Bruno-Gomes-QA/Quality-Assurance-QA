<p align="center">
<b></b>
</p>
<div>
  <h2 id="Introdução">Introdução ☕</h2>
Este repositório tem como objetivo registrar minhas habilidades como Analista de Qualidade de Software. Aqui, você encontrará exemplos de testes automatizados, documentação de cenários de testes e outros materiais relevantes para a prática de QA. Para isso desenvolvi uma api CRUD para departamentos e produtos, com testes automatizados e swagger utilizando robot framework.

<div>
  <h2 id="Estrutura">Estrutura 🛠️</h2>
  <p>O sistema é separado em duas partes principais, a API responsável por toda a regra de negócio e por se comunicar com o banco de dados, e o APP responsável pela interação com o usuário final, abaixo estão os links para a documentação.</p>

  [API]: https://img.shields.io/badge/API-000?style=for-the-badge&logo=html
  [APP]: https://img.shields.io/badge/APP-000?style=for-the-badge&logo=code

  [![api][API]](./api/README.md)
  [![app][APP]](./app/README.md)
</div>

  <h2 id="Rodando">Rodando os Testes 🏃</h2>
  <p>Após seguir o passo a passo para rodar o app e a api, podemos rodar os testes.</p>
</div>

- Rodar os testes
```bash
cd ./tests
robot .
```