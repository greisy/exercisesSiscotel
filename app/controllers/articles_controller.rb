class ArticlesController < ApplicationController
	#before_action :validate_user, except: [:show, :index]
	before_action :authenticate_user!, only: [:create, :new, :update, :edit, :destroy]
	before_action :set_article, except: [:new, :index, :create]

	#get /articles
	def index
		@articles = Article.all
	end
	#get /articles/:id
	#existe un hash global que se llama params que almacena los datos pasados al servidor, en este caso el :id
	def show
		@article.update_visits_count
		@comment = Comment.new
	end
	#get /articles/new
	def new
		#es una instancia del modelo pero no es persistente porque no esta en la BD
		@article = Article.new #no se guarda en la BD se guarda en la memoria
	end

	#get /articles/:id/edit/
	def edit
		
	end
	#post /articles
	def create
		#@article = Article.new(title: params[:article][:title], body: params[:article][:body])
		@article = current_user.articles.new(article_params)
		if @article.save
			redirect_to @article #se dirige a la vista show con la variable de instancia @article creada aqui
		else
			render :new #se mantiene la variable de instancia creada en esta acción para cuando renderice new
		end
	end

	def update
		@article = Article.find(params[:id])
		if @article.update(article_params)
		  #render :show
		  redirect_to @article
		else
		  render :edit		
		end
	end

	def destroy
		@article = Article.find(params[:id])

		@article.destroy

		redirect_to articles_path
	end

	private

	def article_params
		#{
		#	article:{
		#		title: "bla",
		#		body: "bla2"
		#	}
		#}
		params.require(:article).permit(:title,:body)
	end
	#def validate_user
	#	redirect_to new_user_session_path, notice: "Necesita estar autenticado"
	#end
	def set_article
		@article = Article.find(params[:id])
	end
end

#where devuelve un arreglo de objetos
#Article.where("title LIKE ?", "%articulo%")
#Article.where.not("id = params[:id]")

#find devuelve el primer objeto que encuentre cumpliendo esa condición
#Article.find_by(title: 'Segundo articulo')