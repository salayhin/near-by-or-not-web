class ApiKeySerializer < ActiveModel::Serializer

  attributes :id, :access_token, :user_id, :is_active, :expires_at,
             :created_at, :updated_at
end