require 'rails_helper'

RSpec.describe Workout, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:exercises) }
  it { should have_many(:sets) }
  it { should have_many(:reps) }
  it { should validate_presence_of(:title) }
end
