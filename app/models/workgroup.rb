# == Schema Information
#
# Table name: workgroups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Workgroup < ActiveRecord::Base
  #
  # Attributes
  #
  attr_accessible :name

  #
  # Validations
  #
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
