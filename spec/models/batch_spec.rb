require 'rails_helper'

RSpec.describe Batch, type: :model do
  it { should belong_to(:exercise) }
  it { should have_many(:reps) }
end
