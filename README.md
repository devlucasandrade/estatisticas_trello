<h1>Estatíticas Trello</h1>

<hr>


## Tópicos 

- [Descrição do projeto](#descrição-do-projeto)

- [Funcionalidades](#funcionalidades)

- [Aplicação](#aplicação)

- [Executando o projeto](#executando-o-projeto)

- [Observações](#observações)



## Descrição do projeto 

<p align="justify">
A ideia do projeto surgiu da necessidade de apresentar os dados cadastrados no Trello, baseados na regra do cliente, onde o mesmo irá criar um Clipping de matérias jornalísticas, especificando veículo de origem, utilizando 4 tipos - Mídia Impressa, Mídia Digital, Televisão e Rádio. As informações serão apresentadas de forma anual e mensal no primeiro momento. Caso exista a necessidade de acesso a dado com maior detalhe, serão incluídas novas telas e funcionalidades.
</p>


## Funcionalidades

<img alt="Home Page" src="/screenshots/widget-01.png" width="250" />

`01:` Widget para listar as ocorrências do ano, fazendo um apanhando geral do Board e tudo o que foi cadastrado nas listas 
correspondentes aos meses.
<br><br>

<img alt="Home Page" src="/screenshots/widget-02.png" width="250" />

`02:` Widget para listar as ocorrências do mês, dessa forma tendo um controle específico mensal, onde serão apresentados apenas os dados cadastrados no referido mês, em forma de lista, para que possam ser acessados todos os meses.
<br><br>

`03:` Slider e Botão para atualizar os dados acessados diretamente na API do Trello, baseado no Board previamente selecionado.


## Aplicação

<p float="left">
    <img alt="Home Page" src="/screenshots/home_page.png" width="200" />
</p>


## Executando o projeto

1. [Instale o Flutter](https://flutter.dev/docs/get-started/install)

2. Clone este repositório

```
git clone https://github.com/devlucasandrade/lista_compras
```

3. Baixe as dependências

```
flutter pub get
```

4. Execute

```
flutter run
```

5. Gerar Token e Key no Trello, através da documentação encontrada aqui: [Trello API](https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/).<br>Com eles em mãos poderá realizar as chamadas para a API.


## Observações

- O crédito do ícone do projeto pretence ao site: [Flaticon](https://www.flaticon.com/free-icons/statistics).
- Projeto em fase de testes