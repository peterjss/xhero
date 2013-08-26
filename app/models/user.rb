class User < ActiveRecord::Base
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(username, submitted_password)
    user = find_by_username(username)
    return nil if user.nil?
    #return user if user.has_password?(submitted_password)
    return user
  end
  
end
