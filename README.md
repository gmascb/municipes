# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  * 3.2.1

* System dependencies

* Configuration

* Database creation
  * rake db:create
  * rake db:migrate

* Database initialization
  * rake db:seed

* How to run the test suite
  * rspec

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


* Scaffolds
  * rails g scaffold municipe nome_completo:string cpf:string cns:string email:string data_nascimento:date telefone:string status:boolean
  * rails g scaffold endereco municipe:references cep:string logradouro:string complemento:string bairro:string cidade:string UF:string cod_ibge:string

* Installations
  * Imagens
    * rails active_storage:install
  * Emails
    * gem install mailcatcher
      * `$: mailcatcher`
  * CSS
    * https://github.com/rails/cssbundling-rails
    * `$: rails css:install:bootstrap`
  