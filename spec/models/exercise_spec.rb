require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { should belong_to(:workout) }
  it { should have_many(:sets) }
  it { should have_many(:reps) }

  it { should validate_presence_of(:name) }
end
