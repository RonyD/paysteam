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

class Company < ActiveRecord::Base

  #
  # Attirbutes
  #
  attr_accessible :code, :name

  #
  # Validations
  #
  validates :code, presence: true, :uniqueness => { case_sensitive: true }
  validates :name, presence: true, :uniqueness => { case_sensitive: true }
end
