# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  email         :string(255)
#  password_salt :string(255)
#  password_hash :string(255)
#  title         :string(255)
#  telephone     :string(255)
#  address_1     :string(255)
#  address_2     :string(255)
#  city          :string(255)
#  country       :string(255)
#  postal_code   :string(255)
#  company_id    :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User < ActiveRecord::Base

  #
  # Associations
  #
  belongs_to :company

  #
  # Attributes
  #
  attr_accessible :address_1, :address_2, :city, :company_id, :country, :email, 
                  :first_name, :last_name, :postal_code, :telephone, :title,
                  :password

  attr_accessor :password

  #
  # Callbacks
  #
  before_save { self.email.downcase! }
  before_save :encrypt_password

  #
  # Validations
  #
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, :uniqueness => { case_sensitive: false }
  validates :password, presence: true

  private
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)

    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
end
