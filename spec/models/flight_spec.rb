require 'rails_helper'

RSpec.describe Flight, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:departs_at) }
      
    end
end
