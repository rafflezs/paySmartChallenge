# filme_app

Aplicação desenvolvida para seleção da paySmart.
Leia esse README para evitar problemas ao rodar o app.

## Checklist

[x] - Home com filmes obtidos da API
[x] - Ao clicar no filme, é aberta á pagina especifica do filme
[ ] - Página de busca (filme)
[ ] - Favoritar o filme (persistência de dados off-line)

## Observações

Confirme se você possui Flutter instalado em seu computador
- [Download Flutter](https://flutter.dev/)

Existe uma pasta *secrets* que contêm a chave da API.
Por questões de segurança a pasta é privada.
Para corrigir o problema:

- Gerar uma pasta secrets com o arquivo api_key.dart
- Colar o seguinte código: **const API_KEY = <sua_chave_do_TMDB>**

Por falta de tempo não foi implementada obtênção de "Genêro" do filme.