# frozen_string_literal: true

require 'oystercard'

describe Oystercard do
  it 'it had a balance of zero' do
    expect(subject.balance).to eq(0)
  end

  it 'it top up the card with an amount' do
    expect(subject).to respond_to(:top_up).with(1).argument
    # expect(subject.top_up(10)).to eq 10
    # expect { subject.top_up 10 }.to change { subject.balance }.by 10
  end

  it 'raises error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    # oystercard = Oystercard.new
    subject.top_up(90)
    expect { subject.top_up(1) }.to raise_error "maximum balance of #{maximum_balance} exceeded"
  end

  it 'deducts amount from the balance' do
    subject.top_up(10)
    expect(subject.deduct(5)).to eq 5
  end

  it { is_expected.to respond_to(:deduct).with(1).argument }
 
  it { is_expected.to respond_to(:touch_in) }
  it { is_expected.to respond_to(:touch_out) }

  it 'Allows me to touch in' do
    expect(subject.touch_in).to eq true
  end

  it 'Allow me to touch out' do
    subject.touch_in
    expect(subject.touch_out).to eq false
  end

  it 'when I get a new card it is not in journey' do
    expect(subject.in_journey).to eq false
  end
end
