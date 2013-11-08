agrosocial
==========
 
UCE15 

## Push para o GitHub  ##

A messagem de **commit** para melhor entendimento deve seguir o template:

[Tipo de Ação] Ação [Grupo de utilizador]

### Tipos de Ações ###
* Add Feature

* Fix Bug

* Bug

* Update Feature

* Config

## Configuration ##
Alterem o vosso ficheiro `/config/database.yml` e mantenham-no localmente. 
Atenção com os tipos, username, password, socket e host têm que ser strings 
(entre '' preferivelemente), caso não fizerem terão erro de conversão de 
Fixnum para String. Exemplo:

  username: 'root'
  
  password: 'root'
  
  socket: '3306'
  
  host: '127.0.0.1' 
  
Neste caso username e password não precisam de '' porque seriam imediatamente
reconhecidos como String, mas no socket é obrigatório. O host foi adicionado
porque era essencial para ubuntu 12.04

```Ruby
# MySQL.  Versions 4.1 and 5.0 are recommended.
#
# Install the MYSQL driver
#   gem install mysql2
#
# Ensure the MySQL gem is defined in your Gemfile
#   gem 'mysql2'
#
# And be sure to use new-style password hashing:
#   http://dev.mysql.com/doc/refman/5.0/en/old-client.html
development:
  adapter: mysql2
  encoding: utf8
  database: agrosocial_development
  pool: 5
  username: root
  password: vossa_password
  socket: vosso_caminho
  host: '127.0.0.1' 

# Warning: The database defined as "test" will be erased and
# re-generated from your development database when you run "rake".
# Do not set this db to the same as development or production.
test:
  adapter: mysql2
  encoding: utf8
  database: agrosocial_test
  pool: 5
  username: root
  password: vossa_password
  socket: vosso_caminho
  host: '127.0.0.1'

production:
  adapter: mysql2
  encoding: utf8
  database: agrosocial_production
  pool: 5
  username: root
  password: vossa_password
  socket: vosso_caminho
  host: '127.0.0.1'

 ```
 
 
## Datas ##

Em vez de usar o 

`<%= times_ago_in_words(comment.created_at) %>`

Usem desta forma para que o servidor a cada pedido não esteja a fazer novamente o calculo.


   `<abbr class="timeago" title="<%= ad.created_at.getutc.iso8601 %>">
            <%= ad.created_at.to_s %>
     </abbr> `
 
