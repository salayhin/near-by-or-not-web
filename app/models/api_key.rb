Rails.application.config.active_record.belongs_to_required_by_default = false
class ApiKey < ActiveRecord::Base
  #attr_accessor :access_token, :expires_at, :user_id, :is_active
  before_create :generate_access_token
  before_create :set_expiration
  belongs_to :user, optional: true

  def expired?
    DateTime.now >= self.expires_at
  end

  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

  def set_expiration
    self.expires_at = DateTime.now + 30
  end
end