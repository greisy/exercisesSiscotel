#activerecord es una interfaz que mapea las tablas de la BD con las clases, los objectos con los registros y los datos con los atributos de esos objetos, a través de objetos.
class Article < ActiveRecord::Base
	include AASM
	validates :title, presence: { message: "El título no puede estar en vacio" }
	validates :body, length: {minimum: 20}, presence: { message: "El cuerpo no puede estar en blanco" }
	belongs_to :user
	has_many :comments
	has_many :has_categories
	has_many :categories, through: :has_categories

	#before_save :set_visits_count
	before_create :set_visits_count
	after_create :save_categories

	has_attached_file :cover, styles: { medium: "1200x700>", thumb: "600x300>" } #este modelo Article tiene un archivo adjunto
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

	#custom setter es un metodo que me permite asignar valor al atributo de un objeto
	def categories=(value)
		@categories = value #aqui categories es una variable de instancia de esta clase no confundir con el controlador OJO	
	end

	def update_visits_count
		self.save if self.visits_count.nil?
		aux = self.visits_count + 1
		self.update(visits_count: aux ) 
	end

	aasm column: "state" do
		#componentes estados
		state :in_draft, initial: true
		state :published

		#transiciones entre estados
		event  :publish do
			transitions from: :in_draft, to: :published unless may_unpublish?
		end

		event :unpublish do
			transitions from: :published, to: :in_draft unless may_publish?
		end

	end

	private

	def save_categories
		@categories.each do |category_id|
			HasCategory.create(article_id: self.id, category_id: category_id)
		end
	end

	def set_visits_count
		self.visits_count ||= 0
	end

end
