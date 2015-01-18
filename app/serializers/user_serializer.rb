class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name , :current_status, :current_project
end
