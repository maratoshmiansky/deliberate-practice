# calculate the nth term of the Fibonacci series
def fib(n)
  return "try again" if n < 0
  return 0 if n == 0
  return 1 if n == 1 || n == 2

  fib_terms = [0, 1, 1]
  term_counter = 3 # will be used as a counter until the nth term is calculated

  while term_counter <= n
    fib_terms << fib_terms[-2] + fib_terms[-1] # shovel next term into output array
    fib_terms = fib_terms[-3..-1] # only keeping the last three terms
    term_counter += 1
  end

  fib_terms.last
end

def fib2(n)
  return "try again" if n < 0
  return 0 if n == 0
  return 1 if n == 1 || n == 2

  fib_terms = [0, 1, 1]
  term_counter = 3 # will be used as a counter until the nth term is calculated

  while term_counter <= n
    fib_terms = [fib_terms[-2], fib_terms[-1], fib_terms[-2] + fib_terms[-1]] # keeping the (n - 2)th and (n - 1)th terms and calculating the nth term
    term_counter += 1
  end

  fib_terms.last
end

require 'prime'
require 'benchmark'

p (0..100).map { |n| fib(n) }.select { |n| n.prime? } # outputs array of prime Fibonacci terms (through the 100th term)
# p Benchmark.measure { fib(200000) } # .549 seconds
# p Benchmark.measure { fib(300000) } # 1.138 seconds
# p Benchmark.measure { fib(400000) } # 1.966 seconds
# p Benchmark.measure { fib2(200000) } # .522 seconds
# p Benchmark.measure { fib2(300000) } # 1.127 seconds
# p Benchmark.measure { fib2(400000) } # 1.928 seconds
