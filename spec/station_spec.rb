# frozen_string_literal: true

require './lib/station'

describe Station do
  subject { described_class.new(name: 'kingscross', zone: 1) }

  it 'exposes zone when new station created' do
    expect(subject.zone).to eq(1)
  end

  it 'exposes name when new station created' do
    expect(subject.name).to eq('kingscross')
  end
end
