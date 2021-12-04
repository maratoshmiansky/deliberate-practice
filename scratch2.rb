# Scratchwork for CRaKN takehome assignment

#1 Calculate correct age at death

class CalculateAge
  def self.calculate(age_at_birth, age_at_death)
    age_at_death.year - age_at_birth.year - ((age_at_death.mon < age_at_birth.mon) || (age_at_death.mon == age_at_birth.mon && age_at_death.mday < age_at_birth.mday) ? 1 : 0)  # 1) subtract birth year from death year to get initial value; 2) subtract 1 from initial value IF death month < birth month OR (death month = birth month AND death day < birth day) to get correct age in years; 3) return correct age
  end
end

require 'date'

p CalculateAge.calculate(Date.new(1972, 10, 19), Date.new(2072, 10, 18))  # => 99
p CalculateAge.calculate(Date.new(1972, 10, 19), Date.new(2072, 10, 19))  # => 100
p CalculateAge.calculate(Date.new(1972, 10, 19), Date.new(2073, 3, 12))  # => 100
p CalculateAge.calculate(Date.new(1950, 1, 1), Date.new(2038, 12, 31))  # => 88
p CalculateAge.calculate(Date.new(1950, 1, 1), Date.new(2039, 1, 1))  # => 89
p CalculateAge.calculate(Date.new(1950, 1, 1), Date.new(2040, 6, 3))  # => 90
