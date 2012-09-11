require 'spec_helper'

describe "workgroups/new" do
  before(:each) do
    assign(:workgroup, stub_model(Workgroup,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new workgroup form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => workgroups_path, :method => "post" do
      assert_select "input#workgroup_name", :name => "workgroup[name]"
    end
  end
end
