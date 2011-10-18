require 'spec_helper'

describe "messages/edit.html.erb" do
  before(:each) do
    @message = assign(:message, stub_model(Message,
      :author_id => 1,
      :org_id => 1,
      :desc => "MyText",
      :state => "MyString"
    ))
  end

  it "renders the edit message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => messages_path(@message), :method => "post" do
      assert_select "input#message_author_id", :name => "message[author_id]"
      assert_select "input#message_org_id", :name => "message[org_id]"
      assert_select "textarea#message_desc", :name => "message[desc]"
      assert_select "input#message_state", :name => "message[state]"
    end
  end
end
