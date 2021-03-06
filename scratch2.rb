# Scratchwork for CRaKN takehome assignment

#1 Calculate correct age at death

class CalculateAge
  def self.calculate(age_at_birth, age_at_death)
    return "death date must be greater than birth date" if age_at_birth > age_at_death
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
p CalculateAge.calculate(Date.new(1987, 2, 1), Date.new(1987, 2, 1))  # => 0
p CalculateAge.calculate(Date.new(1987, 2, 1), Date.new(1987, 2, 2))  # => 0
p CalculateAge.calculate(Date.new(1987, 2, 1), Date.new(1987, 1, 1))  # => "death date must be greater than birth date"

#2 Match people (in array of hashes) by first name, middle name and/or last name keyword arguments

# First implementation (classless)

def find_match(first_name: "", middle_name: "", last_name: "")  # set each keyword parameter value to "" by default
  people = [
    { first_name: "Michael", middle_name: "Peter", last_name: "Johnson" },
    { first_name: "Michael", middle_name: "Lawrence", last_name: "Johnson" },
    { first_name: "Jane", middle_name: "Barbara", last_name: "Livingstone" },
    { first_name: "Hannah", middle_name: "Barbara", last_name: "Olsen" },
  ]

  return [] if first_name.empty? && middle_name.empty? && last_name.empty?  # return empty array if no name data passed
  people.select { |person| (person[:first_name] == first_name || first_name.empty?) && (person[:middle_name] == middle_name || middle_name.empty?) && (person[:last_name] == last_name || last_name.empty?) }  # select all people with matching name arguments only (filtering out missing name argument(s))
end

p find_match(first_name: "Michael", last_name: "Johnson")  # => [{:first_name=>"Michael", :middle_name=>"Peter", :last_name=>"Johnson"}, {:first_name=>"Michael", :middle_name=>"Lawrence", :last_name=>"Johnson"}]
p find_match(middle_name: "Barbara")  # => [{:first_name=>"Jane", :middle_name=>"Barbara", :last_name=>"Livingstone"}, {:first_name=>"Hannah", :middle_name=>"Barbara", :last_name=>"Olsen"}]
p find_match(first_name: "Barbara")  # => []
p find_match(first_name: "Jane")  # => [{:first_name=>"Jane", :middle_name=>"Barbara", :last_name=>"Livingstone"}]
p find_match(first_name: "Michael", last_name: "Harris")  # => []
p find_match(first_name: "Michael", middle_name: "Peter", last_name: "Johnson")  # => [{:first_name=>"Michael", :middle_name=>"Peter", :last_name=>"Johnson"}]
p find_match(first_name: "Hannah", middle_name: "Barbara")  # => [{:first_name=>"Hannah", :middle_name=>"Barbara", :last_name=>"Olsen"}]
p find_match(last_name: "Livingstone")  # => [{:first_name=>"Jane", :middle_name=>"Barbara", :last_name=>"Livingstone"}]
p find_match(last_name: "Livingstone", first_name: "Jane")  # => [{:first_name=>"Jane", :middle_name=>"Barbara", :last_name=>"Livingstone"}]
p find_match(middle_name: "Lawrence")  # => [{:first_name=>"Michael", :middle_name=>"Lawrence", :last_name=>"Johnson"}]
p find_match  # => []

# Second implementation (classy)

class PersonMatcher
  attr_reader :people

  def initialize(*people)
    @people = people
  end

  def find_match(first_name: "", middle_name: "", last_name: "")  # set each keyword parameter value to "" by default
    return [] if first_name.empty? && middle_name.empty? && last_name.empty?  # return empty array if no name data passed
    people.select { |person| (person[:first_name] == first_name || first_name.empty?) && (person[:middle_name] == middle_name || middle_name.empty?) && (person[:last_name] == last_name || last_name.empty?) }  # select all people with matching name arguments only (filtering out missing name argument(s))
  end
end

dwight1 = { first_name: "Dwight", middle_name: "Glenn", last_name: "Appleton" }
dwight2 = { first_name: "Dwight", middle_name: "Gerald", last_name: "Appleton" }
autumn = { first_name: "Autumn", middle_name: "Harley", last_name: "Poole" }
noah = { first_name: "Noah", middle_name: "Zaire", last_name: "Waters" }

people = [dwight1, dwight2, autumn, noah]

instance = PersonMatcher.new(*people)

p matches1 = instance.find_match(first_name: "Dwight", last_name: "Appleton")  # => [{:first_name=>"Dwight", :middle_name=>"Glenn", :last_name=>"Appleton"}, {:first_name=>"Dwight", :middle_name=>"Gerald", :last_name=>"Appleton"}]
p matches1.include?(dwight1) && matches1.include?(dwight2) && !matches1.include?(autumn) && !matches1.include?(noah) # => true

p matches2 = instance.find_match(first_name: "Dwight", middle_name: "Gerald", last_name: "Appleton")  # => [{:first_name=>"Dwight", :middle_name=>"Gerald", :last_name=>"Appleton"}]
p matches2.include?(dwight2) && !matches2.include?(dwight1) && !matches2.include?(autumn) && !matches2.include?(noah) # => true

p instance.find_match  # => []

peeps = [
  { first_name: "Michael", middle_name: "Peter", last_name: "Johnson" },
  { first_name: "Michael", middle_name: "Lawrence", last_name: "Johnson" },
  { first_name: "Jane", middle_name: "Barbara", last_name: "Livingstone" },
  { first_name: "Hannah", middle_name: "Barbara", last_name: "Olsen" },
]

mypeeps = PersonMatcher.new(*peeps)

p mypeeps.find_match(first_name: "Michael", last_name: "Johnson")  # => [{:first_name=>"Michael", :middle_name=>"Peter", :last_name=>"Johnson"}, {:first_name=>"Michael", :middle_name=>"Lawrence", :last_name=>"Johnson"}]
p mypeeps.find_match(middle_name: "Barbara")  # => [{:first_name=>"Jane", :middle_name=>"Barbara", :last_name=>"Livingstone"}, {:first_name=>"Hannah", :middle_name=>"Barbara", :last_name=>"Olsen"}]
p mypeeps.find_match(first_name: "Barbara")  # => []
p mypeeps.find_match(first_name: "Jane")  # => [{:first_name=>"Jane", :middle_name=>"Barbara", :last_name=>"Livingstone"}]
p mypeeps.find_match(first_name: "Michael", last_name: "Harris")  # => []
p mypeeps.find_match(first_name: "Michael", middle_name: "Peter", last_name: "Johnson")  # => [{:first_name=>"Michael", :middle_name=>"Peter", :last_name=>"Johnson"}]
p mypeeps.find_match(first_name: "Hannah", middle_name: "Barbara")  # => [{:first_name=>"Hannah", :middle_name=>"Barbara", :last_name=>"Olsen"}]
p mypeeps.find_match(last_name: "Livingstone")  # => [{:first_name=>"Jane", :middle_name=>"Barbara", :last_name=>"Livingstone"}]
p mypeeps.find_match(last_name: "Livingstone", first_name: "Jane")  # => [{:first_name=>"Jane", :middle_name=>"Barbara", :last_name=>"Livingstone"}]
p mypeeps.find_match(middle_name: "Lawrence")  # => [{:first_name=>"Michael", :middle_name=>"Lawrence", :last_name=>"Johnson"}]
p mypeeps.find_match  # => []
