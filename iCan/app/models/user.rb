class User < ActiveRecord::Base
	has_secure_password
  belongs_to :role
  #before_create :set_role

  Roles = [:cliente, :asesor, :admin]

  def role?(role_name)
    role = Role.find_by(name: role_name)
    self.role_id == role.id
  end

end
