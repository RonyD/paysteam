class User < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :city, :company_id, :country, :email, :first_name, :last_name, :password_hash, :password_salt, :postal_code, :telephone, :title
end
