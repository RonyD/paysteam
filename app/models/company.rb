# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  code       :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'digest/md5'

class Company < ActiveRecord::Base

  #
  # Associations
  #
  has_many :users

  #
  # Attirbutes
  #
  attr_accessible :code, :name

  #
  # Callbacks
  #
  before_save :generate_company_code, :on => :create

  #
  # Validations
  #
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private
  def generate_company_code
    self.code = Digest::MD5.hexdigest(self.name)
  end
end
