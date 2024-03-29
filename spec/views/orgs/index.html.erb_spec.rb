require 'spec_helper'

describe "orgs/index.html.erb" do
  before(:each) do
    assign(:orgs, [
      stub_model(Org,
        :name => "Name"
      ),
      stub_model(Org,
        :name => "Name"
      )
    ])
  end

  it "renders a list of orgs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
