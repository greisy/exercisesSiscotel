class UserRegistration
	attr_reader :user

	def initialize(params, numero)
		@user = User.new(params)
		@role = numero
	end
	def create
		set_role
		user.save
	end

	private

	def set_role
		debugger
		if @role == 1
			role = Role.find_by(name: "cliente")
			user.role_id = role.id
		elsif @role == 2
			role = Role.find_by(name: "asesor")
			user.role_id = role.id
		elsif @role == 3
			role = Role.find_by(name: "admin")
			user.role_id = role.id
		end
	end

end