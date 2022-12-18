# Billinho

## Descrição

É uma API que gerencia aluno, suas matrículas e respectivas mensalidades;

Recebe e envia dados por meio de requisições JSON;

É necessáro uma ferramenta que execute requisições JSON como o Postman por exemplo;

### Rotas

 - Students - GET
```
GET /students
```
 - Formato dos parametros:
 `page` indica a página que os referentes alunos serão carregados;
 `count` indica quantos alunos serão carregados na págia solicitada;

```
    {
        "page": 1,
        "count": 3
    }
```

 - Students - POST

```
POST /students
```

- Formato dos parametros
 `name` nome do aluno, não deve ser nulo;
 `cpf` cpf do aluno, não deve ser nulo;
 `birthdate` data de nascimento do aluno, pode ser nulo;
 `payment_method` método de pagamento do aluno, não pode ser nulo e deve ser `credit_card` ou `boleto`

 ```
{
  "name": "Novo aluno",
  "cpf": "038.347.910-08",
  "birthdate": "23/10/1996",
  "payment_method": "boleto"
}
```
 - Enrollments - GET
```
GET /enrollments
```

```
POST /enrollments
```

### Ferramentas
 - Database Postgresql para armazenar os dados;
 - Kaminari para paginação;
 - RSpec para testes;
 - Autenticação Basic Auth;

## Especificaçoes

 - Ruby 3,0;
 - Rails 7.0.4;
 - Postgres (1.4.5, 1.4.1, 1.2.3);
 - Kaminari 1.2.2;
 - RSpec 6.0;

 ## Utilização

 - clone o repositório em um diretório;
 - Execute o comando a seguir para o container ser executado
    ```
    docker-compose up
    ```
- Após isso, para 
