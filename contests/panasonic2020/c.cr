# Panasonic 2020 C - Sqrt Inequality
# https://atcoder.jp/contests/panasonic2020/tasks/panasonic2020_c

a, b, c = read_line.split.map(&.to_i64)

if a**2 + b**2 + c**2 - 2_i64 * (a * b + b * c + c * a) > 0 && a + b < c
  puts "Yes"
else
  puts "No"
end
