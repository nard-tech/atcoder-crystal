# ABC 127 D - Integer Cards
# https://atcoder.jp/contests/abc127/tasks/abc127_d

n, m = read_line.split.map(&.to_i64)
a = read_line.split.map(&.to_i64)
bn_and_cn = Array.new(m) { read_line.split.map(&.to_i64) }

bn_and_cn.each do |b_and_c|
  a = a.sort
  b, c = b_and_c

  0.upto(b - 1) do |i|
    if a[i] < c
      a[i] = c
    end
  end
end

sum = a.reduce { |acc, i| acc + i }
puts sum
