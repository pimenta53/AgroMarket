#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

District.delete_all
District.create :name => "Aveiro"
District.create :name => "Beja"
District.create :name => "Braga"
District.create :name => "Bragança"
District.create :name => "Castelo Branco"
District.create :name => "Coimbra"
District.create :name => "Évora"
District.create :name => "Faro"
District.create :name => "Guarda"
District.create :name => "Leiria"
District.create :name => "Lisboa"
District.create :name => "Portalegre"
District.create :name => "Porto"
District.create :name => "Santarém"
District.create :name => "Setúbal"
District.create :name => "Viana do Castelo"
District.create :name => "Vila Real"
District.create :name => "Viseu"
District.create :name => "R. A. da Madeira"
District.create :name => "R. A. dos Açores"

City.delete_all
aux = District.where(:name => "Aveiro")
City.create :city => "Águeda", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Albergaria-a-Velha", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Anadia", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Arouca", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Aveiro", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Castelo de Paiva", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Espinho", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Estarreja", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Santa Maria da Feira", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Ílhavo", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Mealhada", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Murtosa", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Oliveira de Azeméis", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Oliveira do Bairro", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Ovar", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "São João da Madeira", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Sever do Vouga", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Vagos", :district_id => aux.first.id
aux = District.where(:name => "Aveiro")
City.create :city => "Vale de Cambra", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Aljustrel", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Almodôvar", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Alvito", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Barrancos", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Beja", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Castro Verde", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Cuba", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Ferreira do Alentejo", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Mértola", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Moura", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Odemira", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Ourique", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Serpa", :district_id => aux.first.id
aux = District.where(:name => "Beja")
City.create :city => "Vidigueira", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Amares", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Barcelos", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Braga", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Cabeceiras de Basto", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Celorico de Basto", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Esposende", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Fafe", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Guimarães", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Póvoa de Lanhoso", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Terras de Bouro", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Vieira do Minho", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Vila Nova de Famalicão", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Vila Verde", :district_id => aux.first.id
aux = District.where(:name => "Braga")
City.create :city => "Vizela", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Alfândega da Fé", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Bragança", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Carrazeda de Ansiães", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Freixo Espada à Cinta", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Macedo de Cavaleiros", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Miranda do Douro", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Mirandela", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Mogadouro", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Torre de Moncorvo", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Vila Flor", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Vimioso", :district_id => aux.first.id
aux = District.where(:name => "Bragança")
City.create :city => "Vinhais", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Belmonte", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Castelo Branco", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Covilhã", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Fundão", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Idanha-a-Nova", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Oleiros", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Penamacor", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Proença-a-Nova", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Sertã", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Vila de Rei", :district_id => aux.first.id
aux = District.where(:name => "Castelo Branco")
City.create :city => "Vila Velha de Ródão", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Arganil", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Cantanhede", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Coimbra", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Condeixa-a-Nova", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Figueira da Foz", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Góis", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Lousã", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Mira", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Miranda do Corvo", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Montemor-o-Velho", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Oliveira do Hospital", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Pampilhosa da Serra", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Penacova", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Penela", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Soure", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Tábua", :district_id => aux.first.id
aux = District.where(:name => "Coimbra")
City.create :city => "Vila Nova de Poiares", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Alandroal", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Arraiolos", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Borba", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Estremoz", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Évora", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Montemor-o-Novo", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Mora", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Mourão", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Portel", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Redondo", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Reguengos de Monsaraz", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Vendas Novas", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Viana do Alentejo", :district_id => aux.first.id
aux = District.where(:name => "Évora")
City.create :city => "Vila Viçosa", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Albufeira", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Alcoutim", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Aljezur", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Castro Marim", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Faro", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Lagoa", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Lagos", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Loulé", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Monchique", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Olhão", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Portimão", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "São Brás de Alportel", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Silves", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Tavira", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Vila do Bispo", :district_id => aux.first.id
aux = District.where(:name => "Faro")
City.create :city => "Vila Real Sto António", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Aguiar da Beira", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Almeida", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Celorico da Beira", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Fig. Castelo Rodrigo", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Fornos de Algodres", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Gouveia", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Guarda", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Manteigas", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Meda", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Pinhel", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Sabugal", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Seia", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Trancoso", :district_id => aux.first.id
aux = District.where(:name => "Guarda")
City.create :city => "Vila Nova de Foz Côa", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Alcobaça", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Alvaiázere", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Ansião", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Batalha", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Bombarral", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Caldas da Rainha", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Castanheira de Pêra", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Figueiró dos Vinhos", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Leiria", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Marinha Grande", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Nazaré", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Óbidos", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Pedrógão Grande", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Peniche", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Pombal", :district_id => aux.first.id
aux = District.where(:name => "Leiria")
City.create :city => "Porto de Mós", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Alenquer", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Arruda dos Vinhos", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Azambuja", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Cadaval", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Cascais", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Lisboa", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Loures", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Lourinhã", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Mafra", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Oeiras", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Sintra", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Sobral de Monte Agraço", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Torres Vedras", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Vila Franca de Xira", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Amadora", :district_id => aux.first.id
aux = District.where(:name => "Lisboa")
City.create :city => "Odivelas", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Alter do Chão", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Arronches", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Avis", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Campo Maior", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Castelo de Vide", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Crato", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Elvas", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Fronteira", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Gavião", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Marvão", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Monforte", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Nisa", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Ponte de Sor", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Portalegre", :district_id => aux.first.id
aux = District.where(:name => "Portalegre")
City.create :city => "Sousel", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Amarante", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Baião", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Felgueiras", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Gondomar", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Lousada", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Maia", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Marco de Canaveses", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Matosinhos", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Paços de Ferreira", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Paredes", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Penafiel", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Porto", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Póvoa de Varzim", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Santo Tirso", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Valongo", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Vila do Conde", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Vila Nova de Gaia", :district_id => aux.first.id
aux = District.where(:name => "Porto")
City.create :city => "Trofa", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Abrantes", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Alcanena", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Almeirim", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Alpiarça", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Benavente", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Cartaxo", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Chamusca", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Constância", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Coruche", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Entroncamento", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Ferreira do Zezêre", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Golegã", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Mação", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Rio Maior", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Salvaterra de Magos", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Santarém", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Sardoal", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Tomar", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Torres Novas", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Vila Nova da Barquinha", :district_id => aux.first.id
aux = District.where(:name => "Santarém")
City.create :city => "Ourém", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Alcácer do Sal", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Alcochete", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Almada", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Barreiro", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Grândola", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Moita", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Montijo", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Palmela", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Santiago do Cacém", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Seixal", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Sesimbra", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Setúbal", :district_id => aux.first.id
aux = District.where(:name => "Setúbal")
City.create :city => "Sines", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Arcos de Valdevez", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Caminha", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Melgaço", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Monção", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Paredes de Coura", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Ponte da Barca", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Ponte de Lima", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Valença", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Viana do Castelo", :district_id => aux.first.id
aux = District.where(:name => "Viana do Castelo")
City.create :city => "Vila Nova de Cerveira", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Alijó", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Boticas", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Chaves", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Mesão Frio", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Mondim de Basto", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Montalegre", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Murça", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Peso da Régua", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Ribeira de Pena", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Sabrosa", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Sta Marta de Penaguião", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Valpaços", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Vila Pouca de Aguiar", :district_id => aux.first.id
aux = District.where(:name => "Vila Real")
City.create :city => "Vila Real", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Armamar", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Carregal do Sal", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Castro Daire", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Cinfães", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Lamego", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Mangualde", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Moimenta da Beira", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Mortágua", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Nelas", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Oliveira de Frades", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Penalva do Castelo", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Penedono", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Resende", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Santa Comba Dão", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "São João da Pesqueira", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "São Pedro do Sul", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Sátão", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Sernancelhe", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Tabuaço", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Tarouca", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Tondela", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Vila Nova de Paiva", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Viseu", :district_id => aux.first.id
aux = District.where(:name => "Viseu")
City.create :city => "Vouzela", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Calheta", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Câmara de Lobos", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Funchal", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Machico", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Ponta do Sol", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Porto Moniz", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Ribeira Brava", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Santa Cruz", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Santana", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "São Vicente", :district_id => aux.first.id
aux = District.where(:name => "R. A. da Madeira")
City.create :city => "Porto Santo", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Vila do Porto", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Lagoa", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Nordeste", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Ponta Delgada", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Povoação", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Ribeira Grande", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Vila Franca do Campo", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Angra do Heroísmo", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Praia da Vitória", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Santa Cruz da Graciosa", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Calheta", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Velas", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Lajes do Pico", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Madalena", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "São Roque do Pico", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Horta", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Lajes das Flores", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Santa Cruz das Flores", :district_id => aux.first.id
aux = District.where(:name => "R. A. dos Açores")
City.create :city => "Corvo", :district_id => aux.first.id

Category.delete_all
Category.create(name: "Agricultura", description: "Produtos Agricolas", color: "009400")
Category.create(name: "Pecuária", description: "Produtos de origem animal", color: "30cf4b")
Category.create(name: "Caça", description: "Produtos de Caça", color: "ffaa00")
Category.create(name: "Pesca", description: "Produtos de Pesca", color: "3069ff")


SubCategory.delete_all
aux = Category.where(:name => "Agricultura")
SubCategory.create :name => "Fruta", :category_id => aux.first.id
aux = Category.where(:name => "Agricultura")
SubCategory.create :name => "Leguminosas", :category_id => aux.first.id
aux = Category.where(:name => "Agricultura")
SubCategory.create :name => "Flores", :category_id => aux.first.id
aux = Category.where(:name => "Agricultura")
SubCategory.create :name => "Decoração", :category_id => aux.first.id
aux = Category.where(:name => "Agricultura")
SubCategory.create :name => "Outros", :category_id => aux.first.id
aux = Category.where(:name => "Pecuária")
SubCategory.create :name => "Animais", :category_id => aux.first.id
aux = Category.where(:name => "Pecuária")
SubCategory.create :name => "Apicultura", :category_id => aux.first.id
aux = Category.where(:name => "Pecuária")
SubCategory.create :name => "Produtos lácteos", :category_id => aux.first.id
aux = Category.where(:name => "Pecuária")
SubCategory.create :name => "Outros", :category_id => aux.first.id
aux = Category.where(:name => "Caça")
SubCategory.create :name => "Equipamento", :category_id => aux.first.id
aux = Category.where(:name => "Caça")
SubCategory.create :name => "Outros", :category_id => aux.first.id
aux = Category.where(:name => "Pesca")
SubCategory.create :name => "Canas", :category_id => aux.first.id
aux = Category.where(:name => "Pesca")
SubCategory.create :name => "isco", :category_id => aux.first.id
aux = Category.where(:name => "Pesca")
SubCategory.create :name => "Pescado", :category_id => aux.first.id
aux = Category.where(:name => "Pesca")
SubCategory.create :name => "Outros", :category_id => aux.first.id

PriceType.delete_all
PriceType.create(name: "€/Kg")
PriceType.create(name: "€/L")
PriceType.create(name: "€/Unidade")
PriceType.create(name: "€ Total")
PriceType.create(name: "€/Arroba")
PriceType.create(name: "€/Saco")

Plan.delete_all
Plan.create(name: "Regular", duration: "-1", price: "0", ads_limit: 5, event_limit: 1)
Plan.create(name: "Horta", duration: "6", price: "3,99", ads_limit: 5, event_limit: 1)
Plan.create(name: "Quinta", duration: "6", price: "7,49", ads_limit: 10, event_limit: 2)
Plan.create(name: "Herdade", duration: "6", price: "13,49", ads_limit: 20, event_limit: 4)