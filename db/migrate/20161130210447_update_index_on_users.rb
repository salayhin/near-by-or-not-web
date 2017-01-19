class UpdateIndexOnUsers < ActiveRecord::Migration[5.0]
  def up
    #sql = 'DROP INDEX users.index_users_on_email' if Rails.env == 'production'
    #sql << ' ON users' if Rails.env == 'production' # Heroku pg
    #ActiveRecord::Base.connection.execute('DROP INDEX users.index_users_on_email') if Rails.env == 'production'
  end
end
