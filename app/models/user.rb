class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  #Always create a random remember token before creating a new user
  before_create :generate_remember_token
  has_secure_password

  def remember(token)
    generate_remember_token(token)
    self.save
    token
  end

  private
    #Generate a remember token for future logins
    def generate_remember_token(token = SecureRandom.urlsafe_base64)
      self.remember_token = Digest::SHA1.hexdigest(token)
    end
end
