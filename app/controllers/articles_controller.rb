class ArticlesController < ApplicationController
	#get /articles
	def index
		@articles = Article.all
	end
	#get /articles/:id
	#existe un hash global que se llama params que almacena los datos pasados al servidor, en este caso el :id
	def show
		@article = Article.find(params[:id])
	end
	#get /articles/new
	def new
		#es una instancia del modelo pero no es persistente porque no esta en la BD
		@article = Article.new #no se guarda en la BD se guarda en la memoria
	end
	#post /articles
	def create

	end
end
