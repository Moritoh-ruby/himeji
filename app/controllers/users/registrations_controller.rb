class Users::RegistrationsController < Devise::RegistrationsController
 
  def build_resource(hash=nil)
    hash[:id] = User.create_unique_string
    super
  end
 
end
