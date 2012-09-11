# == Schema Information
#
# Table name: workgroups
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Workgroup do

  before { @workgroup = Workgroup.new(name: "General") }

  subject { @workgroup }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is blank" do
    before { @workgroup.name = "" }
    it { should_not be_valid }
  end

  describe "when name is not unique" do
    before do
      workgroup_with_same_name = @workgroup.dup
      workgroup_with_same_name.name = @workgroup.name.downcase
      workgroup_with_same_name.save
    end

    it { should_not be_valid }
  end
end
