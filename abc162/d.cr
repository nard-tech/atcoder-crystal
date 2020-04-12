# ABC 162 D - RGB Triplets
# https://atcoder.jp/contests/abc162/tasks/abc162_d

n = read_line.to_i64
s = read_line

rgb = s.split(//).map(&.to_s).to_a

# puts rgb

def generate_index_array(a : Array(String))
  r_indexes = [] of Int64
  g_indexes = [] of Int64
  b_indexes = [] of Int64

  a.each_with_index do |str, i|
    r_indexes.push(i.to_i64) if str == "R"
    g_indexes.push(i.to_i64) if str == "G"
    b_indexes.push(i.to_i64) if str == "B"
  end

  [r_indexes, g_indexes, b_indexes]
end

def count_combinations(a1 : Array(Int64), a2 : Array(Int64), a3 : Array(Int64))
  count = 0_i64
  a1.each do |i1|
    a2_larger_than_i1 = select_larger_than(i1, a2)
    a2_larger_than_i1.each do |i2|
      diff_of_i2_and_i1 = i2 - i1
      a3_larger_than_i2 = select_larger_than(i2, a3).select { |i3| i3 - i2 != diff_of_i2_and_i1 }
      count += a3_larger_than_i2.size
    end
  end
  count
end

def select_larger_than(n : Int64, array : Array(Int64))
  first_index = array.bsearch_index { |x, i| x > n }
  if first_index.nil?
    [] of Int64
  else
    array[first_index..-1]
  end
end

r, g, b = generate_index_array(rgb)

products = [] of Array(Int64)
products += Array.product(r, g, b)
products += Array.product(r, b, g)
products += Array.product(g, r, b)
products += Array.product(g, b, r)
products += Array.product(b, r, g)
products += Array.product(b, g, r)

# puts products

puts products.select { |array|
  a, b, c = array
  a < b < c && b - a != c - b
}.size
