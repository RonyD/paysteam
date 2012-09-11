require 'spec_helper'

describe "workgroups/edit" do
  before(:each) do
    @workgroup = assign(:workgroup, stub_model(Workgroup,
      :name => "MyString"
    ))
  end

  it "renders the edit workgroup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workgroups_path(@workgroup), :method => "post" do
      assert_select "input#workgroup_name", :name => "workgroup[name]"
    end
  end
end
