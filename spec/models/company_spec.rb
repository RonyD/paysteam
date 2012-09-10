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

require 'spec_helper'

describe Company do
  
  before { @company = Company.new(code: 'ABCD12345', name: 'Acme Inc.') }

  subject { @company }

  it { should respond_to(:code) }
  it { should respond_to(:name) }

  it { should be_valid }

  describe 'when code is blank' do
    before { @company.code = '' }
    it { should_not be_valid }
  end

  describe 'when code is not unique' do
    before do
      company_with_same_code = @company.dup
      company_with_same_code.code = @company.code.upcase
      company_with_same_code.save
    end

    it { should_not be_valid }
  end

  describe 'when name is blank' do
    before { @company.name = '' }
    it { should_not be_valid }
  end

  describe 'when name is not unique' do
    before do
      company_with_same_name = @company.dup
      company_with_same_name.name = @company.name.upcase
      company_with_same_name.save
    end

    it { should_not be_valid }
  end
end