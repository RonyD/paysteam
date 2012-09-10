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

require 'spec_helper'

describe User do
  
  before { @user = User.new(first_name: 'John', last_name: 'Doe', 
                            email: 'johndoe@gmail.com', title: 'Manager', 
                            telephone: '18001234567', address_1: 'Flat 1', 
                            address_2: 'Street 1', city: 'London', country: 'UK', 
                            postal_code: 'N1', company_id: 1, password: 'admin') }

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_salt) }
  it { should respond_to(:password_hash) }
  it { should respond_to(:title) }
  it { should respond_to(:telephone) }
  it { should respond_to(:address_1) }
  it { should respond_to(:address_2) }
  it { should respond_to(:city) }
  it { should respond_to(:country) }
  it { should respond_to(:postal_code) }
  it { should respond_to(:company) }

  it { should be_valid }

  describe 'when first name is blank' do
    before { @user.first_name = '' }
    it { should_not be_valid }
  end

  describe 'when last name is blank' do
    before { @user.last_name = '' }
    it { should_not be_valid }
  end

  describe 'when email is blank' do
    before { @user.email = '' }
    it { should_not be_valid }
  end

  describe 'when password is blank' do
    before { @user.password = '' }
    it { should_not be_valid }
  end

  describe 'when company is nil' do
    before { @user.company = nil }
    it { should_not be_valid }
  end

end
