Class Custom.Algorithms.DynamicProgramming.DiscreteKnapsackWORepetition
{

/// Description
ClassMethod OptimalWeight(capacity As %Integer, values As %List) As %Integer
{
    Set retVal = 0
    if $ll(values)=0 return 0
    if $ll(values)=1 return capacity*$lg(values,1)
    do ##class(Custom.Algorithms.divideAndconquer.sorting.QuickSort).QuickSortTwoWay(.values,1,$ll(values))
    set w=0
    set Arr=""
    for ix=1:1:$ll(values){   
        set currentValue=$lg(values,ix) 
        for w=1:1:capacity {
            if (currentValue<=w) {
                set Arr(ix,w)=##class(Ens.Util.FunctionSet).Max($g(Arr(ix-1,w)), currentValue+$g(Arr(ix-1,w-currentValue)))
            }else{
                set Arr(ix,w)=$g(Arr(ix-1,w))
            }

        }
    }
    set retIdx=$O(Arr(""),-1)
    set retIdxNode=$O(Arr(retIdx,""),-1)
    set retVal=$g(Arr(retIdx,retIdxNode))
    Return retVal
}

/// Description
ClassMethod optimalWeightPy(capacity, values) As %Integer [ Language = python ]
{
    def optimal_weight(W, wt):
        if len(wt)==0:return 0
        if len(wt)==1:return wt[0]*W
        wt.sort()
        K=[[0]*(W+1) for z in range(len(wt)+1)]
        for i in range(len(wt)+1):
            for w in range(W+1):
                if i == 0 or w == 0:
                    K[i][w] = 0
                elif wt[i-1] <= w:
                    K[i][w] = max(wt[i-1]
                            + K[i-1][w-wt[i-1]], 
                                K[i-1][w])
                else:
                    K[i][w] = K[i-1][w]

        return K[-1][-1]
    valuesList=list(map(lambda x:int(x),values.split("^")))
    return optimal_weight(capacity,valuesList)
}

}
