class User < ApplicationRecord
  before_create :create_remember_token
  has_secure_password

  private

    def create_remember_token
      token = SecureRandom.urlsafe_base64.to_s
      self.remember_token = Digest::SHA1.hexdigest(token)
    end
end
