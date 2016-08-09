class Article < ActiveRecord::Base
	validates :title, presence: { message: "El título no puede estar en vacio" }
	validates :body, length: {minimum: 20}, presence: { message: "El cuerpo no puede estar en blanco" }
	
	before_create :set_visits_count

	private
	def set_visits_count
		self.visits_count ||= 0
	end
end
