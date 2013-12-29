class SearchController < ApplicationController

	#ver um tipo de resposta standard
	# { :id, :title, :tipo, :categoria}
	def search_for_all
		
		@names = []
		search_in_ads #search in ads
		search_in_tutorial #search in tuturias
		search_in_workshops #search in workshop
		search_in_questions #search in questons

		render json: @names
	end


	# Search TUTORIALS, search by city and category
	def search_tutorials
		@names = []

		search_categories #search in categories

		render json: @names
	end

	private 
		def search_in_ads
			ads = Ad.all

			ads.each do |a|
				@names << {:id => a.id, :title => a.title, :category => a.category.name, :img => a.first_image,:tipo => "Anuncio"}
			end

		end

		def search_in_tutorial
			tutorials = Academy::Tutorial.all

			tutorials.each do |t|
				@names << {:id => t.id, :title => t.title, :category => t.category.name,:tipo => "Tutorial"}
			end
		end

		def search_in_workshops

		end

		def search_in_questions
			question = Academy::Question.all

			question.each do |q|
				@names << {:id => q.id, :title => q.title, :category => q.category.name, :img => "http://placehold.it/40x30",:tipo => "Pergunta"}
			end
		end

		def search_cities
			cities = City.all

			cities.each do |c|
				@names << {:id => c.id, :name => c.city}
			end
		end

		def search_categories
			categories = Category.all

			categories.each do |c|
				@names << {:id => c.id, :name => c.name}
			end


		end
end
