require 'spec_helper'

describe "workgroups/show" do
  before(:each) do
    @workgroup = assign(:workgroup, stub_model(Workgroup,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
