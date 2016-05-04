class Article < ActiveRecord::Base
	validates :title, presence: { message: "El título no puede estar en vacio" }
	validates :body, length: {minimum: 20}, presence: { message: "El cuerpo no puede estar en blanco" }

end
