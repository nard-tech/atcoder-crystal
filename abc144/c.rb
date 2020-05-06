# ABC 144 C - Walk on Multiplication Table
# https://atcoder.jp/contests/abc144/tasks/abc144_c

# TLE
# https://atcoder.jp/contests/abc144/submissions/12895530

require 'prime'

n = gets.chomp.to_i

def divisors(x)
  list = [1]
  primes = []

  Prime.prime_division(x).each do |prime|
    base, power = prime
    power.times do
      primes << base
    end
  end

  1.upto(primes.size) do |i|
    primes.combination(i).to_a.uniq do |prime|
      list << prime.inject(:*)
    end
  end

  list.sort!

  return list
end

result = 10**12 + 1
divisors = divisors(n)

# puts divisors

divisors.select { |i| i <= n / 2 }.each do |divisor|
  another_divisor = n / divisor
  i = divisor + another_divisor
  if result > i
    result = i
  end
end

puts result - 2
