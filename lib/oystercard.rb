# frozen_string_literal: true

class Oystercard
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  MINIMUM_CHARGE = 1
  attr_reader :balance, :entry_station

  def initialize
    @balance = 0
    @entry_station = nil
  end

  def top_up(amount)
    raise "maximum balance of #{MAXIMUM_BALANCE} exceeded" if amount + @balance > MAXIMUM_BALANCE

    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance, minimum balance is #{MINIMUM_CHARGE}" if @balance < MINIMUM_CHARGE
    @entry_station = station 
    end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
    end

    def in_journey?
      !!@entry_station
    end

    private 
  def deduct(amount)
    @balance -= amount
  end
end
