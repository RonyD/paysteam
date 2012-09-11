require 'spec_helper'

describe "workgroups/index" do
  before(:each) do
    assign(:workgroups, [
      stub_model(Workgroup,
        :name => "Name"
      ),
      stub_model(Workgroup,
        :name => "Name"
      )
    ])
  end

  it "renders a list of workgroups" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
