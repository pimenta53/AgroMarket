# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.delete_all
Country.create :name => "Portugal"
Country.create :name => "Spain"

City.delete_all
City.create :city => "Aveiro"
City.create :city => "Beja"
City.create :city => "Braga"
City.create :city => "Bragança"
City.create :city => "Castelo Branco"
City.create :city => "Coimbra"
City.create :city => "Évora"
City.create :city => "Faro"
City.create :city => "Guarda"
City.create :city => "Leiria"
City.create :city => "Lisboa"
City.create :city => "Portalegre"
City.create :city => "Porto"
City.create :city => "Porto"
City.create :city => "Santerém"
City.create :city => "Viana do Castelo"
City.create :city => "Vila Real"
City.create :city => "Viseu"