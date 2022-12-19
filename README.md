# Billinho

## Descrição

É uma API que gerencia alunos, suas matrículas e respectivas mensalidades;

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
    - GET /enrollments
    ```

  - Formato dos parametros
  `page` busca a págia desejada;
  `count` quantidade de usuários por página;
  
  `OBSERVAÇAO`: Essa rota é protegida por autenticação Basic Auth, para de acesso as mensalidades dos alunos, você precisará, na aba de autorização de seu Postaman, por exemplo, escolher a autenticação Basic Auth e preencher o campo Username com `admin_ops` e Password com `billing`.
    ```
    {
        "page": 1,
        "count": 3
    }
    ```

 - Formato dos parametros
 `amount` não deve ser nulo;
 `installments`  não deve ser nulo;
 `due_day` não deve ser nulo;
 `student_id` não deve ser nulo;

    ```
    POST /enrollments
    ```

    ```
    {
    "amount": 1200000,
    "installments": 1,
    "due_day": 5,
    "student_id": 1
    }
    ```


### Ferramentas
 - Database Postgresql para armazenar os dados;
 - Kaminari para paginação;
 - RSpec para testes;
 - FactoryBot para trabalhar com RSpec;
 - Autenticação Basic Auth;

## Especificaçoes

 - Ruby 3,0;
 - Rails 7.0.4;
 - Postgres (1.4.5, 1.4.1, 1.2.3);
 - Kaminari 1.2.2;
 - RSpec 6.0;
 - FactoryBot 6.2;

 ## Utilização

 - clone o repositório em um diretório;
 - Execute o comando a seguir no diretório da API para o container ser criado
    ```
    docker-compose build
    ```
- O seguinte para o container ser carregado

    ```
    docker-compose up
    ```
- Após isso, em outro console, digite o seguinte comando para carregar o console do container

    ```
    docker exec -it billinho-rails-container bash
    ```

- Dentro desse novo console, digite

    ```
    rails db:create db:migrate
    ```

- Aplicação pronta par ser utilizada!

## Testes

- Para executar os testes, no console do contaner, digite:

    ```
    bundle exec rspec
    ```