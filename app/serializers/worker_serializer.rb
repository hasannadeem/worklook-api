class WorkerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :company_name
end
