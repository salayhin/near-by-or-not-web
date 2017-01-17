class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token,      null: true
      t.integer :user_id,          null: true
      t.boolean :is_active,           null: false, default: true
      t.datetime :expires_at,       null: true

      t.timestamps
    end

    add_index :api_keys, ['user_id'], name: 'index_api_keys_on_user_id', unique: false
    add_index :api_keys, ['access_token'], name: 'index_api_keys_on_access_token', unique: true
  end
end
