$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  counter = 0
  stooges = []

  while counter < source.count do
    director_hash = source[counter]
    director_name = director_hash[:name]
    counter += 1
    stooges << director_name
  end
  stooges
end



def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total

  total = 0
  counter = 0

  dir_list = list_of_directors(source)
  while counter < dir_list.count do
    dir_name = dir_list[counter]
    totals_hash = directors_totals(source)
    total += totals_hash[dir_name]
    counter += 1
  end

  total

end
