require 'spec_helper'
describe ApplicationHelper do
  describe "#bootstrap_class_for" do
    it "returns a CSS class name for bootstrap" do
      expect(helper.bootstrap_class_for('success')).to eq("alert-success")
    end
  end 

    describe "#flash_messages" do
    it "restructurize flash messages with bootstrap styles and retunds nil" do
      flash[:success] = "some success message"
      expect(helper.flash_messages).to be_nil
    end
  end
end
