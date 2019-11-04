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
  
  index =0
  director_list = Array.new

  while index < source.size do
    director_list << source[index][:name]
    index += 1
  end
  director_list
  
end

def total_gross(source)
 
  grandTotal = 0
  director_index = 0

  while director_index < source.size do
    grandTotal += gross_for_director(source[director_index])
    director_index += 1
  end
  grandTotal
  
  
end


