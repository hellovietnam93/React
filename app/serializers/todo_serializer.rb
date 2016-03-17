class TodoSerializer < ActiveModel::Serializer
  attributes :id, :name, :checked
end
