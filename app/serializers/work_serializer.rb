class WorkSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :deadline
end
