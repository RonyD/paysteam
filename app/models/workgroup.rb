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
  # Assoications
  #
  belongs_to :company

  #
  # Attributes
  #
  attr_accessible :name, :company_id

  #
  # Global Variables
  #
  @@current_company

  #
  # Validations
  #
  validates :name, presence: true
  validate :unique_workgroup_name_per_company

  private
  def unique_workgroup_name_per_company
    @current_company = Company.find(self.company_id)
    if @current_company.workgroups.find_by_name(self.name)
      errors.add(:name, "already exists.")
    end
  end
end
