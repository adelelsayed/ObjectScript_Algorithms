#python3

memo={0:0,1:1,2:1}
def fib(n):
    if n not in memo.keys():memo[n]= fib(n-1)+fib(n-2)
    return memo[n]