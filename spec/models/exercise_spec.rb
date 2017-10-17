require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { should belong_to(:workout) }
  it { should have_many(:sets) }
  it { should have_many(:reps) }
end
