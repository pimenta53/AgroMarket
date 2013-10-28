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
Alterem o vosso ficheiro /db/database.yml e mantenham-no  

```Ruby
development:
  adapter: mysql2
  encoding: utf8
  database: agrosocial_development
  pool: 5
  username: root
  password: A vossa Pass
  socket: O caminho para mysql
 ```
