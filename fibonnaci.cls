Class Custom.Algorithms.Fibonnaci
{

ClassMethod setUpMemo() [ PublicList = memo ]
{
        set memo(0)=0
        set memo(1)=1
        set memo(2)=1
}

ClassMethod fibbonacci(n As %Integer) As %Integer [ PublicList = memo ]
{
    // prone to framestack error
    //works as a routine see $$fibbonacci^Custom.algorithm.fibo()
    if '$d(memo(n)) set memo(n)= (..fibbonacci(n-1)+..fibbonacci(n-2))
    return $g(memo(n))
}

}
