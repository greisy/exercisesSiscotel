#activerecord es una interfaz que mapea las tablas de la BD con las clases, los objectos con los registros y los datos con los atributos de esos objetos, a través de objetos.
class Article < ActiveRecord::Base
	validates :title, presence: { message: "El título no puede estar en vacio" }
	validates :body, length: {minimum: 20}, presence: { message: "El cuerpo no puede estar en blanco" }
	belongs_to :user
	has_many :comments
	
	#before_save :set_visits_count
	before_create :set_visits_count
	def update_visits_count

		self.save if self.visits_count.nil?
		aux = self.visits_count + 1
		self.update(visits_count: aux ) 
	end

	private

	def set_visits_count
		self.visits_count ||= 0
	end
end
