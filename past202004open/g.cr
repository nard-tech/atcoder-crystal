# 第二回 アルゴリズム実技検定 過去問 G - ストリング・クエリ
# https://atcoder.jp/contests/past202004-open/tasks/past202004_g

# TLE
# https://atcoder.jp/contests/past202004-open/submissions/12820388

q = read_line.to_i64
queries = Array.new(q) { read_line.split }

s = ""

def calc_deleted_chars_index(deleted_chars : String, square_dict : Hash(Int64, Int64), chars_dict : Hash(String, Int64)) : Int64
  n = 0_i64
  return chars_dict[deleted_chars] if chars_dict.has_key?(deleted_chars)
  a = deleted_chars.split(//)
  # puts a.inspect
  h = a.group_by(&.itself)
  # puts h.inspect
  h.each do |k, v|
    next if k == ""
    i = v.size.to_i64
    square_dict[i] = i ** 2 unless square_dict.has_key?(i)
    n += square_dict[i]
  end
  chars_dict[deleted_chars] = n
  n
end

square_dict = Hash(Int64, Int64).new
chars_dict = Hash(String, Int64).new

queries.each do |query|
  if query.first == "1"
    c = query[1]
    x = query[2].to_i64
    s += c * x
  else
    d = query[1].to_i64
    # puts "s: #{s} (size: #{s.size}), d: #{d}"
    if s.size <= d
      deleted_chars = s.dup
      s = ""
    elsif s == ""
      deleted_chars = ""
      s = ""
    else
      deleted_chars = s[0..(d - 1)].dup
      s = s[d..-1]
    end

    puts calc_deleted_chars_index(deleted_chars, square_dict, chars_dict)
  end
end