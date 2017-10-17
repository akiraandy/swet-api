require 'rails_helper'

RSpec.describe Rep, type: :model do

  it { should validate_presence_of(:weight) }

  it { should belong_to(:set) }
  
end
