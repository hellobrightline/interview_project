require 'rails_helper'

RSpec.describe Exercise do
  describe '.find' do
    it 'returns the exercise with the given id' do
      exercise = described_class.find(:self_calming_through_relaxation_handout)
      expect(exercise.id).to eq(:self_calming_through_relaxation_handout)
    end

    it 'works with strings and symbols' do
      expect(described_class.find(:self_calming_through_relaxation_handout))
        .to eq(described_class.find('self_calming_through_relaxation_handout'))
    end
  end
end
