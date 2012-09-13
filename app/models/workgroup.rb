# == Schema Information
#
# Table name: workgroups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company_id :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Workgroup < ActiveRecord::Base
  #
  #
  #
  belongs_to :company

  #
  # Attributes
  #
  attr_accessible :name, :company_id

  #
  # Validations
  #
  validates :name, presence: true
end
