class UserSerializer < ActiveModel::Serializer
  attributes :id,
    :current_project,
    :current_status,
    :email,
    :first_name,
    :has_pairing,
    :last_name

  def has_pairing
    scope && scope.pairings.pluck(:pair_id).include?(object.id)
  end
end
