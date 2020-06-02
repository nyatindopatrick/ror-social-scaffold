require 'rails_helper'

RSpec.describe Friendship, type: :model do
  context "Friendship user associations" do
    it { should belong_to(:user) }
  
  end
  
end
