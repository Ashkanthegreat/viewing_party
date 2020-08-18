class User < ApplicationRecord
  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    require "pry"; binding.pry
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end
end
