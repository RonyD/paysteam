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
require 'digest/md5'

describe Company do
  
  before { @company = Company.new(code: 'ABCD12345', name: 'Acme Inc.') }

  subject { @company }

  it { should respond_to(:code) }
  it { should respond_to(:name) }

  it { should be_valid }

  describe 'before save code is hashed' do
    it "should be valid" do
      @company.save
      @company.code.should_not be_empty
      @company.code.should == Digest::MD5.hexdigest(@company.name)
    end
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