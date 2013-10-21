class User < ActiveRecord::Base
  # Properties
  # :email, :name, :preferred_mail, :twitter, :password, :password_digest, :provider
  #
  
  attr_accessible :email, :name, :preferred_mail, :twitter, :password, :password_digest, :city, :state, :country
#   has_secure_password
  has_many :terms
  
#   validates :email, :uniqueness => true

  def self.from_omniauth(auth)
    find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end
end
