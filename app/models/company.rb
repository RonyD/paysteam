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
  has_many :workgroups

  accepts_nested_attributes_for :users
  accepts_nested_attributes_for :workgroups

  #
  # Attirbutes
  #
  attr_accessible :code, :name, :users_attributes, :workgroups_attributes

  #
  # Callbacks
  #
  before_save :create_default_workgroup, :on => :create
  before_save :generate_company_code, :on => :create

  #
  # Validations
  #
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  private
  def create_default_workgroup
    self.workgroups.build(name: "General")  
  end

  def generate_company_code
    self.code = Digest::MD5.hexdigest(self.name)
  end
end
